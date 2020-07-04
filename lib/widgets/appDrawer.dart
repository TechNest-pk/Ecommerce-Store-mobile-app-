import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../screens/home_screen.dart';
import 'package:ecommerce_store/screens/auth_screen.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    try {
      FirebaseUser userData = await FirebaseAuth.instance.currentUser();

      if (userData != null) {
        setState(() {
          user = userData;
        });
      } else {
        print('nothing found');
      }
      // print(user.email);
      // print(user.uid);

    } catch (e) {
      print(e);
    }
  }

  Widget buildSeparators(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 10)),
        Text(
          name,
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget buildTile(name, icon, nevigation) {
      return ListTile(
        leading: Icon(icon),
        title: Text(name),
        onTap: () {
          Navigator.of(context).pushNamed(nevigation);
        },
      );
    }

    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 200,
            child: UserAccountsDrawerHeader(
              //  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("img/mazzad.png"))),
              accountName: Text('Batool Ali'),
              accountEmail: Text('scorpion.batool@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.dailymoss.com/wp-content/uploads/2019/08/funny-profile-pic59.jpg"),
                radius: 50,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          buildSeparators("Registeration"),
          buildTile(
            "Login",
            FontAwesomeIcons.lock,
            AuthScreen.routeName,
          ),
          buildTile(
            "SignUp",
            FontAwesomeIcons.user,
            AuthScreen.routeName,
          ),
          Divider(),
          buildSeparators("Categories"),
          buildTile(
            "Mens Fashion",
            FontAwesomeIcons.male,
            HomeScreen.routeName,
          ),
          buildTile(
            "Womens Fashion",
            FontAwesomeIcons.female,
            HomeScreen.routeName,
          ),
          buildTile(
            "Kids",
            FontAwesomeIcons.baby,
            HomeScreen.routeName,
          ),
          buildTile(
            "Electronics",
            FontAwesomeIcons.plug,
            HomeScreen.routeName,
          ),
          buildTile(
            "Computer",
            FontAwesomeIcons.laptop,
            HomeScreen.routeName,
          ),
          buildSeparators("Help Center"),
          buildTile(
            "Feedback",
            Icons.message,
            HomeScreen.routeName,
          ),
          buildTile(
            "About payment",
            Icons.payment,
            HomeScreen.routeName,
          ),
          buildTile(
            "About Shipping",
            FontAwesomeIcons.truck,
            HomeScreen.routeName,
          ),
          buildSeparators("Help Center"),
          buildTile(
            "LOGOUT",
            FontAwesomeIcons.signOutAlt,
            FirebaseAuth.instance.signOut(),
          ),
        ],
      ),
    );
  }
}
