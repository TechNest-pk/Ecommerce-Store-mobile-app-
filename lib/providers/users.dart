import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './user.dart';

class Users with ChangeNotifier {
  List<User> _items = [];

  final String authToken;
  final String userId;

  Users(this.authToken, this.userId, this._items);

  List<User> get items {
    return [..._items];
  }

//   Future<User> addUser(User user) async {
//   final http.Response response = await http.post(
//     'http://10.0.75.1:8081/user/user-register',
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'name': user.userName,
//         'email': user.email,
//         'address': user.address,
//         'zipCode': user.zipCode,
//         'profileUrl': user.profileUrl,
//         'uid': userId,
//         'state': user.state,
//         'city': user.city,
//         'contact': user.contact.toString(),
//     }),
//   );

//   if (response.statusCode == 201) {
//     return User.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to create user.');
//   }
// }

//http://10.0.75.1:8081/user/user-register

  // Future<void> addUser(User user) async {
  //   final url = 'http://10.0.75.1:8081/user/user-register';
  //   try {
  //     final response = await http.post(
  //       url,
  //       body: json.encode({
  //         'name': user.userName,
  //         'email': user.email,
  //         'address': user.address,
  //         'zipCode': user.zipCode,
  //         'profileUrl': user.profileUrl,
  //         'uid': user.uid,
  //         'state': user.state,
  //         'city': user.city,
  //         'contact': user.contact
  //       }),
  //     );
  //     final newUser = User(
  //         userName: user.userName,
  //         email: user.email,
  //         address: user.address,
  //         zipCode: user.zipCode,
  //         profileUrl: user.profileUrl,
  //         uid: json.decode(response.body)['name'],
  //         city: user.city,
  //         state: user.state,
  //         contact: user.contact);
  //     _items.add(newUser);
  //     notifyListeners();
  //   } catch (error) {
  //     print(error);
  //     throw error;
  //   }
  // }
}
