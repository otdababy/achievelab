import 'package:achievelab/leaderboard/leaderboard_page.dart';
import 'package:achievelab/select_page.dart';
import 'package:achievelab/teamlist/teamtext.dart';
import 'package:achievelab/widget/appbar.dart';
import 'package:achievelab/widget/styledbutton.dart';
import 'package:achievelab/widget/styledtext.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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

  void login(String name){
    //send name and then push to main page
    Navigator.push(context, MaterialPageRoute(
        builder: (_) => SelectPage(name)));
  }


  @override
  Widget build(BuildContext context) {
    //name field
    var _nameField =
    Container(
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
              onChanged: (text){
                setState(() {
                });
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


    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: StyledAppBar()),
        // body: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       StyledText(text: "Welcome to Achieve Lab!", size: 40),
        //       Container(height: 60,),
        //       _nameField,
        //       StyledButton(text: "Log In", width: 250, height: 60, press: (){
        //         login(_nameController.text);})
        //     ],
        //   ),
        // )
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container
                    (
                      width: 700,
                      height: 110,
                      decoration: BoxDecoration(
                              color: Colors.blue.shade400,
                              borderRadius: BorderRadius.all(Radius.circular(15)),            
                            ),
                      child: Center(
                        child: Text(
                          "2023.11.13 Week 10 of Running Challenge",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              // fontFamily: 'SnowCrab',
                              fontSize: 30,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                    ),
                    Container(width: 20,),
                    Column(
                      children: [
                        Text(
                            "Social Points Left",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                // fontFamily: 'SnowCrab',
                                fontSize: 17,
                                fontWeight: FontWeight.w700
                            ),
                        ),
                        Container(height: 5,),
                        Container(
                            width: 150,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade400,
                              borderRadius: BorderRadius.all(Radius.circular(15)),            
                            ),
                            child: Center(
                              child: 
                                Text(
                                  "100pts",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      // fontFamily: 'SnowCrab',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700
                                  ),
                              ),
                            ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Progress",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            // fontFamily: 'SnowCrab',
                            fontSize: 17,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    // Container(height: 10,),
                    Container(
                                width: 870,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.all(Radius.circular(15)),            
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(width: 30,),
                                    Text(
                                          "You",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.blue.shade900,
                                              // fontFamily: 'SnowCrab',
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700
                                          ),
                                    ),
                                    Container(width: 50,),
                                    Container(
                                      width: 80,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.all(Radius.circular(15)),            
                                      ),
                                      child: Center(
                                        child: Text(
                                            "O",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                // fontFamily: 'SnowCrab',
                                                fontSize: 20,
                                                fontWeight: FontWeight.w900
                                            ),
                                                                          ),
                                      ),
                                    ),
                                  
                                  ],
                                ),
                    ),
                    Container(height: 30,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                              "Chat",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  // fontFamily: 'SnowCrab',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                    ),
                  ],
                ),
                Container(
                  width: 870,
                  height: 450,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(15)),            
                  ),
                ),
                Container(height: 10,),
                Container(
                  width: 870,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(15)),            
                  ),
                  child: 
                    Center(
                      child: TextField(
                        
                      ),
                    ),
                ),
              ],
            ),
            Container(width: 40,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                              "Goal",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  // fontFamily: 'SnowCrab',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700
                              ),
                ),
                Container(height: 10,),
                Container(
                  width: 400,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(15)),            
                  ),
                  child: Center(
                    child: 
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TeamText(text: "Goal: ", size: 15),
                        TeamText(text: "Duration: ", size: 15),
                        TeamText(text: "Meeting: ", size: 15),
                        TeamText(text: "Deposit: ", size: 15),
                      ],
                    ),
                  ),
                ),
                Container(height: 30,),
                Text(
                  "Team Leaderboard",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      // fontFamily: 'SnowCrab',
                      fontSize: 17,
                      fontWeight: FontWeight.w700
                  ),
                ),
                Container(height: 10,),
                Container(
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(15)),            
                  ),
                  child: Center(
                    child: 
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                      ],
                    ),
                  ),
                ),
              

              ],
            )
          ]
        ),
            
    );

  }
}
