import 'dart:convert';

import 'package:achievelab/api/get_chat_api.dart';
import 'package:achievelab/api/post_chat_api.dart';
import 'package:achievelab/api/set_progress_api.dart';
import 'package:achievelab/signup_pop.dart';
import 'package:achievelab/teamlist/teamtext.dart';
import 'package:achievelab/teamroom/chatbox.dart';
import 'package:achievelab/teamroom/goaltext.dart';
import 'package:achievelab/teamroom/goaltitle.dart';
import 'package:achievelab/teamroom/mychat.dart';
import 'package:achievelab/teamroom/progresspop.dart';
import 'package:achievelab/teamroom/progresspopf.dart';
import 'package:achievelab/widget/appbar.dart';
import 'package:achievelab/widget/interestbutton.dart';
import 'package:achievelab/widget/rankbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:achievelab/widget/styledbutton.dart';
import 'package:achievelab/widget/styledtext.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';


class TeamPage extends StatefulWidget {
  late String _rank;
  late int _points;
  late Map<dynamic, dynamic> _info;
  late List<dynamic> _chat;

  TeamPage(String rank, int points, Map<dynamic, dynamic> info, List<dynamic> chat){
    _rank = rank;
    _points = points;
    _info = info;
    _chat = chat;
  }
  
  @override
  State<TeamPage> createState() => _TeamPageState(_rank, _points, _info,  _chat);
}

class _TeamPageState extends State<TeamPage> {
  late String _rank;
  late int _points;
  late Map<dynamic, dynamic> _info;
  late List<dynamic> _chat;

  _TeamPageState(String rank, int points,Map<dynamic, dynamic> info, List<dynamic> chat) {
    _rank = rank;
    _points = points;
    _info = info;
    _chat = chat;
  }

