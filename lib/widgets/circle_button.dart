import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  Function()? onPress;
  final IconData icon;
  final double iconSize;

  CircleButton({
    Key? key,
    this.onPress,
    required this.icon,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.0),
      decoration:
      BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
      child: IconButton(
        icon: Icon(
          icon,
          size: iconSize,
          color: Colors.black,
        ),
        onPressed: onPress,
      ),
    );
  }
}
