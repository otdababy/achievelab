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
        body: Center(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    StyledText(text: "Select your interest", size: 40),
                    Container(height: 30,)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InterestButton(text: "Running",name: _name,),
                        InterestButton(text: "Waking up early",name: _name,),
                        InterestButton(text: "Exercising",name: _name,),
                        InterestButton(text: "Eating healthy",name: _name,),
                      ],
                    ),
                    Row(

                    ),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
