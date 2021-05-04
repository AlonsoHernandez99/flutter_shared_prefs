import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences/src/shared_prefs/user_prefs.dart';
import 'package:flutter_shared_preferences/src/widgets/drawer_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'setting';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor = false;
  int _genre = 1;
  String _name = 'Juan';

  TextEditingController _textEditingController;
  UserSharedPreferences _prefs;

  @override
  void initState() {
    _prefs = UserSharedPreferences();
    _genre = _prefs.genre;
    _secondaryColor = _prefs.secondaryColor;
    _name = _prefs.userName;

    _prefs.lastPage = SettingsPage.routeName;

    _textEditingController = new TextEditingController(text: _name);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor:
            _prefs.secondaryColor ? Colors.teal : Colors.blueAccent,
      ),
      drawer: DrawerWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _secondaryColor,
            title: Text('Secondary Color'),
            onChanged: (value) {
              setState(() {
                _secondaryColor = value;
                _prefs.secondaryColor = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Male'),
            groupValue: _genre,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
              value: 2,
              title: Text('Female'),
              groupValue: _genre,
              onChanged: _setSelectedRadio),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textEditingController,
              decoration:
                  InputDecoration(labelText: 'Name', helperText: 'User name'),
              onChanged: (value) {
                _prefs.userName = value;
              },
            ),
          )
        ],
      ),
    );
  }

  void _setSelectedRadio(int value) async {
    setState(() {
      _genre = value;
      _prefs.genre = value;
    });
  }
}
