import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import './user.dart';

class Users with ChangeNotifier {
  List<User> _items = [];

  final String authToken;
  final String userId;

  Users(this.authToken, this.userId, this._items);

  Future<void> addUser(User user) async {
    final url = 'http://10.0.75.1:8081/user/user-register';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'name': user.userName,
          'email': user.email,
          'address': user.address,
          'zipCode': user.zipCode,
          'profileUrl': user.profileUrl,
          'uid': user.uid,
          'state': user.state,
          'city': user.city,
          'contact': user.contact
        }),
      );
      final newUser = User(
          userName: user.userName,
          email: user.email,
          address: user.address,
          zipCode: user.zipCode,
          profileUrl: user.profileUrl,
          uid: json.decode(response.body)['name'],
          city: user.city,
          state: user.state,
          contact: user.contact);
      _items.add(newUser);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
