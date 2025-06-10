import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Proveedor de estado para el locale actual
final localeProvider = StateProvider<Locale?>((ref) => null);

// Función para cambiar el locale:
// ref.read(localeProvider.notifier).state = Locale('es');
