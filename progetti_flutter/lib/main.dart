import 'package:flutter/material.dart';
import 'package:timer_app/timermodel.dart';
import 'widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'timer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer Work',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: TimerHomePage(),
    );
  }
}

class TimerHomePage extends StatelessWidget {
  static const double defaultPadding = 5.0;
  final CountDownTimer timer = CountDownTimer();

  TimerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    timer.startWork();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro App'),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        final double availableWidth = constraints.maxWidth;

        return Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
                Expanded(
                    child: ProductivityButton(
                  color: Colors.green,
                  text: 'Work',
                  onPressed:()=> timer.startWork(),
                )),
                const Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
                Expanded(
                    child: ProductivityButton(
                        color: Colors.green,
                        text: 'Short Break',
                        onPressed: ()=>timer.startBreak(true))),
                const Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
                Expanded(
                    child: ProductivityButton(
                        color: Colors.green,
                        text: 'Long Break',
                        onPressed: ()=>timer.startBreak(false))),
                const Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
              ],
            ),
            Expanded(
                child: StreamBuilder(
                    stream: timer.stream(),
                    builder: (context, snapshot) {
                      TimeModel? timer = (snapshot.data == '00:00')
                          ? TimeModel('00:00', 1)
                          : snapshot.data;
                      return CircularPercentIndicator(
                        radius: (availableWidth - 30) / 2,
                        lineWidth: 10.0,
                        percent: timer!.percent,
                        center: Text(timer.time,
                            style: Theme.of(context).textTheme.displayMedium),
                        progressColor: Colors.green,
                      );
                    })),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
                Expanded(
                    child: ProductivityButton(
                        color: Colors.green,
                        text: 'Stop',
                        onPressed: ()=>timer.stopTimer())),
                const Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
                Expanded(
                    child: ProductivityButton(
                        color: Colors.green,
                        text: 'Restart',
                        onPressed: ()=>timer.startTimer())),
                const Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }

  void emptyMethod() {}
}
