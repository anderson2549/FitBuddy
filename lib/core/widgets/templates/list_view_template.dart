import 'package:flutter/material.dart';
import 'package:fitbuddy/core/widgets/molecules/forms/search_bar.dart';

class PlantillaLista extends StatelessWidget {
  final List<Widget> children;
  final String title;

  const PlantillaLista({Key? key, required this.children, required this.title})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.all(8.0), child: SearchBar1()),
          Expanded(child: ListView(children: children)),
        ],
      ),
    );
  }
}
