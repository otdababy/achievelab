import 'package:achievelab/teamlist/teaminfo.dart';
import 'package:achievelab/widget/appbar.dart';
import 'package:achievelab/widget/interestbutton.dart';
import 'package:flutter/material.dart';
import 'package:achievelab/widget/styledbutton.dart';
import 'package:achievelab/widget/styledtext.dart';

class TeamListPage extends StatefulWidget {
  late List<dynamic> _teamList;
  TeamListPage(List<dynamic> teamList){
    _teamList = teamList;
  }

  @override
  State<TeamListPage> createState() => _TeamListPageState(_teamList);
}

class _TeamListPageState extends State<TeamListPage> {
  late List<dynamic> _teamList;

  _TeamListPageState(List<dynamic> teamList) {
    _teamList = teamList;
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
        body: Center(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const StyledText(text: "Find your team", size: 40),
                    Container(height: 30,),
                    for(var i =0; i<_teamList.length; i++)
                    TeamInfo("${_teamList[0]['name']}", "Running 3km everyday",
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
