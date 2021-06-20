import 'package:flutter/material.dart';
import 'package:clima/utilities/constant.dart';
class CityScreen extends StatefulWidget {


  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
   String cityName;
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child:SafeArea(
          child:Column(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              TextButton(
                onPressed: (){
                   Navigator.pop(context,cityName);
                },
                child:Text('Search',style: kButtonTextStyle,)
              )
            ],
          )
        )

        ),
      );
  }
}
