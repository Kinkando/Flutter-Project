/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: GamePage(),
    );
  }
}

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  */
/*
  // สี่เหลี่ยม มี border
  Widget _buildButton1() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 75.0,
        height: 75.0,
        //color: Colors.yellow, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว
        decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(color: Colors.red, width: 5.0),
        ),
      ),
    );
  }

  // สี่เหลี่ยมมุมโค้ง มี border
  Widget _buildButton2() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 75.0,
        height: 75.0,
        //color: Colors.yellow, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว
        decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(color: Colors.blue, width: 3.0),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }

  // วงกลม ไม่มี border
  Widget _buildButton3() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 75.0,
        height: 75.0,
        //color: Colors.green, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว
        decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  // วงกลม มี border มีเงา
  Widget _buildButton4() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 75.0,
        height: 75.0,
        //color: Colors.white, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.purple, width: 4.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // สีเงา
                offset: Offset(2, 4), // ทิศทางของเงาในแนวนอนและแนวตั้ง ตามลำดับ
                blurRadius: 4.0,
                spreadRadius: 2.0,
              )
            ]
        ),
      ),
    );
  }*/ /*


  Widget _BorderCircle({String? text}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
          width: 75.0,
          height: 75.0,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey, width: 2.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              text!,
              style: TextStyle(fontSize: 30.0),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }

  Widget _InvisibleContainer() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 75.0,
        height: 75.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.lock_outlined, size: 100.0, color: Colors.grey),
              Text('กรุณาใส่รหัสผ่าน',
                  style: TextStyle(fontSize: 30.0, color: Colors.grey))
            ]),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _BorderCircle(text: '1'),
                    _BorderCircle(text: '2'),
                    _BorderCircle(text: '3'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _BorderCircle(text: '4'),
                    _BorderCircle(text: '5'),
                    _BorderCircle(text: '6'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _BorderCircle(text: '7'),
                    _BorderCircle(text: '8'),
                    _BorderCircle(text: '9'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _InvisibleContainer(),
                    _BorderCircle(text: '0'),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Icon(Icons.backspace_outlined,
                          size: 30.0, color: Colors.grey),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child:
                      Text('ลืมรหัสผ่าน', style: TextStyle(color: Colors.blue, fontSize: 18.0)),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                ),
              ],
            ),
          )
          */
/*
              _buildButton1(), // สังเกตว่าเราแยกโค้ดตรงนี้ออกไปเป็นฟังก์ชัน (เมธอด) ชื่อ _buildButton1()
              _buildButton2(), // สังเกตว่าเราแยกโค้ดตรงนี้ออกไปเป็นฟังก์ชัน (เมธอด) ชื่อ _buildButton2()
              _buildButton3(), // สังเกตว่าเราแยกโค้ดตรงนี้ออกไปเป็นฟังก์ชัน (เมธอด) ชื่อ _buildButton3()
              _buildButton4(), // สังเกตว่าเราแยกโค้ดตรงนี้ออกไปเป็นฟังก์ชัน (เมธอด) ชื่อ _buildButton4()
              */ /*

        ],
      ),
    ));
  }
}
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: GamePage(),
    );
  }
}

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  Widget _BorderCircle(int text) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 75.0,
        height: 75.0,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 2.0),
        ),
        /*child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            text!,
            style: TextStyle(fontSize: 30.0),
            textAlign: TextAlign.center,
          ),*/
        child: Center(
            child: Text(
          '$text',
          style: TextStyle(fontSize: 30.0),
          textAlign: TextAlign.center,
        )),
      ),
    );
  }

  Widget _InvisibleContainer() {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(width: 75.0, height: 75.0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade100,
        child: Column(
          children: [
            Expanded(
              // flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.lock_outlined,
                      size: 100.0, color: Colors.black.withOpacity(0.5)),
                  SizedBox(height: 8.0),
                  //ต้องการพื้นที่ว่างระหว่าง icon กับ text
                  Text('กรุณาใส่รหัสผ่าน',
                      style: TextStyle(fontSize: 30.0, color: Colors.grey))
                ],
              ),
            ),
            /*for(int i=0;i<9;i+=3)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int j=1;j<=3;j++)
                    _BorderCircle(i+j),
                ],
              ),*/
            for(int i=0;i<9;i+=3)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [i+1,i+2,i+3].map((item) => _BorderCircle(item)).toList(),
                //children: [i+1,i+2,i+3].map((item) => Text(item.toString(), style: TextStyle(fontSize: 30.0))).toList(),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 75.0, height: 75.0),
                _BorderCircle(0),
                Container(
                    width: 75.0,
                    height: 75.0,
                    child: Icon(
                      Icons.backspace_outlined,
                      size: 32.0,
                      color: Colors.black.withOpacity(0.5),
                    ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'ลืมรหัสผ่าน',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            /*Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(var i=0;i<9;i+=3)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for(var j=1;j<4;j++)
                          _BorderCircle(text: '${i+j}'),
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _InvisibleContainer(),
                      _BorderCircle(text: '0'),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Icon(Icons.backspace_outlined, size: 30.0, color: Colors.grey),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('ลืมรหัสผ่าน', style: TextStyle(color: Colors.blue, fontSize: 18.0)),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.white)),
                  ),
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
