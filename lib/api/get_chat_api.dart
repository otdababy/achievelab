import 'dart:ui';

import 'package:http/http.dart' as http;
import 'dart:convert';


class GetChatAPI {
  static Future<http.Response> getChat(String? teamName) async {
    final url = Uri.parse('https://getchatsapi-3byil7ydha-uc.a.run.app');
    var a = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'teamName' : teamName!,
          
        })
    );
    return a;
  }
}