import 'package:achievelab/teamlist/teamtext.dart';
import 'package:achievelab/widget/appbar.dart';
import 'package:achievelab/widget/interestbutton.dart';
import 'package:flutter/material.dart';
import 'package:achievelab/widget/styledbutton.dart';
import 'package:achievelab/widget/styledtext.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class TeamPage extends StatefulWidget {
  late Map<dynamic, dynamic> _info;
  TeamPage(Map<dynamic, dynamic> info){
    _info = info;
  }
  
  @override
  State<TeamPage> createState() => _TeamPageState(_info);
}

class _TeamPageState extends State<TeamPage> {
  late Map<dynamic, dynamic> _info;

  _TeamPageState(Map<dynamic, dynamic> info) {
    _info = info;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: StyledAppBar()),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container
                    (
                      width: 700,
                      height: 110,
                      decoration: BoxDecoration(
                              color: Colors.blue.shade400,
                              borderRadius: BorderRadius.all(Radius.circular(15)),            
                            ),
                      child: Center(
                        child: Text(
                          "2023.11.13 Week 10 of Running Challenge",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
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
                            "Social Points Left",
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
                              color: Colors.blue.shade400,
                              borderRadius: BorderRadius.all(Radius.circular(15)),            
                            ),
                            child: Center(
                              child: 
                                Text(
                                  "100pts",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
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
                Container(height: 20,),
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
                                              color: Colors.blue.shade900,
                                              // fontFamily: 'SnowCrab',
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700
                                          ),
                                    ),
                                    Container(width: 50,),
                                    Container(
                                      width: 80,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
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
                                  
                                  ],
                                ),
                    ),
                    Container(height: 30,),
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
                  height: 450,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(15)),            
                  ),
                ),
                Container(height: 10,),
                Container(
                  width: 870,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(15)),            
                  ),
                  child: 
                    Center(
                      child: TextField(
                        
                      ),
                    ),
                ),
              ],
            ),
            Container(width: 40,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                  child: Center(
                    child: 
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TeamText(text: "Goal: ", size: 15),
                        TeamText(text: "Duration: ", size: 15),
                        TeamText(text: "Meeting: ", size: 15),
                        TeamText(text: "Deposit: ", size: 15),
                      ],
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
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(15)),            
                  ),
                  child: Center(
                    child: 
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                      ],
                    ),
                  ),
                ),
              

              ],
            )
          ]
        ),
    );
  }
}
