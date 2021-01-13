import 'package:flutter/material.dart';
import 'package:github_assignment/Screens/AllGitHubUsers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Git Hub Demo ',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'All GitHub Users',
            ),
          ),
        ),
        body: AllGitHubUsers(),
      ),
    );
  }
}
