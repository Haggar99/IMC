import 'package:flutter/material.dart';
import 'package:imc/constant.dart';


class CardButton extends StatelessWidget {
  const CardButton({
    required this.icon,
    required this.label,
    Key? key}) : super(key: key);


  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80.0,),
        SizedBox(height: 15.0,),
        Text(label, style: kTextStyle,)
      ],
    );
  }
}
