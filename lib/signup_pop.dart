
import 'package:flutter/material.dart';


class Popup extends StatelessWidget {
  const Popup({
    Key? key,
    required this.title,
    // required this.press,
  }) : super(key: key);

  final String title;
  // final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Padding(
        padding: EdgeInsets.only(top: (25.0)),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'SnowCrab',
                fontSize: 15,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
      actions: [
        Container(
          width: 100,
          height: 40,
          child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Confirm', style: TextStyle(fontFamily: 'SnowCrab',
                  fontWeight: FontWeight.w500,
                  fontSize: (12),
                  color: Colors.white),)
          ),
        )
      ],
    );
  }
}