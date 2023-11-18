

import 'package:achievelab/api/get_teams_api.dart';
import 'package:achievelab/signup_pop.dart';
import 'package:achievelab/teamlist/teamlist_page.dart';
import 'package:flutter/material.dart';


class InterestButtonB extends StatelessWidget {
  const InterestButtonB({
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
          await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Popup(
                                  title:
                                      "Sorry for the inconvenience.\nYou can only choose Waking up early in the beta version.",
                                );
                              });
        },
        child: Container(
            width: 170,
            height: 90,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: Center(child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
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