import 'package:fitbuddy/core/widgets/atoms/forms/Button.dart';
import 'package:flutter/material.dart';

class SearchBar1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(decoration: InputDecoration(hintText: 'Buscar...')),
        ),
        SizedBox(width: 8),
        Boton(
          texto: 'Buscar',
          onPressed: () {
            // TODO: Implementar la funcionalidad de búsqueda
          },
        ),
      ],
    );
  }
}
