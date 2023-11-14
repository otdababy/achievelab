import 'package:achievelab/leaderboard/leaderboard_page.dart';
import 'package:achievelab/select_page.dart';
import 'package:achievelab/teamlist/teamtext.dart';
import 'package:achievelab/widget/appbar.dart';
import 'package:achievelab/widget/styledbutton.dart';
import 'package:achievelab/widget/styledtext.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// For API testing
import "package:achievelab/api/get_teams_api.dart";
import "package:achievelab/api/get_leaderboard_api.dart";
import "package:achievelab/api/get_profile_api.dart";
import "package:achievelab/api/get_team_main_api.dart";


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _idController = TextEditingController();
  final _pwController = TextEditingController();
  final _nameController = TextEditingController();

  void signup(String email, String password, String name) {
    // Handle Authorization

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => SelectPage(value.user!.displayName!)))
            })
        .catchError((error) => print(error));
  }

  @override
  Widget build(BuildContext context) {
    //name field
    var _idField = Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Center(
        child: Center(
          child: Container(
            width: 210,
            child: TextField(
              onChanged: (text) {
                setState(() {});
              },
              controller: _idController,
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: 'Type your email',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ),
        ),
      ),
    );
    var _pwField = Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Center(
        child: Center(
          child: Container(
            width: 210,
            child: TextField(
              onChanged: (text) {
                setState(() {});
              },
              controller: _pwController,
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: 'Type your password',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ),
        ),
      ),
    );

    var _nameField = Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Center(
        child: Center(
          child: Container(
            width: 210,
            child: TextField(
              onChanged: (text) {
                setState(() {});
              },
              controller: _nameController,
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: 'Type your nickname',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ),
        ),
      ),
    );

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100), child: StyledAppBar()),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledText(text: "Welcome to Achieve Lab!", size: 40),
              Container(
                height: 60,
              ),
              _nameField,
              Container(height: 5,),
              _idField,
              Container(height: 5,),
              _pwField,
              Container(height: 5,),
              StyledButton(
                  text: "Sign Up",
                  width: 250,
                  height: 60,
                  press: () {
                    signup(_idController.text, _pwController.text, _nameController.text);
                  })
            ],
          ),
        ));
  }
}
