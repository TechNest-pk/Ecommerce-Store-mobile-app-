import 'package:ecommerce_store/providers/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/http_exception.dart';
import '../providers/auth.dart';
import '../providers/users.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    // final deviceSize = MediaQuery.of(context).size;
    // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    // transformConfig.translate(-10.0);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(236, 64, 122, 1).withOpacity(0.5),
                  Color.fromRGBO(169, 169, 169, 1).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
          Center(
            child: AuthCard(),
          ),
          // SingleChildScrollView(
          //   child: Container(
          //     height: deviceSize.height,
          //     width: deviceSize.width,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: <Widget>[
          //         Flexible(
          //           child: Container(
          //             margin: EdgeInsets.only(bottom: 20.0),
          //             padding:
          //                 EdgeInsets.symmetric(vertical: 8.0, horizontal: 94.0),
          //             transform: Matrix4.rotationZ(-8 * pi / 180)
          //               ..translate(-10.0),
          //             // ..translate(-10.0),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(20),
          //               color: Colors.pink.shade600,
          //               boxShadow: [
          //                 BoxShadow(
          //                   blurRadius: 8,
          //                   color: Colors.black26,
          //                   offset: Offset(0, 2),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //         Flexible(
          //           flex: deviceSize.width > 600 ? 2 : 1,
          //           child: AuthCard(),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  // final GlobalKey<FormState> _formKey = GlobalKey();

  // Future<FirebaseUser> user;

  // @override
  // void initState(){
  //   super.initState();

  //   try {
  //     Future<FirebaseUser> userData = FirebaseAuth.instance.currentUser();

  //     if(userData != null){
  //       setState(() {
  //         user = userData;
  //       });
  //     }else{
  //       print('nothing found');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  final _form = GlobalKey<FormState>();

  var _editedUser = User(
    uid: null,
    userName: '',
    email: '',
    zipCode: '',
    address: '',
    // profileUrl: '',
    city: '',
    contact: 0,
    state: '',
    country: '',
  );

  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  // dynamic _futureUser;

  // Future<void> _saveForm() async {
  //   final isValid = _form.currentState.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   _form.currentState.save();
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   try {
  //     _futureUser =
  //         await Provider.of<Users>(context, listen: false).addUser(_editedUser);

  //     print(_editedUser.userName);
  //     print(_editedUser.uid);
  //   } catch (error) {
  //     await showDialog(
  //       context: context,
  //       builder: (ctx) => AlertDialog(
  //         title: Text('An error occurred!'),
  //         content: Text(error.toString()),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text('Okay'),
  //             onPressed: () {
  //               Navigator.of(ctx).pop();
  //             },
  //           )
  //         ],
  //       ),
  //     );
  //   }
  //   setState(() {
  //     _isLoading = false;
  //   });
  //   Navigator.of(context).pop();
  //   // Navigator.of(context).pop();
  // }

  Future<void> _submit() async {
    if (!_form.currentState.validate()) {
      // Invalid!
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authMode == AuthMode.Login) {
        // Log user in
        await Provider.of<Auth>(context, listen: false).login(
          _authData['email'],
          _authData['password'],
        );

        setState(() {
          _isLoading = false;
        });
      } else {
        // Sign user up

        await Provider.of<Auth>(context, listen: false)
            .signup(_authData['email'], _authData['password'], _editedUser);

        setState(() {
          _isLoading = false;
        });

        _authMode = AuthMode.Login;

        // await _saveForm();
      }
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      _showErrorDialog(error.toString());
    }
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8.0,
      child: Container(
        height: _authMode == AuthMode.Signup ? 400 : 260,
        constraints:
            BoxConstraints(minHeight: _authMode == AuthMode.Signup ? 400 : 260),
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Colors.pinkAccent[400],
                      ),
                      labelText: 'E-Mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Invalid email!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['email'] = value;
                    _editedUser = User(
                      userName: _editedUser.userName,
                      contact: _editedUser.contact,
                      state: _editedUser.state,
                      address: _editedUser.address,
                      email: value,
                      city: _editedUser.city,
                      // profileUrl: _editedUser.profileUrl,
                      zipCode: _editedUser.zipCode,
                      uid: _editedUser.uid,
                      country: _editedUser.country,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Colors.pinkAccent[400],
                      ),
                      labelText: 'Password'),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['password'] = value;
                  },
                ),
                _authMode == AuthMode.Signup
                    ? Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.pinkAccent[400],
                                ),
                                labelText: 'Name'),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please provide a value.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedUser = User(
                                  userName: value,
                                  contact: _editedUser.contact,
                                  state: _editedUser.state,
                                  address: _editedUser.address,
                                  email: _editedUser.email,
                                  city: _editedUser.city,
                                  // profileUrl: _editedUser.profileUrl,
                                  zipCode: _editedUser.zipCode,
                                  uid: _editedUser.uid,
                                  country: _editedUser.country);
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.pinkAccent[400],
                                ),
                                labelText: 'Contact'),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please provide a value.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedUser = User(
                                  userName: _editedUser.userName,
                                  contact: int.parse(value),
                                  state: _editedUser.state,
                                  address: _editedUser.address,
                                  email: _editedUser.email,
                                  city: _editedUser.city,
                                  // profileUrl: _editedUser.profileUrl,
                                  zipCode: _editedUser.zipCode,
                                  uid: _editedUser.uid,
                                  country: _editedUser.country);
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.pinkAccent[400],
                                ),
                                labelText: 'State'),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please provide a value.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedUser = User(
                                userName: _editedUser.userName,
                                contact: _editedUser.contact,
                                state: value,
                                address: _editedUser.address,
                                email: _editedUser.email,
                                city: _editedUser.city,
                                // profileUrl: _editedUser.profileUrl,
                                zipCode: _editedUser.zipCode,
                                uid: _editedUser.uid,
                                country: _editedUser.country,
                              );
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.pinkAccent[400],
                                ),
                                labelText: 'City'),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please provide a value.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedUser = User(
                                userName: _editedUser.userName,
                                contact: _editedUser.contact,
                                state: _editedUser.state,
                                address: _editedUser.address,
                                email: _editedUser.email,
                                city: value,
                                // profileUrl: _editedUser.profileUrl,
                                zipCode: _editedUser.zipCode,
                                uid: _editedUser.uid,
                                country: _editedUser.country,
                              );
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.pinkAccent[400],
                                ),
                                labelText: 'Country'),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please provide a value.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedUser = User(
                                userName: _editedUser.userName,
                                contact: _editedUser.contact,
                                state: _editedUser.state,
                                country: value,
                                address: _editedUser.address,
                                email: _editedUser.email,
                                city: _editedUser.city,
                                // profileUrl: _editedUser.profileUrl,
                                zipCode: _editedUser.zipCode,
                                uid: _editedUser.uid,
                              );
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.pinkAccent[400],
                                ),
                                labelText: 'ZipCode'),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please provide a value.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedUser = User(
                                userName: _editedUser.userName,
                                contact: _editedUser.contact,
                                state: _editedUser.state,
                                country: _editedUser.country,
                                address: _editedUser.address,
                                email: _editedUser.email,
                                city: _editedUser.city,
                                // profileUrl: _editedUser.profileUrl,
                                zipCode: value,
                                uid: _editedUser.uid,
                              );
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.pinkAccent[400],
                                ),
                                labelText: 'Address'),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please provide a value.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedUser = User(
                                userName: _editedUser.userName,
                                contact: _editedUser.contact,
                                state: _editedUser.state,
                                address: value,
                                email: _editedUser.email,
                                city: _editedUser.city,
                                // profileUrl: _editedUser.profileUrl,
                                zipCode: _editedUser.zipCode,
                                uid: _editedUser.uid,
                                country: _editedUser.country,
                              );
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.pinkAccent[400],
                                ),
                                labelText: 'Profile Url'),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please provide a value.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedUser = User(
                                userName: _editedUser.userName,
                                contact: _editedUser.contact,
                                state: _editedUser.state,
                                address: _editedUser.address,
                                email: _editedUser.email,
                                city: _editedUser.city,
                                // profileUrl: value,
                                zipCode: _editedUser.zipCode,
                                uid: _editedUser.uid,
                                country: _editedUser.country,
                              );
                            },
                          ),
                          TextFormField(
                            enabled: _authMode == AuthMode.Signup,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock,
                                  color: Colors.pinkAccent[400],
                                ),
                                labelText: 'Confirm Password'),
                            obscureText: true,
                            validator: _authMode == AuthMode.Signup
                                ? (value) {
                                    if (value != _passwordController.text) {
                                      return 'Passwords do not match!';
                                    }
                                    return null;
                                  }
                                : null,
                          ),
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 20,
                ),
                _isLoading
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        child: Text(
                            _authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP'),
                        onPressed: () async {
                          await _submit();
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 8.0),
                        color: Theme.of(context).accentColor,
                        textColor: Theme.of(context).primaryColor,
                      ),
                FlatButton(
                  child: Text(
                      '${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD'),
                  onPressed: _switchAuthMode,
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  textColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
