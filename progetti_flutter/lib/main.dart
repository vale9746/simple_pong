import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer Work',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pomodoro App'),
          backgroundColor: Colors.lightGreenAccent,
        ),
        body: Center(
          child: Text('Applicazione Base'),
        ),
      ),
    );
  }
}
