
import 'package:achievelab/teamlist/joinpop.dart';
import 'package:achievelab/teamlist/teamlist_page.dart';
import 'package:achievelab/teamlist/teamtext.dart';
import 'package:achievelab/widget/styledbutton.dart';
import 'package:achievelab/widget/styledtext.dart';
import 'package:flutter/material.dart';

import '../select_page.dart';

class TeamContainer extends StatefulWidget {
  late String _name;
  // late String _goal;
  // late String _duration;
  // late String _time;
  // late String _deposit;
  // late int _members;
  late int _points;
  TeamContainer(String name, int points, {super.key}){
    // String goal, String duration, String time, String deposit, int members,
    _name = name;
    _points = points;
    // _goal = goal;
    // _duration = duration;
    // _time = time;
    // _deposit = deposit;
    // _members = members;
  }


  @override
  _TeamContainerState createState() => _TeamContainerState(_name, _points);
  // _goal,_duration,_time,_deposit,_members
}

class _TeamContainerState extends State<TeamContainer> {
  late String _name;
  // late String _goal;
  // late String _duration;
  // late String _time;
  // late String _deposit;
  // late int _members;
  late int _points;

  _TeamContainerState(String name, int points) {
    // String goal, String duration, String time, String deposit, int members
    _name = name;
    // _goal = goal;
    // _duration = duration;
    // _time = time;
    // _deposit = deposit;
    // _members = members;
    _points = points;
  }

  bool clicked = false;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: (){setState(() {
          //call API to move onto team page.. get info of the team, feed it to team info page
          // Navigator.push(context, MaterialPageRoute(
          //     builder: (_) => TeamInfoPage(name)));
        });},
        child: Container(
            width: 900,
            height: 90,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Row(
                  children: [
                    StyledText(text: _name, size: 20),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StyledText(text: "$_points p", size: 20),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey),
                        ),
                        width: 150,
                        height: 60,
                        child: TextButton(
                          onPressed: () async {
                            //send join request, show popup after joining,
                            // await showDialog(
                            //     context: context,
                            //     builder: (BuildContext context) {
                            //       //ask score system api
                            //       return JoinPop(team: _name,);
                            //     }
                            // );
                          },
                          child: Text(
                            "Challenge",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                // fontFamily: 'SnowCrab',
                                fontSize: 17,
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
      ),
    );
  }
}