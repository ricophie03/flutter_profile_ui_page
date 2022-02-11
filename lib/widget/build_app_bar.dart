import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:profile_ui_page/themes.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:profile_ui_page/utils/user_preferences.dart';

AppBar buildAppBar(BuildContext context, bool isEdit) {
  final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final icon = isDarkMode ? CupertinoIcons.sun_max : CupertinoIcons.moon_stars;
  final user = UserPreferences.getUser();

  return AppBar(
    leading: IconButton(
      onPressed: () {
        if (isEdit == true) Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
        color: isDarkMode ? Colors.white : Colors.black,
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      ThemeSwitcher(
        clipper: ThemeSwitcherCircleClipper(),
        builder: (context) => IconButton(
          icon: Icon(
            icon,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            final theme = isDarkMode ? Themes.lightTheme : Themes.darkTheme;
            final switcher = ThemeSwitcher.of(context);
            switcher.changeTheme(theme: theme);

            final newUser = user.copy(isDarkMode: !isDarkMode);
            UserPreferences.setUser(newUser);
          },
        ),
      ),
    ],
  );
}
