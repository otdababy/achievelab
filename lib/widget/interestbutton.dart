
import 'package:achievelab/teamlist/teamlist_page.dart';
import 'package:flutter/material.dart';

import '../select_page.dart';


class InterestButton extends StatelessWidget {
  const InterestButton({
    Key? key,
    required this.text,
    required this.name,
    // required this.size,
    // required this.color,
    // required this.press,
  }) : super(key: key);

  final String text;
  final String name;
  // final int size;
  // final Colors color;
  // final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: (){
          //Move onto list of teams
          Navigator.push(context, MaterialPageRoute(
              builder: (_) => TeamListPage(name)));
        },
        child: Container(
            width: 170,
            height: 90,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: Center(child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    // fontFamily: 'SnowCrab',
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                ),
              ),
            ))
        ),
      ),
    );
  }
}