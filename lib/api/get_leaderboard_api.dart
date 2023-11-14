import 'package:cloud_firestore/cloud_firestore.dart';

class GetLeaderboardAPI {
  static Future<List> getLeaderboard(String? challengeType) async {
    CollectionReference teams = FirebaseFirestore.instance.collection('teams');

    // Get all teams that have the same challenge type
    var a = await teams.where('challenge_type', isEqualTo: challengeType).get();

    List<Map<String, dynamic>> teamList = [];

    // Iterate, get each team's info, and add to list
    a.docs.forEach((element) {
      Map<String, dynamic> teamInfo = {
        'name': element['name'],
        'score': element['total_points'],
      };
      teamList.add(teamInfo);
    });

    // Sort by score
    teamList.sort((a, b) => b['score'].compareTo(a['score']));

    return teamList;
  }
}
