
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

class TeamInfo extends StatefulWidget {
  late String _name;
  late String _goal;
  late String _duration;
  late String _time;
  late String _deposit;
  late int _members;
  TeamInfo(String name, String goal, String duration, String time, String deposit, int members, {super.key}){
    _name = name;
    _goal = goal;
    _duration = duration;
    _time = time;
    _deposit = deposit;
    _members = members;
  }


  @override
  _TeamInfoState createState() => _TeamInfoState(_name,_goal,_duration,_time,_deposit,_members);
}

class _TeamInfoState extends State<TeamInfo> {
  late String _name;
  late String _goal;
  late String _duration;
  late String _time;
  late String _deposit;
  late int _members;

  _TeamInfoState(String name, String goal, String duration, String time, String deposit, int members) {
    _name = name;
    _goal = goal;
    _duration = duration;
    _time = time;
    _deposit = deposit;
    _members = members;
  }

  bool clicked = false;

  Future<Map<dynamic, dynamic>> handleTeam(String userName, String teamName) async {
    //GET request
    try{
      var a = await JoinTeamAPI.joinTeam(userName, teamName);
      final body = json.decode(a.body.toString());
      //result from GET
      final result = body;
      // print(result);
      Map<dynamic, dynamic> joined = result;
      // as List<Map<String, dynamic>>;
      await showDialog(
            context: context,
            builder: (BuildContext context) {
              //ask score system api
          return JoinPop(joined, teamName);
        }
      );
      return joined;
    }
    catch(e) {
      print('실패함');
      print(e.toString());
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                                clicked == true ? clicked = false : clicked = true;
                              });
                },
                child: Container(
                    width: 700,
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              color: Colors.black,
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
                                    final user = FirebaseAuth.instance.currentUser;
                                    final userName = user!.displayName!;
                                    handleTeam(userName, _name);
                                  
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
              ),
              clicked == true ?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 40,),
                  Container(
                    width: 660,
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
          ),
        ],
      ),
    );
  }
}