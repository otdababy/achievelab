
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'dart:convert';


class GetRankAPI {
  static Future<http.Response> LeaderBoardAPI() async {
    final url = Uri.parse('https://leaderboardapi-3byil7ydha-uc.a.run.app');
    var a = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
    );
    return a;
  }
}