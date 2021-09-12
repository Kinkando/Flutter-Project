import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'game.dart';
//import 'package:hello/pages/game/game.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  //Game? _game;
  late Game _game; //initialize ทีหลัง
  final _controller = TextEditingController();
  String? _guessNumber;
  String? _feedback;

  @override //Ctrl+O or Code=>Override method
  void initState() {
    //Flutter auto call once time at first time
    //ส่วนใหญ่จะ initialize state variable in this initState method
    super.initState();
    _game = Game();
  }

  @override
  void dispose() {
    //Clear it when finish used
    _controller.dispose();
    super.dispose();
  }

  /*var guess = Game();
  var controller = TextEditingController();
  var checkValue = 2;*/
  @override
  Widget build(BuildContext context) {
    //Render all the time (initField)
    return Scaffold(
      body: Container(
          color: Colors.yellow.shade100,
          /*decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo_number.png"),
            fit: BoxFit.fill,
          ),
        ),*/
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildHeader(),
                  _buildMainContent(), //TextFormField(),
                  _buildInputPanel(),
                ],
              ),
            ),
          )),
    );
  }

  //Right Click -> Refactor -> Extract Method เพื่อที่จะสร้าง method ของ Widget

  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset(
          "assets/images/logo_number.png",
          width: 240.0, //160 = 1 inch
        ),
        Text(
          'GUESS THE NUMBER',
          style: GoogleFonts.mcLaren(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildMainContent() {
    return _guessNumber == null || _feedback == null
        ? SizedBox.shrink()
        : Column(
            children: [
              Text(_guessNumber!, style: GoogleFonts.kanit(fontSize: 80.0)),
              Text(_feedback!, style: GoogleFonts.kanit(fontSize: 80.0)),
              if(_feedback != null && _feedback!.contains('CORRECT!'))
                TextButton(
                  onPressed: () { //function call back
                    _game = Game();
                  },
                  child: Text('NEW GAME'),
                ),
            ],
          );
  }

  Widget _buildInputPanel() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink.shade100,
        border: Border.all(width: 5.0),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(5.0, 5.0),
            color: Colors.grey,
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ]
      ),
      //elevation: 10.0, Use in Card Widget to create shadow
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextField(
                controller: _controller,
                //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                )
                    /*enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),*/
                    ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _guessNumber = _controller.text;
                  int? guess = int.tryParse(_guessNumber!);
                  if (guess != null) {
                    var result = _game.doGuess(guess);
                    _feedback = result == 0 ? 'CORRECT!':
                        //+' total count : ${_game.totalGuesses}
                                result == 1 ? 'TOO HIGH!' : 'TOO LOW!';
                  }
                  else
                    _feedback = null;
                  //Ctrl+Q : Document
                  //Ctrl+P : Parameter
                });
              },
              child: Text("GUESS"),
            ),
          ],
        ),
      ),
    );
  }
}

/*class GamePage extends StatefulWidget { //เปลี่ยนค่าตัวแปรได้
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  //var i = 0; //State Variable ที่เปลี่ยนแปลงค่าแล้ว Render ได้
  //List<int> list = [1,2,3,4,5,6,7,8,9,10]; //List<dynamic>
  var counter = 0;
  bool showNumber = true;

  _handleClickButton() {
    setState(() {
      counter++;
      //list.add(list.length+1);
      //list = list.map((e) => e+=list.length).toList();
    });
  }
  _handleClickButton2() {
    setState(() {
      showNumber = !showNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children : [
              // if(showNumber) //
              Center(
                  child:
                  // showNumber ? //
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //children: list.map((e) => Text(e.toString(), style: TextStyle(fontSize: 30.0))).toList(),
                    children: [
                      Text(
                          counter.toString(),
                          style: TextStyle(fontSize: 30.0),
                      ),
                    ],
                  )
                  // : null, //
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: _handleClickButton, child: Text('Increase')),
                  SizedBox(width:20.0),
                  TextButton(onPressed: () {
                      setState(() =>
                        counter = 0
                    //list = [1,2,3,4,5,6,7,8,9,10]
                      );
                    }, child: Text('Reset')),
                  SizedBox(width:20.0),
                  TextButton(onPressed: _handleClickButton2, child: Text(!showNumber ? "Show" : "Hide")),
                ],
              ),
              Image(
                image: AssetImage(showNumber ? 'assets/images/op.png' : 'assets/images/p.png'),
                width: 100.0,
                fit: BoxFit.cover, //คงสัดส่วนไว้ แล้วยืดตามค่าที่กำหนด
              ),
            ],
            */ /*children: [
              for(var item in list)
                Text(
                    item.toString(),
                    style: TextStyle(fontSize: 30.0),
                ),
              TextButton(
                onPressed: _handleClickButton, //เอาฟังก์ชันมาใส่ (call back function) ไม่ใช่การ call function
                */ /**/ /*onPressed: () { //เมื่อกดปุ่มแล้วจะ เรียกฟังก์ชันนี้เพื่อ Render UI ใหม่
                  setState(() { //เพื่อเปลี่ยนแปลงค่าตัวแปรที่แสดงผล (เรียก method build ใหม่)
                    i++;
                  });
                },*/ /**/ /*
                child: Text('Test'),
              ),
            ],*/ /*
          ),
        ),
      ),
    );
  }
}*/

/*class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Each Screen : Setting Screen, Home Screen
      appBar: AppBar(title: Text('GUESS THE NUMBER')),
      body: Container(
          // เทียบเท่า <div>
          color: Colors.pinkAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch, //แกนขวาง
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 20.0,
                    height: 20.0,
                    color : Colors.blue,
                  ),
                  Padding(
                    // padding: const EdgeInsets.all(15.0),
                    // padding: const EdgeInsets.only(left: 20.0, right: 50.0),
                    padding: const EdgeInsets.symmetric(vertical:0.0, horizontal:30.0),
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      color : Colors.green,
                    ),
                  ),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    color : Colors.black,
                  ),
                ],
              ),
              Text('Hello',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 50.0)),
              Text('Flutter', textAlign: TextAlign.center),
              Text('Android', textAlign: TextAlign.center),
            ],
          )
          */ /*child: Align(
          alignment: Alignment.topLeft,
          child: Text('Hello Flutter'),
        ),*/ /*
          */ /*child: Center(
          child: Text('Hello Flutter\nAndroid Studio'),
        ),*/ /*
          ),
    );
  }
}*/

//snake case : my_class
//Ctrl + D : Duplicate Text (Similar Copy with new line)
/* Column
|  Main     -> CrossAxis
V  Axis
 */
/* Row
|  Cross    -> MainAxis
V  Axis
 */
