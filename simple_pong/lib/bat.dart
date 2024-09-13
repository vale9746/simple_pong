import 'package:flutter/material.dart';

class Bat extends StatelessWidget {

  final double width;
  final double heght;
  const Bat({super.key, required this.width, required this.heght});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heght,
      decoration: new BoxDecoration(
        color: Colors.blue[900],
      ),
    );
  }
}
