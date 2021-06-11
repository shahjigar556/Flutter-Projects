import 'package:flutter/material.dart';
import 'constants.dart';
class ReusableCard extends StatelessWidget {

  final Color color;
  final Widget cardChild;
  final Function onTap;

  ReusableCard({@required this.color,this.cardChild,this.onTap});

@override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap:onTap,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color:color
          ),
          child:cardChild,
      ),
    ),
  );
}
}