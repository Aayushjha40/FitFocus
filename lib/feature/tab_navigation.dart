import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabNavigationDemo(),
    );
  }
}

class TabNavigationDemo extends StatelessWidget {
  const TabNavigationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab Navigation Demo'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Welcome to the Home Tab!', style: TextStyle(fontSize: 18))),
            Center(child: Text('This is your Profile Tab.', style: TextStyle(fontSize: 18))),
            Center(child: Text('Adjust your Settings here.', style: TextStyle(fontSize: 18))),
          ],
        ),
      ),
    );
  }
}