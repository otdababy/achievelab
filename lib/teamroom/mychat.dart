
import 'dart:convert';

import 'package:achievelab/api/join_team_api.dart';
import 'package:achievelab/teamlist/joinpop.dart';
import 'package:achievelab/teamlist/teamlist_page.dart';
import 'package:achievelab/teamlist/teamtext.dart';
import 'package:achievelab/widget/styledbutton.dart';
import 'package:achievelab/widget/styledtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../select_page.dart';

class myChat extends StatefulWidget {
  late String _name;
  late String _goal;
  myChat(String name, String goal, {super.key}){
    _name = name;
    _goal = goal;
  }


  @override
  _myChatState createState() => _myChatState(_name,_goal);
}

class _myChatState extends State<myChat> {
  late String _name;
  late String _goal;

  _myChatState(String name, String goal) {
    _name = name;
    _goal = goal;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  
                  Text(
                      _name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          // fontFamily: 'SnowCrab',
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Container(width: 5,),
                ],
              ),
              Container(height: 3,),
              Container(
                  // width: 700,
                  // height: 0,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                    _goal,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        // fontFamily: 'SnowCrab',
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                                  ),
                  ),
                  )
            ],
          ),
        ],
      ),
    );
  }
}