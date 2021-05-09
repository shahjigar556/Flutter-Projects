import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.teal,
            body: SafeArea(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/batman.png'),
                    radius: 50.0,
                  ),
                  Text(
                    'Jigar Shah',
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    'Flutter Developer',
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 20.0,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10.0,
                    width:200.0,
                    child: Divider(
                      color: Colors.white,

                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: ListTile(
                      leading: Icon(Icons.phone, color: Colors.teal),
                      title: Text(
                        '8291114975',
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: Icon(Icons.email, color: Colors.teal),
                      title: Text(
                        'shahjigar185@gmail.com',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Pacific',
                            color: Colors.teal),
                      ),
                    ),
                  )
                ]))));
  }
}
