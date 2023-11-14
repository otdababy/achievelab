import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<List<bool>> getProgressForOneWeek(dynamic userRef) async {
  // Get user doc
  DocumentSnapshot userDoc = await userRef.get();

  // Get "progress" which is a map of {date : {team_name : "success" / "failure"}}

  Map<String, dynamic> userDocMap = userDoc.data() as Map<String, dynamic>;

  // Check if userDoc has 'progress' field
  Map<String, dynamic> progress = {};
  if (userDocMap.containsKey('progress')) {
    progress = userDoc['progress'];
  }

  List<bool> progressList = [];

  // Get today's date
  DateTime now = DateTime.now();

  // Days since monday
  int weekday = now.weekday;

  // Iterate progress
  for (int i = 0; i < weekday; i++) {
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

    // TeamPoints Map as to List<tuple>
    List<MapEntry<String, dynamic>> teamPoints =
        a['team_points'].entries.toList();

    teamPoints.sort((a, b) => b.value.compareTo(a.value));

    // For each user, get their progress
    Map<String, dynamic> progress = {};
    for (var userRef in a['user_refs']) {
      // Get userRef's name
      var userDoc = await userRef.get();
      String userRefName = userDoc['name'];
      progress[userRefName] = await getProgressForOneWeek(userRef);
    }

    // Points Left =

    // Get date via DateTime.now() as String
    DateTime now = DateTime.now();
    String dateString = now.year.toString() +
        "-" +
        now.month.toString() +
        "-" +
        now.day.toString();

    // Social Points left is

    // user.deposits 에서 가져와
    // Get user ref of current logined user

    var userName = FirebaseAuth.instance.currentUser!.displayName!;

    // Get user doc
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userName)
        .get();

    var deposits = userDoc['deposits'];

    int deposit = deposits[teamName];

    Map<String, dynamic> teamMainInfo = {
      "team_name": a['name'],
      "date": dateString,
      "deposit_left": deposit,
      "description": a['description'],

      "leaderboard": teamPoints, // List<Map<userName,point>>
      "all_progress": progress, // userName : [true,false,...]

    };

    return teamMainInfo;
  }
}
