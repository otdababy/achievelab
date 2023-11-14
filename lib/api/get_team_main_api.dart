import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<bool>> getProgressForOneWeek(dynamic userRef) async {
  // Get user doc
  DocumentSnapshot userDoc = await userRef.get();

  // Get "progress" which is a map of {date : {team_name : "success" / "failure"}}
  Map<String, dynamic> progress = userDoc['progress'];

  List<bool> progressList = [];

  // Get today's date
  DateTime now = DateTime.now();

  // Iterate progress
  for (int i = 0; i < 7; i++) {
    // Get date
    DateTime date = now.subtract(Duration(days: i));

    // Get date string
    String dateString = date.year.toString() +
        "-" +
        date.month.toString() +
        "-" +
        date.day.toString();
    // If date is not in progress, add it
    if (!progress.containsKey(dateString)) {
      progressList.add(false);
    } else {
      // If date is in progress, check if it's success or failure
      if (progress[dateString].containsValue("success")) {
        progressList.add(true);
      } else {
        progressList.add(false);
      }
    }
  }
  return progressList;
}

class GetTeamMainAPI {
  static Future<Map<String, dynamic>> getTeamMain(String? teamName) async {
    CollectionReference teams = FirebaseFirestore.instance.collection('teams');
    // Get doc named `teamName`
    var a = await teams.doc(teamName).get();

    // Date
    // SocialPointsLeft
    // Progress
    // Chat (TODO)
    // Goal
    // Team Leader (TODO)

    List teamPoints = a['team_points'].values.toList();
    teamPoints.sort((a, b) => b.compareTo(a));

    // For each user, get their progress
    Map<String, dynamic> progress = {};
    for (var userRef in a['user_refs']) {
      // Get userRef's name
      var userDoc = await userRef.get();
      String userRefName = userDoc['name'];
      progress[userRefName] = await getProgressForOneWeek(userRef);
    }

    Map<String, dynamic> teamMainInfo = {
      "total_points": a['total_points'],
      "description": a['description'],
      "leaderboard": teamPoints, // 
      "all_progress": progress, // userName : [true,false,...]
    };

    return teamMainInfo;
  }
}
