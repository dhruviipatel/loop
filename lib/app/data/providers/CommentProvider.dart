import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CommentProvider with ChangeNotifier {
  Future AddNewComment(postid, mycomment, userid) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var mytoken = sp.getString("token")!;

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mytoken',
    };

    var commentApi = "https://looptest.inventdi.com/api/Post/postComment";
    final body = jsonEncode({
      'post_id': postid.toString(),
      'post_comment': mycomment,
      'user_id': userid,
    });

    print("JSON data: ${body}");

    var response =
        await http.post(Uri.parse(commentApi), body: body, headers: headers);

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("comment successfull");
    } else {
      print("comment failed");
    }
    notifyListeners();
  }

  bool _isCommentLiked = false;
  get isCommentLiked => _isCommentLiked;

  List _cmtlikeList = [];
  get cmtlikeList => _cmtlikeList;

  void getcmtlikeList(context, commentlikeList) {
    _cmtlikeList = commentlikeList;

    print(_cmtlikeList);
  }

  Future doCommentLike(userid, postid, postcommentid) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var mytoken = sp.getString("token")!;

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mytoken',
    };

    var commentlikeApi =
        "https://looptest.inventdi.com/api/Post/postCommentLike";
    final body = jsonEncode({
      'post_id': postid.toString(),
      'user_id': userid,
      'post_comment_id': postcommentid,
    });

    print("JSON data: ${body}");

    var response = await http.post(Uri.parse(commentlikeApi),
        body: body, headers: headers);

    if (response.statusCode == 200) {
      _isCommentLiked = true;
      print("comment like successfull");
    } else {
      print("comment like failed");
    }
    notifyListeners();
  }

  Future undoCommentLike(
      cuserid, postcommentlikeid, postId, postCommentId) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var mytoken = sp.getString("token")!;

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mytoken',
    };

    var commentdislikeApi =
        "https://looptest.inventdi.com/api/Post/postCommentDislike";
    final body = jsonEncode({
      'post_id': postId.toString(),
      'post_comment_like_id': postcommentlikeid,
      'post_comment_id': postCommentId,
      'user_id': cuserid,
    });

    print("JSON data: ${body}");

    var response = await http.post(Uri.parse(commentdislikeApi),
        body: body, headers: headers);

    if (response.statusCode == 200) {
      print("likelist:${_cmtlikeList}");
      _isCommentLiked = false;
      print("comment like remove successfull");
      notifyListeners();
    } else {
      print("comment like remove failed");
    }
    notifyListeners();
  }
}
