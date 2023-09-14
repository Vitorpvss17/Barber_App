import 'package:flutter/material.dart';

class Post {
  final String imagePath;
  final String comment;
  final String email;

  Post( {
    required this.imagePath,
    required this.comment,
    required this.email,
  }
  );
}

class PostProvider extends ChangeNotifier {
  final List<Post> _posts = [];

  List<Post> get posts => _posts;

  void addPost(Post post) {
    _posts.add(post);
    notifyListeners();
  }
}
