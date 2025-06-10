# fitbuddy

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Internacionalización (i18n)

La app soporta múltiples idiomas usando archivos ARB y la generación automática de localizaciones de Flutter.

### ¿Cómo agregar un nuevo valor traducible?

1. Abre el archivo de idioma correspondiente en `lib/l10n/app_{lang}.arb` (por ejemplo, `app_en.arb` para inglés, `app_es.arb` para español).
2. Agrega la nueva clave y su valor traducido en cada archivo ARB.
   ```json
   // app_en.arb
   "new_key": "New value in English"
   // app_es.arb
   "new_key": "Nuevo valor en Español"
   ```
3. Guarda los archivos.
4. Flutter generará automáticamente el código de localización al ejecutar `flutter pub get`, `flutter run` o `flutter build` (asegúrate de tener `generate: true` en tu `pubspec.yaml`).
5. Si agregas una nueva clave, puede aparecer un error en el archivo generado `app_localizations.dart` hasta que ejecutes los comandos anteriores y se regenere el código. No olvides implementar el nuevo método si usas extensiones personalizadas.
6. Una vez implementado el método, ejecuta el comando `flutter pub run build_runner build --delete-conflicting-outputs` para generar la clase de acceso personalizada.

### Recursos útiles

- [Flutter Internationalization Guide](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization)
- [Arb file format](https://github.com/google/app-resource-bundle/wiki/ApplicationResourceBundleSpecification)

---