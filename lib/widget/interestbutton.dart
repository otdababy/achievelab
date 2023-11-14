
import 'dart:convert';
import 'dart:js';

import 'package:achievelab/api/get_teams_api.dart';
import 'package:achievelab/teamlist/teamlist_page.dart';
import 'package:flutter/material.dart';

import '../select_page.dart';


class InterestButton extends StatelessWidget {
  const InterestButton({
    Key? key,
    required this.text,
    required this.name,
    // required this.size,
    // required this.color,
    // required this.press,
  }) : super(key: key);

  final String text;
  final String name;
  // final int size;
  // final Colors color;
  // final GestureTapCallback press;

  Future<List<dynamic>> getTeamList() async {
    //GET request
    try{
      List<dynamic> teamList = [];
      teamList = await GetTeamsAPI.getTeams("wake_up");
      // as List<Map<String, dynamic>>;
      return teamList;
    }
    catch(e) {
      print('실패함');
      print(e.toString());
      return [];
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () async {
          //call get teams api
          final Future<List> teamListp = getTeamList();
          List<dynamic> teamList = await teamListp;
          Navigator.push(context, MaterialPageRoute(
              builder: (_) => TeamListPage(teamList)));
        },
        child: Container(
            width: 170,
            height: 90,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: Center(child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    // fontFamily: 'SnowCrab',
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                ),
              ),
            ))
        ),
      ),
    );
  }
}