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

import "package:achievelab/api/get_teams_api.dart";

void main() {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AchieveLab',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      routes: {
        // '/team_list' : (context) => TeamListPage();
        // '/leaderboard' : (context) => LeaderboardPage(name);
      },
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _nameController = TextEditingController();
  final _pwController = TextEditingController();

  void login(String email, String password) {
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
                hintText: 'Type your name',
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
              _pwField,
              StyledButton(
                  text: "Log In",
                  width: 250,
                  height: 60,
                  press: () {
                    login(_nameController.text, _pwController.text);
                  })
            ],
          ),
        ));
  }
}
