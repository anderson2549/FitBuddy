import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double height = 50;

  double width = 50;

  double borderRadius = 10;

  Color color1 = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('animation')),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          height: height <= 0 ? 0 : height,
          curve: Curves.elasticOut,
          width: width <= 0 ? 0 : width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: color1,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: Icon(Icons.play_arrow_rounded),
      ),
    );
  }

  changeShape() {
    final ra = new Random();
    width = ra.nextInt(300) + 120;
    height = ra.nextInt(300) + 120;
    borderRadius = ra.nextInt(300) + 20;
    final r = ra.nextInt(255);
    final g = ra.nextInt(255);
    final b = ra.nextInt(255);
    color1 = Color.fromRGBO(r, g, b, 1);
    setState(() {});
  }
}
