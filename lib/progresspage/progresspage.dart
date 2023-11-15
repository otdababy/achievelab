// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:achievelab/api/get_team_main_api.dart';
import 'package:flutter/material.dart';

class BoolGridWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  BoolGridWidget({required this.data});

  @override
  Widget build(BuildContext context) {


    print(data);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bool Grid'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          String key = data.keys.elementAt(index);
          List<bool> values = data[key]!;
          return ListTile(
            title: Text(key),
            subtitle: Row(
              children: values
                  .map((value) => Expanded(
                        child: Container(
                          height: 20,
                          color: value ? Colors.green : Colors.red,
                        ),
                      ))
                  .toList(),
            ),
          );
        },
        // Limit x 
        
      ),
    );
  }
}
