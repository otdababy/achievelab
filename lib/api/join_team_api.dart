import 'dart:ui';

import 'package:http/http.dart' as http;
import 'dart:convert';



class JoinTeamAPI {
  static Future<http.Response> joinTeam(String? userName, String? teamName) async {
    final url = Uri.parse('https://jointeam-3byil7ydha-uc.a.run.app');
    var a = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'userName' : userName,
          'teamName' : teamName,
        })
    );
    return a;
  }
}