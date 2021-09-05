import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomLabel(),
    );
  }
}

class RandomLabel extends StatefulWidget {
  RandomLabel({Key? key}) : super(key: key);

  @override
  _RandomState createState() => _RandomState();
}

class _RandomState extends State<RandomLabel> {
  void _randomNumber() {
    setState(() {
      _randomNum = Random().nextInt(100).toString();
    });
  }

  String _randomNum = Random().nextInt(100).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GUESS THE NUMBER')),
      body: Container(
        color: const Color(0xFFFFFAF1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch, //แกนขวาง
          children: [
            Row(
              children: [
                Icon(Icons.person, size: 80.0, color: Colors.blue),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text('ธนวัฒน์ ยุวรรณศิริ')
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange),
                        Icon(Icons.star, color: Colors.orange),
                        Icon(Icons.star, color: Colors.orange),
                        Icon(Icons.star, color: Colors.orange),
                        Icon(Icons.star_border, color: Colors.orange),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '$_randomNum',textAlign: TextAlign.center,
              style: TextStyle(fontSize: 150.0, color: Colors.orange),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: _randomNumber, child: Text('RANDOM')),
            ),
          ],
        ),
      ),
    );
  }
}
