import 'package:achievelab/leaderboard/teamcontainer.dart';
import 'package:achievelab/teamlist/teaminfo.dart';
import 'package:achievelab/widget/appbar.dart';
import 'package:achievelab/widget/rankbar.dart';
import 'package:flutter/material.dart';
import 'package:achievelab/widget/styledtext.dart';

class LeaderboardPage extends StatefulWidget {
  late List<dynamic> _name;
  late String _rank;
  late int _points;
  LeaderboardPage(String rank, int points, List<dynamic> name){
    _name = name;
    _rank = rank;
    _points = points;
  }

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState(_rank, _points, _name);
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  late String _rank;
  late int _points;
  late List<dynamic> _name;
  //
  _LeaderboardPageState(String rank, int points, List<dynamic> name) {
    _rank = rank;
    _points = points;
    _name = name;
  }

  void translate(String text){
    //send text, translate via gpt, get result, send it to result page
    // Navigator.push(context, MaterialPageRoute(
    //     builder: (_) => ResultPage(text)));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: RankBar(_rank, _points)),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledText(text: "Waking Up Challenge 2023 November", size: 30),
                  Container(height: 15,),
                  for(int i=0; i< _name.length;i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      StyledText(text: "${i+1}", size: 20),
                      Container(width: 5,),
                      TeamContainer("${_name[i]['teamName']}", _name[i]['totalPoints']),
                    ],
                  ),


                ],
              ),
              Container(width: 50,),
              Column(
                children: [
                  Container(height: 100,),
                  Container(
                      width: 550,
                      height: 280,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(15)),            
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Container(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  "November Leaderboard Award",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      // fontFamily: 'SnowCrab',
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700
                                  ),
                              ),
                            ],
                          ),
                          Container(height: 40,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 100),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "First Place",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            // fontFamily: 'SnowCrab',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700
                                        ),
                                    ),
                                    Text(
                                        "1000 points",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.blue,
                                            // fontFamily: 'SnowCrab',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700
                                        ),
                                    ),
                                  ],
                                ),
                                Container(height: 15,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "Second Place",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            // fontFamily: 'SnowCrab',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700
                                        ),
                                    ),
                                    Text(
                                        "500 points",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.blue,
                                            // fontFamily: 'SnowCrab',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700
                                        ),
                                    ),
                                  ],
                                ),
                                Container(height: 15,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "Third Place",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            // fontFamily: 'SnowCrab',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700
                                        ),
                                    ),
                                    Text(
                                        "300 points",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.blue,
                                            // fontFamily: 'SnowCrab',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700
                                        ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],),
                      )
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}
