import 'dart:ui';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

// JoinTeamAPI (teamName, userName) 
  // socialCredit
  // deposit
  // failDeduction
  // teamScore
  // initialScore
  // Increment


class SetProgressAPI {
  static Future<http.Response> setProgress(String? userName, String? teamName) async {
    final url = Uri.parse('https://progressapi-3byil7ydha-uc.a.run.app');
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyyMMdd');
    String formattedDate = formatter.format(now);
    var dt = DateTime.now();
    bool success = false;
    if (dt.hour > 6 && dt.hour < 9)
      success = true;
    var a = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'userName' : userName,
          'teamName' : teamName,
          'date' : formattedDate,
          'success' : success
        })
    );
    return a;
  }
}