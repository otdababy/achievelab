import 'package:achievelab/leaderboard/teamcontainer.dart';
import 'package:achievelab/teamlist/teaminfo.dart';
import 'package:flutter/material.dart';
import 'package:achievelab/widget/styledtext.dart';

class ProfilePage extends StatefulWidget {
  late String _name;
  ProfilePage(String name){
    _name = name;
  }

  @override
  State<ProfilePage> createState() => _ProfilePageState(_name);
}

class _ProfilePageState extends State<ProfilePage> {
  late String _name;
  //
  _ProfilePageState(String name) {
    _name = name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: StyledAppBar()),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //First horizontal block that consists of profile picture and participating teams
              Row(
                children: [
                  //Profile picture and name column
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //Circular profile picture
                      Container(height: 10,),
                      StyledText(text: _name, size: 25)
                    ],
                  ),
                  Container(
                      width: 600,
                      height: 250,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Column(
                        children: [

                        ],
                      )
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}
