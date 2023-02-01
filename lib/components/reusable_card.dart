import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    required this.widgetCard,
    required this.color,
    required this.onPress,
    Key? key}) : super(key: key);

  final Widget widgetCard;
  final Function onPress;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        child: widgetCard,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}
