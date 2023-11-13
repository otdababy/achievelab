
import 'package:achievelab/teamlist/joinpop.dart';
import 'package:achievelab/teamlist/teamlist_page.dart';
import 'package:achievelab/teamlist/teamtext.dart';
import 'package:achievelab/widget/styledbutton.dart';
import 'package:achievelab/widget/styledtext.dart';
import 'package:flutter/material.dart';

import '../select_page.dart';

class TeamRec extends StatefulWidget {
  late String _name;
  late String _goal;
  late String _duration;
  late String _time;
  late String _deposit;
  late int _members;
  TeamRec(String name, String goal, String duration, String time, String deposit, int members, {super.key}){
    _name = name;
    _goal = goal;
    _duration = duration;
    _time = time;
    _deposit = deposit;
    _members = members;
  }


  @override
  _TeamRecState createState() => _TeamRecState(_name,_goal,_duration,_time,_deposit,_members);
}

class _TeamRecState extends State<TeamRec> {
  late String _name;
  late String _goal;
  late String _duration;
  late String _time;
  late String _deposit;
  late int _members;

  _TeamRecState(String name, String goal, String duration, String time, String deposit, int members) {
    _name = name;
    _goal = goal;
    _duration = duration;
    _time = time;
    _deposit = deposit;
    _members = members;
  }

  bool clicked = false;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            // width: 600,
            // height: 90,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(width: 10,),
                    GestureDetector(
                      onTap:(){
                        setState(() {
                          clicked == true ? clicked = false : clicked = true;
                        });
                      },
                      child: Container(
                        width: 10,
                        height: 10,
                        color: Colors.black,
                      ),
                    ),
                    StyledText(text: _name, size: 20),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    StyledText(text: "$_members/8", size: 15),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey),
                        ),
                        width: 100,
                        height: 50,
                        child: TextButton(
                          onPressed: () async {
                            //send join request, show popup after joining,
                            await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  //ask score system api
                              return JoinPop(team: _name,);
                            }
                            );
                          },
                          child: Text(
                            "Join",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                // fontFamily: 'SnowCrab',
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(width: 10,)
                  ],
                )
              ],
            )
        ),
        clicked == true ?
            Row(
              children: [
                Container(width: 20,),
                Container(
                  width: 650,
                  height: 160,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TeamText(text: "Goal: $_goal", size: 15),
                        TeamText(text: "Duration: $_duration", size: 15),
                        TeamText(text: "Meeting: $_time", size: 15),
                        TeamText(text: "Deposit: $_deposit", size: 15),
                      ],
                    ),
                  ),

                ),
              ],
            )
            : Container()

      ],
    );
  }
}