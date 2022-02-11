import 'package:flutter/material.dart';
import 'package:profile_ui_page/page/edit_profile_page.dart';
import 'package:profile_ui_page/widget/build_app_bar.dart';
import 'package:profile_ui_page/utils/user_preferences.dart';
import 'package:profile_ui_page/widget/profile_widget.dart';
import 'package:profile_ui_page/model/user.dart';
import 'package:profile_ui_page/widget/button_widget.dart';
import 'package:profile_ui_page/widget/numbers_widget.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    User user = UserPreferences.getUser();

    return ThemeSwitchingArea(
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: buildAppBar(context, false),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                isEdit: false,
                onPressed: () async {
                  await Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return EditProfilePage();
                  }));
                  setState(() {});
                },
              ),
              SizedBox(height: 24),
              buildName(user),
              SizedBox(height: 24),
              Center(child: buildUpgradeButton()),
              SizedBox(height: 24),
              NumbersWidget(),
              SizedBox(height: 32),
              buildAbout(user),
            ],
          ),
        );
      }),
    );
  }

  Widget buildName(User user) {
    return Column(
      children: [
        Text(
          '${user.name}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 5),
        Text(
          '${user.email}',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }

  Widget buildUpgradeButton() {
    return ButtonWidget(
      text: 'Upgrade To Pro',
      onClicked: () {},
    );
  }

  Widget buildAbout(User user) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 48, horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'About',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(height: 12),
          Text(
            '${user.about}',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
