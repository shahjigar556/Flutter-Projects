import 'package:flutter/material.dart';
import 'constants.dart';
class IconContent extends StatelessWidget {

  final IconData icon;
  final String label;
  IconContent(this.icon,this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
         Icon(
           icon,
           size:80.0,
         ),
         SizedBox(
           height:15.0
         ),
         Padding(
           padding: const EdgeInsets.only(bottom: 10.0),
           child: Text(
             label,
             style:kLabelTextStyle
           ),
         )
       ],
    );
  }
}
