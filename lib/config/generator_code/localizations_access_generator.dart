import 'dart:async';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';

class LocalizationAccessGenerator extends Generator {
  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {
    // Busca la clase AppLocalizations en la librería de entrada
    final appLocalizationsClass = library.classes.firstWhere(
      (cls) => cls.name == 'AppLocalizations',
      orElse: () => throw StateError('No se encontró AppLocalizations'),
    );

    // Recolecta todos los getters y métodos públicos sin parámetros
    final allGetters = <PropertyAccessorElement>[];
    final allMethods = <MethodElement>[];

    void collectMembers(ClassElement? cls) {
      if (cls == null) return;
      allGetters.addAll(cls.accessors.where((a) => a.isGetter && !a.isStatic));
      allMethods.addAll(
        cls.methods.where(
          (m) =>
              !m.isStatic &&
              m.isPublic &&
              !m.isSynthetic && // <-- Agrega esto para evitar métodos generados como toString/hashCode
              m.name != 'toString' && // <-- Excluye toString explícitamente
              m.name != 'noSuchMethod' && // <-- Excluye noSuchMethod
              m.name != '==', // <-- Excluye operador ==
        ),
      );
      final superTypeElement = cls.supertype?.element;
      if (superTypeElement is ClassElement) {
        collectMembers(superTypeElement);
      }
    }

    collectMembers(appLocalizationsClass);

    // Genera la clase TextLang con soporte para getters y métodos sin parámetros obligatorios
    final buffer = StringBuffer();
    buffer.writeln('''
import 'package:flutter/widgets.dart';
import 'package:fitbuddy/l10n/app_localizations.dart';

class TextLang {

  final BuildContext _buildContext;

  TextLang(BuildContext this._buildContext);

  /// Obtiene una traducción por clave. Si la clave corresponde a un método con parámetros,
  /// usa [getByKeyWithArgs].
  String? getByKey(String key) {
    switch (key) {''');

    for (final getter in allGetters) {
      final name = getter.displayName;
      if (name == 'hashCode' || name == 'runtimeType') continue;
      buffer.writeln("      case '$name':");
      buffer.writeln(
        '        return AppLocalizations.of(_buildContext)!.$name;',
      );
    }

    for (final method in allMethods) {
      final name = method.displayName;
      if (method.parameters.isEmpty) {
        buffer.writeln("      case '$name':");
        buffer.writeln(
          '        return AppLocalizations.of(_buildContext)!.$name();',
        );
      }
    }

    buffer.writeln('      default:');
    buffer.writeln('        return null;');
    buffer.writeln('    }');
    buffer.writeln('  }');

    // Para métodos con parámetros posicionales o nombrados
    buffer.writeln('''
  /// Obtiene una traducción por clave y argumentos.
  ///
  /// Este método permite acceder dinámicamente a cualquier método de localización
  /// que acepte parámetros posicionales y/o nombrados.
  ///
  /// - [key]: nombre del método de localización (por ejemplo, 'hello').
  /// - [positionalArgs]: lista de argumentos posicionales en el orden esperado por el método.
  /// - [namedArgs]: mapa de argumentos nombrados donde la clave es el nombre del parámetro.
  ///
  /// Ejemplo de uso:
  /// ```dart
  /// TextLang(context).getByKeyWithArgs('hello', positionalArgs: ['Juan'])
  /// ```
  /// Para métodos con parámetros nombrados:
  /// ```dart
  /// TextLang(context).getByKeyWithArgs('greet', namedArgs: {'userName': 'Juan'})
  /// ```
  ///
  /// Si la clave no corresponde a ningún método, retorna null.
  String? getByKeyWithArgs(String key, {List<dynamic>? positionalArgs, Map<String, dynamic>? namedArgs}) {
    switch (key) {''');

    for (final method in allMethods) {
      final name = method.displayName;
      buffer.writeln("      case '$name':");
      // Genera la lista de argumentos posicionales
      final positionalParams = method.parameters.where((p) => p.isPositional).toList();
      final namedParams = method.parameters.where((p) => p.isNamed).toList();

      // Para cada parámetro posicional, genera un acceso seguro a la lista positionalArgs
      final positionalCall = positionalParams.isNotEmpty
          ? List.generate(
              positionalParams.length,
              (i) => 'positionalArgs?[$i]',
            ).join(', ')
          : '';

      // Para cada parámetro nombrado, genera un acceso seguro al mapa namedArgs
      final namedCall = namedParams.isNotEmpty
          ? namedParams
              .map(
                (p) =>
                    '${p.name}: namedArgs != null && namedArgs.containsKey(\'${p.name}\') ? namedArgs[\'${p.name}\'] : null',
              )
              .join(', ')
          : '';

      // Junta ambos tipos de argumentos
      final allParams = [
        if (positionalCall.isNotEmpty) positionalCall,
        if (namedCall.isNotEmpty) namedCall,
      ].join(', ');

      buffer.writeln(
        '        return AppLocalizations.of(_buildContext)!.$name($allParams);',
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

// Builder factory para build_runner
Builder localizationAccessBuilder(BuilderOptions options) => LibraryBuilder(
  LocalizationAccessGenerator(),
  generatedExtension: '.localizations_access.g.dart',
);
