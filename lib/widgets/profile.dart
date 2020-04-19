import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage('https://www.dailymoss.com/wp-content/uploads/2019/08/funny-profile-pic59.jpg'),),
              Text(
                'Omar Hatem',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                  color: Theme.of(context).primaryColor,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 200,
                child: Divider(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Card(
                color: Colors.white,
                //padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                child: ListTile(
                  leading: Icon(
                      Icons.phone,
                      color: Theme.of(context).primaryColor,
                    ),
                  title: Text('+92 3342219404',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 17,
                    ),
                    ),
                )
              ),
              Card(
                color: Colors.white,
                //padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                child: ListTile(
                  leading: Icon(
                      Icons.email,
                      color: Theme.of(context).primaryColor,
                    ),
                  title: Text('omarh.ismail1@gmail.com',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 17,
                    ),
                    ),  
                )
              )
            ],
          ),
        ),
    );
  }
}