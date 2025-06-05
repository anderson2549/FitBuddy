import 'package:flutter/material.dart';
import 'package:fitbuddy/core/widgets/organisms/product_card.dart';
import 'package:fitbuddy/core/widgets/templates/list_view_template.dart';

class HomeScreen2 extends StatelessWidget {
  static const name = 'home_screen';
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlantillaLista(
      title: 'Productos',
      children: [
        TarjetaDeProducto(
          nombre: 'Producto 1',
          precio: 25.99,
          imageUrl: 'https://picsum.photos/id/10/600/350',
        ),
        TarjetaDeProducto(
          nombre: 'Producto 2',
          precio: 49.50,
          imageUrl: 'https://picsum.photos/id/20/600/350',
        ),
      ],
    );
  }
}
