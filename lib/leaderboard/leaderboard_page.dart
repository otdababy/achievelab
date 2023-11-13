import 'package:achievelab/leaderboard/teamcontainer.dart';
import 'package:achievelab/teamlist/teaminfo.dart';
import 'package:achievelab/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:achievelab/widget/styledtext.dart';

class LeaderboardPage extends StatefulWidget {
  late String _name;
  LeaderboardPage(String name){
    _name = name;
  }

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState(_name);
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  late String _name;
  //
  _LeaderboardPageState(String name) {
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
            preferredSize: const Size.fromHeight(100),
            child: StyledAppBar()),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StyledText(text: "$_name Challenge 2023 Week 40", size: 30),
              Container(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StyledText(text: "1", size: 20),
                  Container(width: 5,),
                  TeamContainer("AchieveLab Team", 85),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StyledText(text: "2", size: 20),
                  Container(width: 5,),
                  TeamContainer("AchieveLab Team", 85),
                ],
              ),


            ],
          ),
        )
    );
  }
}
