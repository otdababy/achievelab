
import 'dart:convert';

import 'package:achievelab/api/get_chat_api.dart';
import 'package:achievelab/api/get_rank_api.dart';
import 'package:achievelab/api/get_team_main_api.dart';
import 'package:achievelab/leaderboard/leaderboard_page.dart';
import 'package:achievelab/teamlist/popcontainer.dart';
import 'package:achievelab/teamlist/teamscorepop.dart';
import 'package:achievelab/teamroom/team_page.dart';
import 'package:flutter/material.dart';

import '../widget/styledtext.dart';

class WelcomePop extends StatefulWidget {
  late String _team;
  WelcomePop(String team){
    _team = team;
  }

  @override
  State<WelcomePop> createState() => _WelcomePopState(_team);
}

class _WelcomePopState extends State<WelcomePop> {
  late String _team;

  _WelcomePopState(String team) {
    _team = team;
  }

  Future<List<dynamic>> getRank() async {
    //GET request
    try{
      var a = await GetRankAPI.LeaderBoardAPI();
      final body = json.decode(a.body.toString());
      //result from GET
      final result = body['LeaderBoardInfos'];
      // print(result);
      List<dynamic> rank = result;
      // as List<Map<String, dynamic>>;
      return rank;
    }
    catch(e) {
      print('실패함');
      print(e.toString());
      return [];
    }
  }

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
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.only(top: (10.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'SnowCrab',
                  fontSize: 20,
                  fontWeight: FontWeight.w700
              ),
            ),
            Container(height: 15,),
            const Text(
              "You are now a member of",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'SnowCrab',
                  fontSize: 17,
                  fontWeight: FontWeight.w500
              ),
            ),
            Text(
              "[$_team]",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'SnowCrab',
                  fontSize: 17,
                  fontWeight: FontWeight.w700
              ),
            ),
            Container(height: 30,),
            GestureDetector(
              onTap: (){
                //which type of leaderboard, push
                setState(() async {
                  final Future<List<dynamic>> rankp = getRank();
                List<dynamic> rank = await rankp;
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => LeaderboardPage("Bronze",0,rank)));
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                    width: 235,
                    height: 40,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Check the leaderboard",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SnowCrab',
                                fontSize: 15,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: GestureDetector(
                onTap: () async {
                  final Future<Map<dynamic, dynamic>> infop = handleTeam(_team);
                            Map<dynamic, dynamic> info = await infop;

                            final Future<List<dynamic>> chatp = getChat(_team);
                            List<dynamic> chat = await chatp;

                            Navigator.push(context, MaterialPageRoute(
                              builder: (_) => TeamPage("Bronze",0,info, chat)));
                },
                child: Container(
                    width: 235,
                    height: 40,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Go to the team",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SnowCrab',
                                fontSize: 15,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}