import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/Categories_circle.dart';
import '../widgets/newArrival.dart';
import '../widgets/popular_items.dart';
import '../screens/categories_overview_screen.dart';
import '../widgets/appDrawer.dart';
import '../widgets/profile.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // FirebaseUser user;

  // @override
  // void initState(){
  //   super.initState();
  //   _getUserData();
  // }

  // Future<void> _getUserData() async {
  //   try {
  //     FirebaseUser userData = await FirebaseAuth.instance.currentUser();

  //     if(userData != null){
  //       setState(() {
  //         user = userData;
  //       });
  //     }else{
  //       print('nothing found');
  //     }
  //     // print(userData.uid);
  //     print(user.email);
  //     print(user.uid);

  //   } catch (e) {
  //     print(e);
  //   }
  // }

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    CategoriesOverviewScreen(),
    Text(
      'Cart',
      style: optionStyle,
    ),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // appBar: AppBar(
      //   title: Text('E-Commerce Store'),
      //   actions: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.all(10.0),
      //       child: IconButton(icon: Icon(Icons.search), onPressed: () {}),
      //     ),
      //   ],
      // ),
      // drawer: AppDrawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.list),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart'),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userCircle),
            title: Text('User'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedIconTheme:
            IconThemeData(color: Theme.of(context).accentColor),
        onTap: _onItemTapped,
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 2,
              actions: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(icon: Icon(Icons.search), onPressed: () {}),
          ),
          Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                          icon: Icon(Icons.shopping_cart), onPressed: () {}),
                    ),
                  ],
                ),
              ],
              expandedHeight: 220.0,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Align(
                    alignment: Alignment(0, 0.5),
                    child: Text("E-Commerce Store",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        )),
                  ),
                  background: Image.network(
                    'https://pbs.twimg.com/media/B9wNcbQIEAEfUeS?format=png&name=small',
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: ListView(
          children: <Widget>[
            // Container(
            //   height: 220,
            //   decoration: BoxDecoration(
            //     boxShadow: [
            //       BoxShadow(
            //         color: Theme.of(context).accentColor,
            //         blurRadius: 2.0,
            //         spreadRadius: 0.0,
            //         offset: Offset(2.0, 3.0), // shadow direction: bottom right
            //       )
            //     ],
            //     image: DecorationImage(
            //       image: NetworkImage(
            //           'https://pbs.twimg.com/media/B9wNcbQIEAEfUeS?format=png&name=small'),
            //       fit: BoxFit.cover,
            //     ),
            //     // borderRadius: BorderRadius.circular(8.0),
            //   ),
            //   child: Align(
            //     alignment: Alignment.center,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         Text(
            //           'E-Commerce',
            //           style: TextStyle(
            //               color: Colors.white,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 28),
            //         ),
            //         Text(
            //           'All your fashion needs under one roof',
            //           style: TextStyle(color: Colors.white, fontSize: 18),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            CategoriesCircle(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'New Arrivals',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2.85,
                    ),
                  ),
                ),
              ],
            ),
            NewArrival(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Popular Items',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2.85,
                    ),
                  ),
                ),
              ],
            ),
            PopularItems(),
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
