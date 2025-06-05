import 'package:flutter/material.dart';

class TarjetaDeProducto extends StatelessWidget {
  final String nombre;
  final double precio;
  final String imageUrl;

  const TarjetaDeProducto({
    Key? key,
    required this.nombre,
    required this.precio,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(
            imageUrl,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              nombre,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Text('Precio: \$${precio.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
