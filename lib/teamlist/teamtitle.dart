
import 'package:flutter/material.dart';


class TeamTitle extends StatelessWidget {
  const TeamTitle({
    Key? key,
    required this.text,
    required this.size,
    // required this.color,
    // required this.press,
  }) : super(key: key);

  final String text;
  final int size;
  // final Colors color;
  // final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            // fontFamily: 'SnowCrab',
            fontSize: size.toDouble(),
            fontWeight: FontWeight.w700
        ),
      ),
    );
  }
}