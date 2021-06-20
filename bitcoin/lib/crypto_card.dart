import 'package:flutter/material.dart';
import 'constants.dart';

class CryptoCard extends StatelessWidget {
  @override
  CryptoCard({this.text});
  final String text;
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.lightBlue, borderRadius: BorderRadius.circular(12)),
        height: 40.0,
        child: Padding(
          padding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
          child: Text(text,
              textAlign: TextAlign.center, style: kTextStyle),
        ));
  }
}
