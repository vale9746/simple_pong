import 'dart:async';
import './timermodel.dart';

class CountDownTimer {
  double _radius = 1;
  bool _isActive = true;
  late Timer timer;
  late Duration _time;
  late Duration _fullTime;
  int work =30;

  Stream<TimeModel> stream() async* {
    yield* Stream.periodic(Duration(seconds: 1), (int a) {
      String time;
      if (this._isActive) {
        _time = _time - Duration(seconds: 1);
        _radius = _time.inSeconds / _fullTime.inSeconds;
        if (_time.inSeconds <= 0) {
          _isActive = false;
        }
      }
      time= returnTime(_time);
      return TimeModel(time, _radius);
    });
  }

  String returnTime(Duration t) {
    //questa cosa la fa in modo che se mancano meno di 10 minuti resta lo 0 davanti ai minuti
    String minutes = (t.inMinutes < 10)
        ? '0' + t.inMinutes.toString()
        : t.inMinutes.toString();
    int numSeconds = t.inSeconds - (t.inMinutes * 60);
    String seconds =
        (numSeconds < 10) ? '0' + numSeconds.toString() : numSeconds.toString();
    String formattedTime = minutes + ":" + seconds;
    return formattedTime;
  }



  void startWork(){
    _radius=1;
    _time=Duration(minutes: this.work, seconds: 0);
    _fullTime=_time;
  }


}
