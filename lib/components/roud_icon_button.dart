import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    required this.icon,
    required this.onPress,
    Key? key}) : super(key: key);

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => onPress(),
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0
      ),
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Colors.black38,
    );
  }
}
