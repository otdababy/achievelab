
import 'package:achievelab/leaderboard/leaderboard_page.dart';
import 'package:flutter/material.dart';
import 'package:achievelab/widget/styledtext.dart';
import '../select_page.dart';
import '../profile/profile_page.dart';


class StyledAppBar extends StatelessWidget {
  const StyledAppBar({
    Key? key,
  }) : super(key: key);


  @override

  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: StyledText(text: "AchieveLab",size: 20,),
          ),
        ],
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
                PopupMenuItem<int>(
                  value: 2,
                  child: Text("Join new teams"),
                ),
              ];
            },
            onSelected:(value){
              if(value == 0){
                //move to my profile page, call API and get info
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => ProfilePage("Chaemin")));
              }else if(value == 1){
                //move to leaderboard page, with my team, save which team he or she is on
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => LeaderboardPage("Running")));
              }else if(value == 2){
                //move to team selection page, but with a popup saying you can't join more than one team for beta version.
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => SelectPage("CJ")));
              }
            }
        ),
      ],
    );
  }
}