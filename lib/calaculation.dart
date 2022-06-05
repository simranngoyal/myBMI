import 'dart:math';

late double _res;

class Calculator {
  Calculator({required this.ht, required this.wt});

  final int ht;
  final int wt;

  String bmi(){
    _res = wt/ pow(ht/100, 2);
    return _res.toStringAsFixed(1);
  }

  String result(){
    if(_res>30){
      return 'OBESE';
    }
    else if(_res>24.9 && _res<=29.9) {
      return 'OVERWEIGHT';
    } else if(_res<25 && _res>=18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String msg(){
    if(_res>30){
      return 'You are in the red zone! Switch to a healthy lifestyle ASAP';
    }
    else if(_res>24.9 && _res<=29.9) {
      return 'You are Overweight. Control the intake of calories and exercise more';
    } else if(_res<25 && _res>=18.5) {
      return 'Congratulations! You are healthy';
    } else {
      return 'Oh No! You are underweight. Increase the intake of calories and try muscle gaining exercises';
    }
  }
}