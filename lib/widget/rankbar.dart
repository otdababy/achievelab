
import 'dart:convert';

import 'package:achievelab/api/get_profile_api.dart';
import 'package:achievelab/api/get_rank_api.dart';
import 'package:achievelab/leaderboard/leaderboard_page.dart';
import 'package:flutter/material.dart';
import 'package:achievelab/widget/styledtext.dart';
import '../select_page.dart';
import '../profile/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';


// ignore: must_be_immutable
class RankBar extends StatelessWidget {
  late String _rank;
  late int _points;
  RankBar(rank, points){
    _rank = rank;
    _points = points;
  } 


  Future<Map<dynamic, dynamic>> handleProfile(String userName) async {
    //GET request
    try{
      Map<dynamic, dynamic> profileInfo = {};
      profileInfo = await GetProfileAPI.getProfile(userName);
      // as List<Map<String, dynamic>>;
      return profileInfo;
    }
    catch(e) {
      print('실패함');
      print(e.toString());
      return {};
    }
  }

  Future<List<dynamic>> getRank() async {
    //GET request
    try{
      var a = await GetRankAPI.LeaderBoardAPI();
      final body = json.decode(a.body.toString());
      //result from GET
      final result = body['LeaderBoardInfos'];
      // print(result);
      List<dynamic> rank = result;
      // as List<Map<String, dynamic>>;
      return rank;
    }
    catch(e) {
      print('실패함');
      print(e.toString());
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey.shade100,
      title: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: StyledText(text: "AchieveLab",size: 20,),
            ),
            Row(
              children: [
                _rank == 'bronze' ? 
                  Container(
                    // width: ,
                    height: 50,
                    child: Image.asset(
                      'assets/bronze.png'
                    ),
                  ): 
                  _rank == 'silver' ?
                  Image.asset(
                    'assets/silver.png'
                  )
                  : Container(
                    height: 50,
                    child: Image.asset(
                      'assets/gold.png'
                    ),
                  ),
                Container(width: 20,),
                Text(
                  _rank,
      
                ),
                Container(width: 60,),
                Text("$_points points"),
                Container(width: 120,),
              ],
            ),
            Container(),
          ],
        ),
      ),
      actions: [

        PopupMenuButton(
          // add icon, by default "3 dot" icon
          // icon: Icon(Icons.book)
            itemBuilder: (context){
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text("My Profile"),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text("Leaderboard"),
                ),
                // PopupMenuItem<int>(
                //   value: 2,
                //   child: Text("Join new teams"),
                // ),
              ];
            },
            onSelected:(value) async {
              if(value == 0){
                //move to my profile page, call API and get info
                // Get username from auth
                final user = FirebaseAuth.instance.currentUser;
                final name = user!.displayName!;
                final Future<Map<dynamic,dynamic>> info = handleProfile(name);
                Map<dynamic,dynamic> profileInfo = await info;
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => ProfilePage(profileInfo)));

              }else if(value == 1){
                final user = FirebaseAuth.instance.currentUser;
                final name = user!.displayName!;
                final Future<Map<dynamic,dynamic>> info = handleProfile(name);
                Map<dynamic,dynamic> profileInfo = await info;

                //move to leaderboard page, with my team, save which team he or she is on
              
                final Future<List<dynamic>> rankp = getRank();
                List<dynamic> rank = await rankp;
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => LeaderboardPage(profileInfo['tier'],profileInfo['social_credit'],rank)));
                    
              }
              // else if(value == 2){
              //   //move to team selection page, but with a popup saying you can't join more than one team for beta version.
              //   Navigator.push(context, MaterialPageRoute(
              //       builder: (_) => SelectPage("CJ")));
              // }
            }
        ),
      ],
    );
  }
}