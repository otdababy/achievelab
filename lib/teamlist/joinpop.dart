
import 'package:achievelab/teamlist/popcontainer.dart';
import 'package:achievelab/teamlist/teamscorepop.dart';
import 'package:flutter/material.dart';

import '../widget/styledtext.dart';


class JoinPop extends StatefulWidget {
  late Map<dynamic, dynamic> _joined; 
  late String _name;
  JoinPop(Map<dynamic, dynamic> joined, String name){
    _joined = joined;
    _name = name;
  }

  @override
  State<JoinPop> createState() => _JoinPopState(_joined, _name);
}

class _JoinPopState extends State<JoinPop> {
  // final GestureTapCallback press;
  late Map<dynamic, dynamic> _joined; 
  late String _name;
  _JoinPopState(Map<dynamic, dynamic> joined, String name) {
    _joined = joined;
    _name = name;
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
              _name,
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
              "Deposit System",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'SnowCrab',
                  fontSize: 12,
                  fontWeight: FontWeight.w700
              ),
            ),
            JoinPopCont(text: "Your social points:",points: _joined['socialCredit']),
            JoinPopCont(text: "Deposit required:",points: _joined['deposit']),
            JoinPopCont(text: "If you fail for a day",points: _joined['failDeduction']),

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
                  return TeamPop(team: _name, indscore: _joined['initialScore'], teamscore: _joined['teamScore'], inc: _joined['increment']);
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