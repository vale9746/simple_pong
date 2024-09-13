import 'package:flutter/material.dart';
import './ball.dart';
import './bat.dart';

class Pong extends StatefulWidget {
  const Pong({super.key});

  @override
  State<Pong> createState() => _PongState();
}

class _PongState extends State<Pong> with SingleTickerProviderStateMixin {
  late double width;
  late double height;
  double posX = 0;
  double posY = 0;
  double batWidth = 0;
  double batHeight = 0;
  double batPosition = 0;
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {

    super.initState();
    posX = 0;
    posY = 0;
    controller = AnimationController(
      duration: const Duration(minutes: 10000),
      vsync: this,
    );
    animation=Tween<double>(begin: 0, end: 100).animate(controller);
    animation.addListener((){
      setState(() {
        posY++;
        posX++;
      });
    });
    controller.forward();
  }

    @override
    Widget build(BuildContext context) {
      return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            height = constraints.maxHeight;
            width = constraints.maxWidth;
            batWidth = width / 5;
            batHeight = height / 20;
            return Stack(
              children: [
                Positioned(child: Ball(),
                  top: posY,
                left: posX,),
                Positioned(child: Bat(width: batWidth, heght: batHeight,),
                  bottom: 0,)
              ],
            );
          });
    }
  }

 
