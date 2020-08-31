import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _whidt = 50.0;
  double _height = 50.0;
  Color _color = Colors.purple;
  BorderRadius _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: AnimatedContainer(
          width: _whidt,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
          duration: Duration(
            milliseconds: 550,
          ),
          curve: Curves.easeInOutBack,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.play_arrow),
        onPressed: _changfeProperty,
      ),
    );
  }

  void _changfeProperty() {
    final random = Random();

    setState(() {
      _whidt = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1,
      );
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
