import 'package:achievelab/leaderboard/leaderboard_page.dart';
import 'package:achievelab/select_page.dart';
import 'package:achievelab/signup_pop.dart';
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

// IMport ProfilePage
import 'package:achievelab/profile/profile_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _idController = TextEditingController();
  final _pwController = TextEditingController();
  final _nameController = TextEditingController();

  bool validateName(String value) {
    RegExp regex = RegExp(r'^(?=.*?[a-z]).{4,}$');
    if (value.isEmpty) {
      return false;
    } else {
      if (!regex.hasMatch(value)) {
        return false;
      } else {
        return true;
      }
    }
  }

  bool validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return false;
    } else {
      if (!regex.hasMatch(value)) {
        return false;
      } else {
        return true;
      }
    }
  }

  Future<Map<dynamic, dynamic>> handleProfile(String userName) async {
    //GET request
    try {
      Map<dynamic, dynamic> profileInfo = {};
      profileInfo = await GetProfileAPI.getProfile(userName);
      // as List<Map<String, dynamic>>;
      return profileInfo;
    } catch (e) {
      print('실패함');
      print(e.toString());
      return {};
    }
  }

  void signup(String email, String password, String name) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);

      var displayName = FirebaseAuth.instance.currentUser!.displayName!;

      await FirebaseFirestore.instance
          .collection("users")
          .doc(displayName)
          .set({
        "name": displayName,
        "social_credit": 100,
        "team_refs": [],
        "team_points": {},
        "deposits": {},
        "progress": {},
      }).then((e) async {});

      print("new user ${displayName} is written");

      Navigator.push(
          context, MaterialPageRoute(builder: (_) => SelectPage(name)));
    });

    // Handle Authorization
    // FirebaseAuth.instance
    //     .signInWithEmailAndPassword(email: email, password: password)
    //     .then((value) => {
    //           Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                   builder: (_) => SelectPage(value.user!.displayName!)))
    //         })
    //     .catchError((error) => print(error));
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
              Container(
                height: 5,
              ),
              _idField,
              Container(
                height: 5,
              ),
              _pwField,
              Container(
                height: 5,
              ),
              StyledButton(
                  text: "Sign Up",
                  width: 250,
                  height: 60,
                  press: () async {
                    if (!validatePassword(_pwController.text)) {
                      //pop up for wrong pw
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            //ask score system api
                            return Popup(
                              title:
                                  "Password should be longer than 7 characters and contain more than one uppercase, one lower case, one digit, and one special character",
                            );
                          });
                    } else if (!validateName(_nameController.text)) {
                      //pop up for wrong name
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            //ask score system api
                            return Popup(
                              title:
                                  "Nickname should be at least 4 characters long",
                            );
                          });
                    }
                    else{
                      signup(_idController.text, _pwController.text,
                        _nameController.text);
                    }
                    
                  })
            ],
          ),
        ));
  }
}
