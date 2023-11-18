
import 'package:achievelab/teamlist/popcontainer.dart';
import 'package:achievelab/teamlist/teamscorepop.dart';
import 'package:flutter/material.dart';

import '../widget/styledtext.dart';


class ProgressPopF extends StatefulWidget {
  late Map<dynamic, dynamic> _joined; 
  late String _name;
  ProgressPopF(Map<dynamic, dynamic> joined, String name){
    _joined = joined;
    _name = name;
  }

  @override
  State<ProgressPopF> createState() => _ProgressPopFState(_joined, _name);
}

class _ProgressPopFState extends State<ProgressPopF> {
  // final GestureTapCallback press;
  late Map<dynamic, dynamic> _joined; 
  late String _name;
  _ProgressPopFState(Map<dynamic, dynamic> joined, String name) {
    _joined = joined;
    _name = name;
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Padding(
        padding: EdgeInsets.only(top: (10.0)),
        child: Container(
          width: 350,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Failed... but it's okay!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SnowCrab',
                    fontSize: 25,
                    fontWeight: FontWeight.w700
                ),
              ),
              Container(height: 10,),
              Text(
                "You still have...",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SnowCrab',
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${_joined['leftDeposit']} points",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SnowCrab',
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  Text(
                    " left to try!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SnowCrab',
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
        
            ],
          ),
        ),
      ),
      actions: [
        Container(
          width: 110,
          height: 50,
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
                  fontSize: (15),
                  color: Colors.white),)
          ),
        )
      ],
    );
  }
}