  void postChat(String teamName, String userName, String message) async {
    //GET request
    try{
      var a = await PostChatAPI.postChat(userName, teamName, message);
      final body = json.decode(a.body.toString());
      //posted
      // print(body['result']);
    }
    catch(e) {
      print('실패함');
      print(e.toString());
      
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

  Future<Map<dynamic,dynamic>> postProgress(String teamName, String userName) async {
    //GET request
    try{
      var a = await SetProgressAPI.setProgress(userName, teamName);
      final body = json.decode(a.body.toString());
      //posted
      return body;
      // print(body['result']);
    }
    catch(e) {
      print('실패함');
      print(e.toString());
      return {};
      
    }
  }

  bool isSuccess(){
    var now = new DateTime.now();
      
      var formatter = new DateFormat('yyyyMMdd');
      String formattedDate = formatter.format(now);
      var dt = DateTime.now();
      bool success = false;
      if (dt.hour > 6 && dt.hour < 9)
        success = true;
      
      return success;
  }

  void scrollDown(){
    var scrollPosition = _controller.position;
    if (scrollPosition.viewportDimension < scrollPosition.maxScrollExtent) {
      _controller.animateTo(
        scrollPosition.maxScrollExtent,
        duration: new Duration(milliseconds: 10),
        curve: Curves.easeOut,
      );
    }
  }

  final user = FirebaseAuth.instance.currentUser!.displayName;

  final _chatController = TextEditingController();
  final ScrollController _controller = ScrollController();
  

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => scrollDown());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: RankBar(_rank, _points)),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(height: 20,),
                Row(
                  children: [
                    Container
                    (
                      width: 700,
                      height: 110,
                      decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(15)),            
                            ),
                      child: Center(
                        child: Text(
                          "${_info['date']} Waking Up Challenge",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              // fontFamily: 'SnowCrab',
                              fontSize: 30,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                    ),
                    Container(width: 20,),
                    Column(
                      children: [
                        Text(
                            "Deposit Left",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                // fontFamily: 'SnowCrab',
                                fontSize: 17,
                                fontWeight: FontWeight.w700
                            ),
                        ),
                        Container(height: 5,),
                        Container(
                            width: 150,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(15)),            
                            ),
                            child: Center(
                              child: 
                                Text(
                                  "${_info['deposit_left']}pts",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      // fontFamily: 'SnowCrab',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700
                                  ),
                              ),
                            ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Progress",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            // fontFamily: 'SnowCrab',
                            fontSize: 17,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    // Container(height: 10,),
                    Container(
                                width: 870,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.all(Radius.circular(15)),            
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(width: 30,),
                                    Text(
                                          "You",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              // fontFamily: 'SnowCrab',
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700
                                          ),
                                    ),
                                    Container(width: 50,),
                                    for(int i=0; i < _info['all_progress'][user].length; i++)
                                    _info['all_progress'][user][i] == true ?
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: 80,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.all(Radius.circular(15)),            
                                        ),
                                        child: Center(
                                          child: Text(
                                              "O",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  // fontFamily: 'SnowCrab',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w900
                                              ),
                                                                            ),
                                        ),
                                      ),
                                    ) : Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: 80,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.red.shade800,
                                          borderRadius: BorderRadius.all(Radius.circular(15)),            
                                        ),
                                        child: Center(
                                          child: Text(
                                              "X",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  // fontFamily: 'SnowCrab',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w900
                                              ),
                                                                            ),
                                        ),
                                      ),
                                    )
                                  
                                  ],
                                ),
                    ),
                    Container(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                              "Chat",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  // fontFamily: 'SnowCrab',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                    ),
                  ],
                ),
                Container(
                  width: 870,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(15)),            
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      
                      controller: _controller,
                      child: Column(children: [
                      for(var i =0; i< _chat.length; i++)
                        _chat[i][0] == FirebaseAuth.instance.currentUser!.displayName ? 
                        myChat(_chat[i]['user'], _chat[i]['message'])
                        : ChatBox(_chat[i]['user'], _chat[i]['message'])
                    ],)),
                  ),
                ),
                Container(height: 10,),
                Row(
                  children: [
                    Container(
                      width: 780,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(15)),            
                      ),
                      child: 
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                          child: Center(
                            child: TextField(
                              controller: _chatController,
                              decoration: new InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                              hintText: 'Message your friends!',
                            ),
                            ),
                          ),
                        ),
                    ),
                    Container(width: 10,),
                    GestureDetector(
                      onTap: () async {
                        final user = FirebaseAuth.instance.currentUser;
                        final name = user!.displayName!;
                        postChat(_info['team_name'], name, _chatController.text);
                        final Future<List<dynamic>> chatp = getChat(_info['team_name']);
                        List<dynamic> chat = await chatp;
                        // setState(() {
                        //   _chat = chat;
                        //   _controller.jumpTo(_controller.position.maxScrollExtent);
                        // });
                        Navigator.push(context, MaterialPageRoute(
                          builder: (_) => TeamPage(_rank, _points, _info, chat)));
                      },
                      child: Container(width: 80,
                        height: 80, decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(15)),            
                        ),
                        child: Center(
                          child: Text(
                          "Send",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              // fontFamily: 'SnowCrab',
                              fontSize: 17,
                              fontWeight: FontWeight.w700
                          ),
                                            ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(width: 40,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(height: 20,),

                Text(
                  "Goal",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      // fontFamily: 'SnowCrab',
                      fontSize: 17,
                      fontWeight: FontWeight.w700
                  ),
                ),
                Container(height: 10,),
                Container(
                  width: 400,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(15)),            
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: 
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GoalTitle(text: "Goal: ", size: 15),
                              GoalText(text: "${_info['description']}", size: 15),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GoalTitle(text: "Duration:", size: 15),
                              GoalText(text: " 10/1-10/31", size: 15),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GoalTitle(text: "Meeting: ", size: 15),
                              GoalText(text: "5PM, Every Sunday", size: 15),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GoalTitle(text: "Deposit: ", size: 15),
                              GoalText(text: "100 points, 30 points deducted per failure", size: 15),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(height: 30,),
                Text(
                  "Team Leaderboard",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      // fontFamily: 'SnowCrab',
                      fontSize: 17,
                      fontWeight: FontWeight.w700
                  ),
                ),
                Container(height: 10,),
                Container(
                  width: 400,
                  // height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(15)),            
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for(var i =0; i<_info['leaderboard'].length; i++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${i+1}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  // fontFamily: 'SnowCrab',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            Text(
                              "${_info['leaderboard'][i].key}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  // fontFamily: 'SnowCrab',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            Text(
                              "${_info['leaderboard'][i].value}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.blue,
                                  // fontFamily: 'SnowCrab',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(height: 60,),
                Text(
                  "Did I succeed today?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      // fontFamily: 'SnowCrab',
                      fontSize: 17,
                      fontWeight: FontWeight.w700
                  ),
                ),
                Container(height: 10,),
                GestureDetector(
                  onTap: () async {
                    Future<Map> res = postProgress(_info['team_name'], user!);
                    Map<dynamic,dynamic> prog = await res;
                    prog['result']['isSuccess'] == false ? 
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            //ask score system api
                        return Popup(title: "You already completed your goal for today!");
                        }
                      )
                    :
                      isSuccess() == true ? 
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            //ask score system api
                        return ProgressPop(prog['result']['body'], _info['team_name']);
                      }
                    ) : await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            //ask score system api
                        return ProgressPopF(prog['result']['body'], _info['team_name']);
                      }
                    );
                  },
                  child: Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(30)),            
                    ),
                    child: 
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "I woke up!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  // fontFamily: 'SnowCrab',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            Container(width: 5,),
                            Text(
                              "+5",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  // fontFamily: 'SnowCrab',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500
                              ),
                                            ),
                          ],
                        ),
                      ),
                  ),
                )
              ],
            )
          ]
        ),
    );
  }
}
