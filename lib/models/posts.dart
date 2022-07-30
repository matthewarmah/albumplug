import 'package:flutter/material.dart';

class Post {
  final String userUid;
  final String imageUrl;
  final String title;
  final String text;
  Post({
    required this.userUid,
    required this.imageUrl,
    required this.text,
    required this.title,
  });
  static Post fromJSON(json) {
    return Post(
        userUid: json['userUid'],
        imageUrl: json['imageUrl'],
        title: json['title'],
        text: json['text']);
  }
}

