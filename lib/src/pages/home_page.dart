import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences/src/shared_prefs/user_prefs.dart';
import 'package:flutter_shared_preferences/src/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = UserSharedPreferences();

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text("User Preferences"),
        backgroundColor: prefs.secondaryColor ? Colors.teal : Colors.blueAccent,
      ),
      drawer: DrawerWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Secondary Color : ${prefs.secondaryColor}"),
          Divider(),
          Text("Genre: ${prefs.genre}"),
          Divider(),
          Text("User Name: ${prefs.userName}"),
          Divider()
        ],
      ),
    );
  }
}
