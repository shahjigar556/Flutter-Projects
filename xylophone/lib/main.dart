import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(Xylophone());

class Xylophone extends StatelessWidget {
  const Xylophone({Key key}) : super(key: key);

  void playSound(int soundNumber){
    final player=AudioCache();
    player.play('note$soundNumber.wav');
  }
  Expanded buildKey({Color color,int soundNumber}){
    return Expanded(
      child:TextButton(
        child: Container(
          color: color,
        ),
        onPressed: (){
          playSound(soundNumber);
        },
      ) ,
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Xylophone'),
          ),
        ),
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(color:Colors.red,soundNumber:1),
            buildKey(color:Colors.yellow,soundNumber: 2),
            buildKey(color:Colors.blue,soundNumber: 3),
            buildKey(color:Colors.pink,soundNumber: 4),
            buildKey(color:Colors.orange,soundNumber: 5),
            buildKey(color:Colors.purple,soundNumber: 6),

          ],
        )
      ),
    );
  }
}
