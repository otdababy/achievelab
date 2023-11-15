import 'package:achievelab/leaderboard/teamcontainer.dart';
import 'package:achievelab/teamlist/teaminfo.dart';
import 'package:achievelab/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:achievelab/widget/styledtext.dart';

class LeaderboardPage extends StatefulWidget {
  late List<dynamic> _name;
  LeaderboardPage(List<dynamic> name){
    _name = name;
  }

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState(_name);
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  late List<dynamic> _name;
  //
  _LeaderboardPageState(List<dynamic> name) {
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
              StyledText(text: "Waking Up Challenge 2023 November", size: 30),
              Container(height: 15,),
              for(int i=0; i< _name.length;i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StyledText(text: "$i", size: 20),
                  Container(width: 5,),
                  TeamContainer("${_name[i]['teamName']}", _name[i]['totalPoints']),
                ],
              ),


            ],
          ),
        )
    );
  }
}
