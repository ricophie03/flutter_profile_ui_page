import 'package:flutter/material.dart';
import 'dart:io';

class ProfileWidget extends StatelessWidget {
  final Function()? onPressed;
  final String? imagePath;
  final bool? isEdit;

  ProfileWidget({this.onPressed, this.imagePath, this.isEdit});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Stack(children: [
      buildImage(),
      Positioned(
        bottom: 0,
        right: isEdit! ? 100 : 130,
        child: buildEditIcon(color),
      ),
    ]);
  }

  // Profile Picture
  Widget buildImage() {
    final image = imagePath!.contains('https://')
        ? NetworkImage(imagePath!)
        : FileImage(File(imagePath!));
    return Center(
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image: image as ImageProvider,
            height: 150.0,
            width: 150.0,
            fit: BoxFit.cover,
            child: InkWell(
              onTap: onPressed,
            ),
          ),
        ),
      ),
    );
  }

  // Button Edit Profile
  Widget buildEditIcon(Color color) {
    return buildCircle(
      color: Colors.white,
      all: 3,
      child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            isEdit! ? Icons.add_a_photo : Icons.edit,
            color: Colors.white,
            size: 20,
          )),
    );
  }

  // Circle of Button Edit
  Widget buildCircle(
      {required Widget child, required double all, required Color color}) {
    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        color: color,
        child: child,
      ),
    );
  }
}
