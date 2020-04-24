import 'package:flutter/material.dart';

class DetailsTabBar extends StatelessWidget {
  final _kTab = [
    Tab(
      text: 'Details',
    ),
    Tab(text: 'Reviews')
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              unselectedLabelColor: Colors.white,
              labelColor: Theme.of(context).primaryColor,
              tabs: _kTab,
            ),
          ),
          body: TabBarView(
            children: [
              
              Text('Reviews.'),
            ],
          ),
        ),
      ),
    );
  }
}
