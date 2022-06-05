import 'package:flutter/material.dart';
import 'package:myBMI/components/constants.dart';


class cardcontent extends StatelessWidget {
  cardcontent({this.icon, required this.txt});

  final IconData? icon;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
            icon,
            size: 50
        ),
        SizedBox(
            height: 15
        ),
        Text(
            txt,
            style: textstyle)
      ],
    );
  }
}

class card extends StatelessWidget {
  card({required this.col, this.childcard});

  final int col;
  final Widget? childcard;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: childcard,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Color(col)
      ),
    );
  }
}
