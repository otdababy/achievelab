import 'package:achievelab/widget/appbar.dart';
import 'package:achievelab/widget/interestbutton.dart';
import 'package:flutter/material.dart';
import 'package:achievelab/widget/styledbutton.dart';
import 'package:achievelab/widget/styledtext.dart';

class OtherTeamPage extends StatefulWidget {
  late String _name;
  SelectPage(String name){
    _name = name;
  }
  
  @override
  State<OtherTeamPage> createState() => _OtherTeamPageState(_name);
}

class _OtherTeamPageState extends State<OtherTeamPage> {
  late String _name;

  _OtherTeamPageState(String name) {
    _name = name;
  }

  void translate(String text){
    //send text, translate via gpt, get result, send it to result page
    // Navigator.push(context, MaterialPageRoute(
    //     builder: (_) => ResultPage(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: StyledAppBar()),
        body: Column(
          children: [
            Row(children: [
              Column(
                children: [
                  Container(
                    width: 300,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.all(Radius.circular(15)),            
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Members",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                // fontFamily: 'SnowCrab',
                                fontSize: 20,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                      ],
                    )                           
                   ),
                   Container(height: 15,),
                   Container(
                    width: 300,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.all(Radius.circular(15)),            
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Progress",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                // fontFamily: 'SnowCrab',
                                fontSize: 20,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          Text(
                            "Challenge started since",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                // fontFamily: 'SnowCrab',
                                fontSize: 20,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          Text(
                                  "2023-11-29",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      // fontFamily: 'SnowCrab',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                          Text(
                                  "Total Deposit",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      // fontFamily: 'SnowCrab',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                        ],
                      ),
                    )                           
                   ),


                ],
              ),
              Column(
                children: [

                ],
              )
          
            ],),
            //Awards
            //Team Activity Map
          ],
        )
    );
  }
}
