// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:achievelab/profile/teamrec.dart';
import 'package:achievelab/teamlist/teaminfo.dart';
import 'package:flutter/material.dart';
import 'package:achievelab/widget/styledtext.dart';
import 'package:achievelab/widget/appbar.dart';
import 'package:achievelab/profile/joinedteaminfo.dart';



class ProfilePage extends StatefulWidget {
  late Map<dynamic,dynamic> _info;
  ProfilePage(Map<dynamic,dynamic> info){
    _info = info;
  }

  @override
  State<ProfilePage> createState() => _ProfilePageState(_info);
}

class _ProfilePageState extends State<ProfilePage> {
  late Map<dynamic,dynamic> _info;
  //
  _ProfilePageState(Map<dynamic,dynamic> info) {
    _info = info;
  }

  List<dynamic> teams = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: StyledAppBar()),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Profile picture and name column
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Circular profile picture
                        const CircleAvatar(
                          radius: 100.0,
                          // backgroundImage:
                          // NetworkImage("${snapshot.data.hitsList[index].previewUrl}"),
                          backgroundColor: Colors.grey,
                        ),
                        Container(height: 10,),
                        StyledText(text: _info["name"], size: 25),
                        Container(height: 20,),
                        Container(
                          width: 300,
                          height: 110,
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rank: ${_info['tier']}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      // fontFamily: 'SnowCrab',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                                Text(
                                  'Social Points: ${_info['social_credit']}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      // fontFamily: 'SnowCrab',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),
                        Container(height: 10,),
                        Container(
                          width: 300,
                          height: 200,
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(child: Text(
                                    'Awards',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        // fontFamily: 'SnowCrab',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),),
                                  ],
                                ),
                                Container(height: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '- Best walker in Daejeon',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          // fontFamily: 'SnowCrab',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    Container()
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(width: 50,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Container(height: 130,),
                        Container(
                            width: 800,
                            // height: 290,
                            decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(60.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'You are joining...',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        // fontFamily: 'SnowCrab',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Container(height: 20,),
                                  for(var i =0; i<_info['joining_teams'].length; i++)
                                  JoinedTeamInfo("${_info['joining_teams'][i]['name']}", "${_info['joining_teams'][i]['description']}",
                             "10/1-10/31", "5PM, Every Sunday","500 points, 30 points deducted per failure", _info['joining_teams'][i]['numMembers'] ),
                                
                                ],
                              ),
                            )
                        ),
                        Container(height: 20,),
                        Container(
                            width: 800,
                            // height: 290,
                            decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(60.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'How about these new clubs?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        // fontFamily: 'SnowCrab',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Container(height: 20,),
                                  TeamRec("AchieveLab", "Running 3km everyday",
                             "10/1-10/31", "5PM, Every Sunday","500 points, 30 points deducted per failure", 7, ),
                                  TeamRec("AchieveLab", "Running 3km everyday",
                             "10/1-10/31", "5PM, Every Sunday","500 points, 30 points deducted per failure", 7, ),
                                
                                ],
                              ),
                            )
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
