import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/http_exception.dart';
import './user.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  List<User> _items = [];

  List<User> get items {
    return [..._items];
  }

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  Future<void> signup(String email, String password, User userInfo) async {
    final url =
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=AIzaSyC10oZccoBbOfGE7zuNK9UKgP_dUvyipnM';
    try {
      AuthResult result = (await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password));

      // print('working');
      //http://10.0.75.1:8081/user/user-register
      //https://ecomerce-store-b9498.firebaseio.com/users.json
      print("User ID : " + result.user.uid);
       try{
         final http.Response response = await http.post(
        'http://10.0.75.1:8081/user/user-register',
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode(<String, String>{
          'name': userInfo.userName,
          'email': userInfo.email,
          'address': userInfo.address,
          'zipCode': userInfo.zipCode,
          // 'profileUrl': userInfo.profileUrl,
          'uid': result.user.uid,
          'state': userInfo.state,
          'city': userInfo.city,
          'contact': userInfo.contact.toString(),
        }),
      );
      final newUser = User(
          userName: userInfo.userName,
          email: result.user.email,
          address: userInfo.address,
          zipCode: userInfo.zipCode,
          // profileUrl: userInfo.profileUrl,
          uid: result.user.uid,
          city: userInfo.city,
          state: userInfo.state,
          contact: userInfo.contact,
          country: userInfo.country);
      _items.add(newUser);

      print(userInfo.email);
      print(userInfo.userName);
      print(result.user.uid);

      if (response.statusCode == 201) {
        return User.fromJson(json.decode(response.body));
      } else {
        throw Exception('failed to create user');
      }
      // final response = await http
      //     .post(
      //   url,
      //   body: json.encode(
      //     {
      //       'email': email,
      //       'password': password,
      //       'returnSecureToken': true,
      //     },
      //   ),
      // );
      // final responseData = json.decode(response.body);
      // if (responseData['error'] != null) {
      //   throw HttpException(responseData['error']['message']);
      // }
      // _token = responseData['idToken'];
      // _userId = responseData['localId'];

      // _expiryDate = DateTime.now().add(
      //   Duration(
      //     seconds: int.parse(
      //       responseData['expiresIn'],
      //     ),
      //   ),
      // );
      // notifyListeners();
      // final prefs = await SharedPreferences.getInstance();
      // final userData = json.encode(
      //   {
      //     'token': _token,
      //     'userId': _userId,
      //     'expiryDate': _expiryDate.toIso8601String(),
      //   },
      // );
      // prefs.setString('userData', userData);
       }catch(error){
         Exception(error.toString());
       }
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    final url =
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyC10oZccoBbOfGE7zuNK9UKgP_dUvyipnM';
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          'expiryDate': _expiryDate.toIso8601String(),
        },
      );
      prefs.setString('userData', userData);
    } catch (error) {
      throw error;
    }
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove('userData');
    prefs.clear();
  }
}
