
import 'package:flutter/foundation.dart';

class User with ChangeNotifier {
  final String uid;
  final String userName;
  final String email;
  final String address;
  final String zipCode;
  final String city;
  final String state;
  final String profileUrl;
  final int contact;

  User({
    @required this.uid,
    @required this.userName,
    @required this.email,
    @required this.address,
    @required this.state,
    @required this.city,
    @required this.zipCode,
    @required this.profileUrl,
    @required this.contact,
  });
}