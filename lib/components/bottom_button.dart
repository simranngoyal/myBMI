import 'package:flutter/material.dart';
import 'package:myBMI/components/constants.dart';

class bottombutton extends StatelessWidget {

  final VoidCallback ontap;
  final String title;

  const bottombutton({required this.ontap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
          child: Text(
              title,
              style: endbutton
          ),
        ),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 80),
        height: 50.0,
        width: double.infinity,

      ),
    );
  }
}