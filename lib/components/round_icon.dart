import 'package:flutter/material.dart';
import 'constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.func});

  final IconData icon;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 20,
      constraints: BoxConstraints.tightFor(
          height: 56,
          width: 56
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: func,
    );
  }
}
