import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final VoidCallback? onClicked;

  ButtonWidget({this.text, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      child: Text('$text'),
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        onPrimary: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      ),
    );
  }
}
