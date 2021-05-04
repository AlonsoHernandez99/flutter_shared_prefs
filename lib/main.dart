import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences/src/pages/home_page.dart';
import 'package:flutter_shared_preferences/src/pages/settings_page.dart';
import 'package:flutter_shared_preferences/src/shared_prefs/user_prefs.dart';

void main() async {
  final prefs = UserSharedPreferences();
  WidgetsFlutterBinding.ensureInitialized();
  await prefs.initPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = UserSharedPreferences();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences',
      initialRoute: prefs.lastPage,
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}
