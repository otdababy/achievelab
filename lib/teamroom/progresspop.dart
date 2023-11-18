
import 'package:achievelab/teamlist/popcontainer.dart';
import 'package:achievelab/teamlist/teamscorepop.dart';
import 'package:flutter/material.dart';

import '../widget/styledtext.dart';


class ProgressPop extends StatefulWidget {
  late Map<dynamic, dynamic> _joined; 
  late String _name;
  ProgressPop(Map<dynamic, dynamic> joined, String name){
    _joined = joined;
    _name = name;
  }

  @override
  State<ProgressPop> createState() => _ProgressPopState(_joined, _name);
}

class _ProgressPopState extends State<ProgressPop> {
  // final GestureTapCallback press;
  late Map<dynamic, dynamic> _joined; 
  late String _name;
  _ProgressPopState(Map<dynamic, dynamic> joined, String name) {
    _joined = joined;
    _name = name;
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Padding(
        padding: EdgeInsets.only(top: (10.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Job!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'SnowCrab',
                  fontSize: 17,
                  fontWeight: FontWeight.w700
              ),
            ),
            Text(
              "You just contributed the following!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'SnowCrab',
                  fontSize: 15,
                  fontWeight: FontWeight.w500
              ),
            ),
            Text(
              "Rank ${_joined['prevRank']}th place -> ${_joined['curRank']}th place",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'SnowCrab',
                  fontSize: 15,
                  fontWeight: FontWeight.w700
              ),
            ),
            Container(height: 30,),
            Text(
              "Score: ${_joined['prevScore']}pts -> ${_joined['curScore']}pts",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'SnowCrab',
                  fontSize: 15,
                  fontWeight: FontWeight.w700
              ),
            ),
            Container(height: 5,),
            Text(
              "Current score of [$_name]: ${_joined['prevTotalScore']}pts -> ${_joined['curTotalScore']}pts",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'SnowCrab',
                  fontSize: 15,
                  fontWeight: FontWeight.w700
              ),
            ),

          ],
        ),
      ),
      actions: [
        Container(
          width: 90,
          height: 30,
          child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Colors.black,
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                
              },
              child: Text('Confirm', style: TextStyle(fontFamily: 'SnowCrab',
                  fontWeight: FontWeight.w700,
                  fontSize: (12),
                  color: Colors.white),)
          ),
        )
      ],
    );
  }
}