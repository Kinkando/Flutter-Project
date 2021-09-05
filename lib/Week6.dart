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

  var _randomNum = Random().nextInt(100).toString();

  @override
  Widget build(BuildContext context) {
    List<Icon> iconList = [];
    for(var i=0; i<4; i++)
      iconList.add(Icon(Icons.star, color: Colors.orange));
    iconList.add(Icon(Icons.star_border_outlined, color: Colors.orange));
    var status = true;

    List<int> list1 = [
      for(var i=1; i<=10; i++)
        i,
      if(status)
        123
    ];

    return Scaffold(
      appBar: AppBar(title: Text('GUESS THE NUMBER')),
      body: Container(
        color: const Color(0xFFFFFAF1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch, //แกนขวาง
          children: [
            Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.person, size: 80.0, color: Colors.blue),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'ธนวัฒน์ ยุวรรณศิริ', style: TextStyle(fontSize: 20.0)),
                    Row(
                      //children: iconList,
                      children: [
                        Icon(Icons.star, color: Colors.blue),

                        //collection-for
                        for(var item in iconList) //พ่นข้อมูลใส่ literal List และต้องไม่มีเครื่องหมายปีกกา ใช้ได้แค่ใน list เครื่องหมาย [] ไม่เป็น statement
                          item,

                        //collection-if
                        if(status)
                          Icon(Icons.star, color: Colors.pink)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    '$_randomNum',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 150.0, color: Colors.orange),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: _randomNumber, child: Text('RANDOM')),
            ),
          ],
        ),
      ),
    );
  }
}

//VCS : Version Control System => Local History => Show History เพื่อย้อนดูโค้ดของเก่า
