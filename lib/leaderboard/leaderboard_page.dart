import 'package:achievelab/teamlist/teaminfo.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: StyledText(text: "AchieveLab",size: 20,),
              ),
            ],
          ),
        ),
        body: Center(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    StyledText(text: _name, size: 40),


                    //
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
