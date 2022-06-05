import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myBMI/screens/results.dart';
import '../components/reusable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myBMI/components/constants.dart';
import '../components/bottom_button.dart';
import '../components/round_icon.dart';
import 'package:myBMI/calaculation.dart';

const inactcol = 0xFF111328;
const int seccol = 0xFF1D1F33;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  Female,
  Male
}

class _InputPageState extends State<InputPage> {
  @override

  Gender? gen;
  int height = 180;
  double minht = 120, maxht = 220;
  int wt = 60;
  int age = 20;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('BMI CALCULATOR')
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      gen = Gender.Male;
                    });
                  },
                  child: card(
                    col: gen == Gender.Male? seccol : inactcol,
                  childcard: cardcontent(
                    icon: FontAwesomeIcons.mars,
                    txt: 'MALE',
                  ),
              ),
                )),
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    gen = Gender.Female;
                  });
                },
                child: card(
                  col: gen == Gender.Female ? seccol : inactcol,
                    childcard: cardcontent(
                      icon: FontAwesomeIcons.venus,
                      txt: 'FEMALE',
                    )
                ),
              )),
            ],
          )),
          Expanded(
            flex: 2,
              child: card(
            col: seccol,
              childcard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF6B6D7A)
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: knumconst
                      ),
                      Text(
                        'cm',
                        style: textstyle,
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          overlayColor: Color(0x29EB1555),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                          thumbColor: Color(0xFFEB1555),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: minht,
                            max: maxht,
                            onChanged: (double val){
                              setState(() {
                                height = val.round();
                              });
                            },
                        ),
                      )
                    ],
                  )
                ],
            )

          )),
          Expanded(
            flex: 3,
              child: Row(
                children: [
                  Expanded(
                      child: card(
                      col: seccol,
                      childcard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: textstyle,
                          ),
                          Text(
                            wt.toString(),
                            style: knumconst
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(icon: FontAwesomeIcons.minus, func: (){
                                setState(() {
                                  wt--;
                                });
                              }),
                              SizedBox(
                                width: 20,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                func: (){
                                    setState(() {
                                      wt++;
                                    });
                                },
                              )
                            ],
                          )
                        ],
                      )
                  )
              ),
              Expanded(child: card(
                col: seccol,
                  childcard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: textstyle,
                      ),
                      Text(
                        age.toString(),
                        style: knumconst
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.minus, func: (){
                            setState(() {
                              age--;
                            });
                          }),
                          SizedBox(
                            width: 20,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            func: (){
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  )
              )),
            ],
          )),
          Expanded(
            flex: 2,
              child: bottombutton(
                  title: 'CALCULATE YOUR BMI',
                  ontap: (){
                    Calculator cal = Calculator(ht: height, wt: wt);
                    Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context)=>Result(
                        bmival: cal.bmi(),
                        title: cal.result(),
                      msg: cal.msg(),
                      ),),);},
              )
          )
        ],
      ),
    );
  }
}

