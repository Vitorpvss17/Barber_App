import 'package:flutter/material.dart';

class User {
  final String imageSettings;
  final String nome;
  final String email;
  final String telefone;

  User( {
    required this.imageSettings,
    required this.nome,
    required this.email,
    required this.telefone,
  }
      );
}

class UserSettings extends ChangeNotifier {
  final List<User> _user = [];

  List<User> get users => _user;

  void changeUser(User user) {
    _user.add(user);
    notifyListeners();
  }
}
