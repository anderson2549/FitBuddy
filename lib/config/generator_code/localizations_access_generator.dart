import 'dart:async';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';

class LocalizationAccessGenerator extends Generator {
  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {
    // Buscamos la clase AppLocalizations en la librería
    final appLocalizationsClass = library.classes.firstWhere(
      (cls) => cls.name == 'MyLocalizations',
      orElse: () => throw StateError('No se encontró MyLocalizations'),
    );

    // Lista para guardar todos los getters encontrados en la clase y sus padres
    final allGetters = <PropertyAccessorElement>[];

    // Función recursiva para recolectar getters de la clase y sus superclases
    void collectGetters(ClassElement? cls) {
      if (cls == null) return;

      allGetters.addAll(cls.accessors.where((a) => a.isGetter && !a.isStatic));

      final superTypeElement = cls.supertype?.element;
      if (superTypeElement is ClassElement) {
        collectGetters(superTypeElement);
      }
    }

    collectGetters(appLocalizationsClass);

    // Construir el cuerpo del método getByKey dinámico
    final buffer = StringBuffer();

    buffer.writeln('''
import 'package:flutter/widgets.dart';
import 'package:fitbuddy/l10n/app_localizations.dart';

class TextLang {

  final BuildContext _buildContext;

  TextLang(BuildContext this._buildContext);

''');
    buffer.writeln('  String? getByKey(String key) {');
    buffer.writeln('    switch (key) {');

    for (final getter in allGetters) {
      final name = getter.displayName;
      if (name == 'hashCode' || name == 'runtimeType')
        continue; // Ignorar hashCode y runtimeType
      buffer.writeln("      case '$name':");
      buffer.writeln(
        '        return  AppLocalizations.of(_buildContext)!.$name;',
      );
    }

    buffer.writeln('      default:');
    buffer.writeln('        return null;');
    buffer.writeln('    }');
    buffer.writeln('  }');
    buffer.writeln('}');

    return buffer.toString();
  }
}

// Builder factory
Builder localizationAccessBuilder(BuilderOptions options) => LibraryBuilder(
  LocalizationAccessGenerator(),
  generatedExtension: '.localizations_access.g.dart',
);
