import 'package:flutter/material.dart';

void main() =>runApp(MyApp());

class MyApp extends StatefulWidget {

  MyAppState createState() => MyAppState();
}
class MyAppState extends State<MyApp>{
  late double _numberForm;

  @override
  void initState(){
    _numberForm =0;
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Measure Converter',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text('Measures Converter'),
        ),
        body: Center(
          child: Column(
            children: [
              TextField(
                onChanged: (text){
                  var rv=double.tryParse(text);
                  if(rv!=null){
                    setState(() {
                      _numberForm=rv;
                    });
                  }
                },
              ),
              Text((_numberForm==null)? '':_numberForm.toString())
            ],
          ),
        ),
      ),

    );
  }
}