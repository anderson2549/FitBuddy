import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbars_screen';

  void showCustomSnackbar(BuildContext context) {
    final snbar = SnackBar(
      content: Text('hola mundo'),
      action: SnackBarAction(label: "ok!", onPressed: () {}),
      duration: Duration(milliseconds: 250),
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snbar);
  }

  const SnackbarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mostrar snackbar')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showCustomSnackbar(context);
        },
        icon: Icon(Icons.remove_red_eye_outlined),
        label: Text("Mostrar SnackBar"),
      ),
      body: Center(
        child: Column(
          children: [
            FilledButton(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    Text("lorem asdasdasda sdas dasdasd asd asd asd asd a"),
                  ],
                );
              },
              child: Text('Licencias usadas'),
            ),
            FilledButton(
              onPressed: () => openDialog(context),
              child: Text('Mostrar dialogo'),
            ),
          ],
        ),
      ),
    );
  }

  void openDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            title: Text("estas seguro?"),
            content: Text("dasdoahsdoihasdhoiashdioashd"),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text("Cancelar"),
              ),
              FilledButton(
                onPressed: () {
                  context.pop();
                },
                child: Text("Aceptar"),
              ),
            ],
          ),
    );
  }
}
