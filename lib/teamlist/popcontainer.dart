
import 'package:flutter/material.dart';

import '../widget/styledtext.dart';


class JoinPopCont extends StatelessWidget {
  const JoinPopCont({
    Key? key,
    required this.points,
    required this.text,
    // required this.press,
  }) : super(key: key);

  final String text;
  final int points;
  // final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
          width: 235,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SnowCrab',
                      fontSize: 12,
                      fontWeight: FontWeight.w700
                  ),
                ),
                //Get social points
                Text(
                  "$points p",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SnowCrab',
                      fontSize: 12,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}