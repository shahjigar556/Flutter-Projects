import 'package:flutter/material.dart';
import 'constants.dart';
import 'result_page.dart';

class BottomButton extends StatelessWidget {
  @override
  BottomButton({@required this.buttonText,@required this.onTap});
  final String buttonText;
  final Function onTap;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          child: Center(child: Text(buttonText)),
          width: double.infinity,
          color: kBottomContainerColour,
          height: kBottomContainerHeight),
    );
  }
}
