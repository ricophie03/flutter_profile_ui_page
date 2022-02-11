import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:profile_ui_page/utils/user_preferences.dart';
import 'package:profile_ui_page/model/user.dart';
import 'package:profile_ui_page/widget/build_app_bar.dart';
import 'package:profile_ui_page/widget/profile_widget.dart';
import 'package:profile_ui_page/widget/textfield_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User? user;

  @override
  void initState() {
    super.initState();
    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Builder(builder: (context) {
        return Scaffold(
            appBar: buildAppBar(context, true),
            body: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              children: [
                ProfileWidget(
                  imagePath: user!.imagePath,
                  isEdit: true,
                  onPressed: () async {
                    PicturesMenu(context);
                  },
                ),
                SizedBox(height: 24.0),
                TextFieldWidget(
                  label: 'Full Name',
                  text: user!.name,
                  onChanged: (name) {
                    user = user!.copy(name: name);
                  },
                ),
                SizedBox(height: 24.0),
                TextFieldWidget(
                  label: 'Email Address',
                  text: user!.email,
                  onChanged: (email) {
                    user = user!.copy(email: email);
                  },
                ),
                SizedBox(height: 24.0),
                TextFieldWidget(
                  label: 'About',
                  text: user!.about,
                  maxLines: 5,
                  onChanged: (about) {
                    user = user!.copy(about: about);
                  },
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () async {
                    await UserPreferences.setUser(user!);
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  child: Text("Save"),
                ),
              ],
            ));
      }),
    );
  }

  void PicturesMenu(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 100.0,
            color: Colors.white,
            child: Row(
              children: [
                TextButton.icon(
                    onPressed: () async {
                      Navigator.pop(context);
                      takePicture(true);
                    },
                    icon: Icon(Icons.camera, size: 44.0),
                    label: Text(
                      "Camera",
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.end,
                    )),
                SizedBox(width: 20.0),
                TextButton.icon(
                    onPressed: () async {
                      Navigator.pop(context);
                      takePicture(false);
                    },
                    icon: Icon(Icons.image, size: 44.0),
                    label: Text(
                      "Gallery",
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.end,
                    )),
              ],
            ),
          );
        });
  }

  Future<void> takePicture(bool isCamera) async {
    bool Camera = isCamera;
    final image = (Camera == true)
        ? await ImagePicker().pickImage(source: ImageSource.camera)
        : await ImagePicker().pickImage(
            source: ImageSource.gallery); // buka galeri dan pilih gambar baru

    if (image == null) return;

    final directory =
        await getApplicationDocumentsDirectory(); // cari tempat save gambar baru
    final name = basename(image.path); // ambil nama gambar yang baru
    final imageFile =
        File('${directory.path}/$name'); // direktori gambar yang baru
    final newImage = await File(image.path)
        .copy(imageFile.path); //ganti direktori gambar lama ke baru
    setState(() {
      user = user!.copy(imagePath: newImage.path); // ganti image lama ke baru
    });
  }
}
