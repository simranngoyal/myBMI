import 'package:flutter/material.dart';
import 'package:myBMI/components/bottom_button.dart';
import 'package:myBMI/components/constants.dart';
import 'package:myBMI/screens/home.dart';
import '../components/reusable.dart';
import 'package:myBMI/calaculation.dart';

class Result extends StatelessWidget {
  Result({required this.title, required this.bmival, required this.msg});

  final String bmival;
  final String msg;
  final String title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULT'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
              child: Container(
                margin: EdgeInsets.all(15),
                child: Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
          ),
          Expanded(
            flex: 5,
            child: card(
                col: seccol,
              childcard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: func(title),
                  ),
                  Text(
                    bmival,
                    style: bmitext,
                  ),
                  Text(
                    msg,
                    style: bdytxt,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          bottombutton(
              ontap: (){
                Navigator.pop(context);
              },
              title: 'RE-CALCULATE YOUR BMI')
        ],
      ),
    );
  }
}

TextStyle func(String title){
  if(title == 'UNDERWEIGHT'){
    return TextStyle(
        color: Color(0xDDC14C3C),
  fontSize: 22,
  fontWeight: FontWeight.bold);
  }
  else if(title=='NORMAL'){
    return TextStyle(
        color: Color(0xFF24D876),
  fontSize: 22,
  fontWeight: FontWeight.bold);
  }
  else if(title=='OVERWEIGHT' || title=='OBESE'){
    return TextStyle(
        color: Color(0xFFE50517),
  fontSize: 22,
  fontWeight: FontWeight.bold);
  }
  return TextStyle(
      color: Color(0xFF24D876),
  fontSize: 22,
  fontWeight: FontWeight.bold);
}