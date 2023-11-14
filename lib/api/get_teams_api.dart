import 'package:cloud_firestore/cloud_firestore.dart';

class GetTeamsAPI {
  static Future<List> getTeams(String? challengeType) async {
    CollectionReference teams = FirebaseFirestore.instance.collection('teams');

    // Get all teams that have the same challenge type
    var a = await teams.where('challenge_type', isEqualTo: challengeType).get();

    List<Map<String, dynamic>> teamList = [];

    // Iterate, get each team's info, and add to list
    a.docs.forEach((element) {
      Map<String, dynamic> teamInfo = {
        'name': element['name'],
        'description': element['description'],
        // 'duration': element['duration'], // TODO
        // 'meetingTime': element['meeting_time'], // TODO
        'entry_deposit': element['entry_deposit'],
        'numMembers': element['user_refs'].length,
      };
      teamList.add(teamInfo);
    });

    return teamList;
  }
}
