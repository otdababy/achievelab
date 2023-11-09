import 'package:achievelab/teamlist/teaminfo.dart';
import 'package:achievelab/widget/interestbutton.dart';
import 'package:flutter/material.dart';
import 'package:achievelab/widget/styledbutton.dart';
import 'package:achievelab/widget/styledtext.dart';

class TeamListPage extends StatefulWidget {
  late String _name;
  TeamListPage(String name){
    _name = name;
  }

  @override
  State<TeamListPage> createState() => _TeamListPageState(_name);
}

class _TeamListPageState extends State<TeamListPage> {
  late String _name;

  _TeamListPageState(String name) {
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
                    const StyledText(text: "Find your team", size: 40),
                    Container(height: 30,),
                    TeamInfo("AchieveLab", "Running 3km everyday",
                       "10/1-10/31", "5PM, Every Sunday","500 points, 30 points deducted per failure", 7, ),
                    TeamInfo("AchieveLab", "Running 3km everyday",
                      "10/1-10/31", "5PM, Every Sunday","500 points, 30 points deducted per failure", 7, ),
                    TeamInfo("AchieveLab", "Running 3km everyday",
                      "10/1-10/31", "5PM, Every Sunday","500 points, 30 points deducted per failure", 7, )

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
