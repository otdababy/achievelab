import 'package:achievelab/widget/appbar.dart';
import 'package:achievelab/widget/interestbutton.dart';
import 'package:flutter/material.dart';
import 'package:achievelab/widget/styledbutton.dart';
import 'package:achievelab/widget/styledtext.dart';

class TeamPage extends StatefulWidget {
  late String _name;
  TeamPage(String name){
    _name = name;
  }
  
  @override
  State<TeamPage> createState() => _TeamPageState(_name);
}

class _TeamPageState extends State<TeamPage> {
  late String _name;

  _TeamPageState(String name) {
    _name = name;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: StyledAppBar()),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                StyledText(text: "$_name Challenge 2023 Week 40", size: 30),
              ],
            ),
            Column(
              children: [

              ],
            )
          ],
        )
    );
  }
}
