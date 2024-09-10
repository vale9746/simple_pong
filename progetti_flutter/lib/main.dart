import 'package:flutter/material.dart';
import 'widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main()=>runApp(MyApp());

class TimerHomePage extends StatelessWidget {
  static const double defaultPadding=5.0;

  const TimerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Pomodoro App'),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: LayoutBuilder( builder: (BuildContext context, BoxConstraints constraints) {
        final double availableWidth=constraints.maxWidth;

        return Column(
          children: [
            Row(
              children: [
                Padding(padding: const EdgeInsets.all(defaultPadding),),
                Expanded(child: ProductivityButton(
                  color: Colors.green, text: 'Work', onPressed: emptyMethod,)),
                Padding(padding: EdgeInsets.all(defaultPadding),),
                Expanded(child: ProductivityButton(color: Colors.green,
                    text: 'Short Break',
                    onPressed: emptyMethod)),
                Padding(padding: EdgeInsets.all(defaultPadding),),
                Expanded(child: ProductivityButton(color: Colors.green,
                    text: 'Long Break',
                    onPressed: emptyMethod)),
                Padding(padding: EdgeInsets.all(defaultPadding),),
              ],
            ),
            Expanded(child: CircularPercentIndicator(radius: availableWidth/2,
              lineWidth: 10.0,
              percent: 1,
              center: Text("30:00",
              style: Theme.of(context).textTheme.displayMedium),
              progressColor: Colors.green,
            )),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(defaultPadding),),
                Expanded(child: ProductivityButton(
                    color: Colors.green, text: 'Stop', onPressed: emptyMethod)),
                Padding(padding: EdgeInsets.all(defaultPadding),),
                Expanded(child: ProductivityButton(color: Colors.green,
                    text: 'Restart',
                    onPressed: emptyMethod)),
                Padding(padding: EdgeInsets.all(defaultPadding),),
              ],
            ),
          ],
        )
      ;}
      ),
    );
  }

  void emptyMethod(){}
}


class MyApp extends StatelessWidget {



  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer Work',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const TimerHomePage(),
    );
  }


}
