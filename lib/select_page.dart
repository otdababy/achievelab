import 'package:achievelab/widget/appbar.dart';
import 'package:achievelab/widget/interestbutton.dart';
import 'package:flutter/material.dart';
import 'package:achievelab/widget/styledbutton.dart';
import 'package:achievelab/widget/styledtext.dart';

class SelectPage extends StatefulWidget {
  late String _name;
  SelectPage(String name){
    _name = name;
  }
  
  @override
  State<SelectPage> createState() => _SelectPageState(_name);
}

class _SelectPageState extends State<SelectPage> {
  late String _name;

  _SelectPageState(String name) {
    _name = name;
  }

  void translate(String text){
    //send text, translate via gpt, get result, send it to result page
    // Navigator.push(context, MaterialPageRoute(
    //     builder: (_) => ResultPage(text)));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
