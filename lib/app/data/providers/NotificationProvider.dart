import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loop/app/data/models/notificationModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class NotificationProvider with ChangeNotifier {
  List notifi = [];

  mynotification(userid) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var mytoken = sp.getString("token");
    final notifiUrl = "https://looptest.inventdi.com/api/Post/getNotifications";
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mytoken',
    };

    final body = jsonEncode({
      'user_id': userid,
    });
    var response =
        await http.post(Uri.parse(notifiUrl), headers: headers, body: body);

    if (response.statusCode == 200) {
      final nofifyJson = response.body;
      if (nofifyJson.isNotEmpty) {
        var decodednofifyJson = json.decode(nofifyJson);
        var data = decodednofifyJson["data"];

        if (data is List<dynamic>) {
          notifi = data
              .map<Notify>(
                (e) => Notify.fromJson(e),
              )
              .toList();
        } else if (data is Map<String, dynamic>) {
          notifi = [Notify.fromJson(data)];
        }
        notifyListeners();
      } else {
        print('Empty response body');
      }
    } else {
      print('Failed to load notifications');
    }
  }
}
