import 'dart:ui';

import 'package:http/http.dart' as http;
import 'dart:convert';

// userName, teamName, message
class PostChatAPI {
  static Future<http.Response> postChat(String? userName, String? teamName, String? message) async {
    final url = Uri.parse('https://addchatapi-3byil7ydha-uc.a.run.app');
    var a = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'teamName' : teamName,
          'userName' : userName,
          'message' : message,
          
        })
    );
    return a;
  }
}