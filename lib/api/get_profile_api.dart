import 'package:cloud_firestore/cloud_firestore.dart';

import './get_teams_api.dart';

class GetProfileAPI {
  static Future<Map> getProfile(String? userName) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    // Get doc named `userName`
    var a = await users.doc(userName).get();

    // Name, Rank, Social points, awards,

    // Get joining team info
    // var joiningTeams = await getTeamInfo(a["team_refs"]);

    // for each a[team_refs].. call getTeamInfo and shove to list

    var joiningTeams = [];

    for (var teamRef in a["team_refs"]) {
      joiningTeams.add(await GetTeamsAPI.getTeamInfo(teamRef));
    }

    // List of teams
    // New Reccommendations (생략)
    Map<String, dynamic> profileInfo = {
      "name": a['name'],
      "tier": a['tier'],
      "social_credit": a['social_credit'],
      "joining_teams": joiningTeams,
    };
    return profileInfo;
  }
}
