import 'dart:math';

import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildButton(context, '4.8', 'Ranking'),
          buildDivider(),
          buildButton(context, '35', 'Followers'),
          buildDivider(),
          buildButton(context, '50', 'Following'),
        ],
      ),
    );
  }

  Widget buildDivider() {
    return Container(
      height: 24,
      child: VerticalDivider(
        thickness: 1.0,
      ),
    );
  }

  Widget buildButton(BuildContext context, String value, String text) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 4),
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$value',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            '$text',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
