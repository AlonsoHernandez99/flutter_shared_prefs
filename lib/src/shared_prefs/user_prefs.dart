import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static final UserSharedPreferences _instance =
      new UserSharedPreferences._internal();
  SharedPreferences _prefs;
  UserSharedPreferences._internal();

  factory UserSharedPreferences() {
    return _instance;
  }

  initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get genre => _prefs.getInt('genre') ?? 1;

  set genre(int value) => _prefs.setInt('genre', value);

  get secondaryColor => _prefs.getBool('secondaryColor') ?? false;

  set secondaryColor(bool value) => _prefs.setBool('secondaryColor', value);

  get userName => _prefs.getString('userName') ?? '';

  set userName(String value) => _prefs.setString('userName', value);

  get lastPage => _prefs.getString('lastPage') ?? 'home';

  set lastPage(String value) => _prefs.setString('lastPage', value);
}
