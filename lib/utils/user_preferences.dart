import 'package:profile_ui_page/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UserPreferences {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user'; // store information of user

  static var myUser = User(
      imagePath:
          'https://cdn.idntimes.com/content-images/duniaku/post/20200816/spiderman-tobey-fe8df6a56d76c8e64f309ccee8f87e75_600x400.jpg',
      name: 'Tobey Maguire',
      email: 'spiderman@gmail.com',
      about: 'I\'m Spiderman.',
      isDarkMode: false);

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson()); // turn User class to JSON data
    await _preferences.setString(
        _keyUser, json); // store data to sharedPreferences (key value, value)
  }

  static User getUser() {
    final json = _preferences
        .getString(_keyUser); // read data from sharedPreferences (key value)
    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
