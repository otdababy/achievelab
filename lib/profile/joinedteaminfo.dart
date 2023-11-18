
import 'dart:convert';

import 'package:achievelab/api/get_chat_api.dart';
import 'package:achievelab/api/get_team_main_api.dart';
import 'package:achievelab/teamlist/joinpop.dart';
import 'package:achievelab/teamlist/teamlist_page.dart';
import 'package:achievelab/teamlist/teamtext.dart';
import 'package:achievelab/teamlist/teamtitle.dart';
import 'package:achievelab/teamroom/team_page.dart';
import 'package:achievelab/widget/styledbutton.dart';
import 'package:achievelab/widget/styledtext.dart';
import 'package:flutter/material.dart';

import '../select_page.dart';

class JoinedTeamInfo extends StatefulWidget {
  late String _rank;
  late int _points;
  late String _name;
  late String _goal;
  late String _duration;
  late String _time;
  late String _deposit;
  late int _members;
  JoinedTeamInfo(String rank, int points, String name, String goal, String duration, String time, String deposit, int members, {super.key}){
    _rank = rank;
    _points = points;
    _name = name;
    _goal = goal;
    _duration = duration;
    _time = time;
    _deposit = deposit;
    _members = members;
  }

  @override
  _JoinedTeamInfoState createState() => _JoinedTeamInfoState(_rank, _points, _name,_goal,_duration,_time,_deposit,_members);
}

class _JoinedTeamInfoState extends State<JoinedTeamInfo> {
  late String _rank;
  late int _points;
  late String _name;
  late String _goal;
  late String _duration;
  late String _time;
  late String _deposit;
  late int _members;

  _JoinedTeamInfoState(String rank, int points, String name, String goal, String duration, String time, String deposit, int members) {
    _rank = rank;
    _points = points;
    _name = name;
    _goal = goal;
    _duration = duration;
    _time = time;
    _deposit = deposit;
    _members = members;
  }

  bool clicked = false;


  Future<Map<dynamic, dynamic>> handleTeam(String teamName) async {
    //GET request
    try{
      Map<dynamic, dynamic> teamInfo = {};
      teamInfo = await GetTeamMainAPI.getTeamMain(teamName);
      // as List<Map<String, dynamic>>;
      return teamInfo;
    }
    catch(e) {
      print('실패함');
      print(e.toString());
      return {};
    }
  }

  Future<List<dynamic>> getChat(String teamName) async {
    //GET request
    try{
      var a = await GetChatAPI.getChat(teamName);
      final body = json.decode(a.body.toString());
      //result from GET
      final result = body['chats'];
      // print(result);
      List<dynamic> chats = result;
      // as List<Map<String, dynamic>>;
      return chats;
    }
    catch(e) {
      print('실패함');
      print(e.toString());
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            // width: 600,
            // height: 90,
            decoration: const BoxDecoration(
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
                const Spacer(),
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
                            //request team info API, get info
                            final Future<Map<dynamic, dynamic>> infop = handleTeam(_name);
                            Map<dynamic, dynamic> info = await infop;

                            final Future<List<dynamic>> chatp = getChat(_name);
                            List<dynamic> chat = await chatp;

                            Navigator.push(context, MaterialPageRoute(
                              builder: (_) => TeamPage(_rank, _points, info, chat)));
                          },
                          child: const Text(
                            "Enter",
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
                      borderRadius: const BorderRadius.all(Radius.circular(15))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TeamTitle(text: "Goal: ", size: 15),
                            TeamText(text: '$_goal', size: 15),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TeamTitle(text: "Duration: ", size: 15),
                            TeamText(text: '$_duration', size: 15),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TeamTitle(text: "Meeting: ", size: 15),
                            TeamText(text: '$_time', size: 15),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TeamTitle(text: "Deposit: ", size: 15),
                            TeamText(text: '$_deposit', size: 15),
                          ],
                        ),
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