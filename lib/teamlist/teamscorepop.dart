
import 'package:achievelab/teamlist/popcontainer.dart';
import 'package:achievelab/teamlist/welcomepop.dart';
import 'package:flutter/material.dart';

import '../widget/styledtext.dart';


class TeamPop extends StatelessWidget {
  const TeamPop({
    Key? key,
    required this.team,
    required this.teamscore,
    required this.indscore,
    required this.inc,

    // required this.press,
  }) : super(key: key);

  final String team;
  final int indscore;
  final int teamscore;
  final int inc;
  // final GestureTapCallback press;

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
              "Let's Go!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'SnowCrab',
                  fontSize: 17,
                  fontWeight: FontWeight.w700
              ),
            ),
            Text(
              "You are now a member of",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'SnowCrab',
                  fontSize: 15,
                  fontWeight: FontWeight.w500
              ),
            ),
            Text(
              "[$team]",
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
              "Check the below carefully",
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
              "Team Score System",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'SnowCrab',
                  fontSize: 12,
                  fontWeight: FontWeight.w700
              ),
            ),
            JoinPopCont(text: "Team score:",points: teamscore),
            JoinPopCont(text: "Your starting score:",points: indscore),
            JoinPopCont(text: "If you achieve your goal for a day",points: inc),


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
                await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                  //ask score system api
                  return WelcomePop(team);
                }
                );
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