import 'package:flutter/material.dart';
import 'package:profile_ui_page/page/profile_page.dart';
import 'package:profile_ui_page/utils/user_preferences.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:profile_ui_page/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init(); // initialize SharedPreferences

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final user = UserPreferences.getUser();

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: user.isDarkMode == true ? Themes.darkTheme : Themes.lightTheme,
      builder: (context, myTheme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ProfilePage(),
          theme: myTheme,
        );
      },
    );
  }
}
