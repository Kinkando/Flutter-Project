import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        primarySwatch: MaterialColor(0xFFFFFFFF, {
          50: Color.fromRGBO(255, 255, 255, .1),
          100: Color.fromRGBO(255, 255, 255, .2),
          200: Color.fromRGBO(255, 255, 255, .3),
          300: Color.fromRGBO(255, 255, 255, .4),
          400: Color.fromRGBO(255, 255, 255, .5),
          500: Color.fromRGBO(255, 255, 255, .6),
          600: Color.fromRGBO(255, 255, 255, .7),
          700: Color.fromRGBO(255, 255, 255, .8),
          800: Color.fromRGBO(255, 255, 255, .9),
          900: Color.fromRGBO(255, 255, 255, 1),
        }),
      ),
      home: GamePage(),
    );
  }
}
class Game {
  final int _answer;
  int _totalGuesses = 0;
  var _guessesList = [];

  Game() : _answer = Random().nextInt(100)+1, _totalGuesses=0;

  int get totalGuesses {
    return _totalGuesses;
  }

  List get guessesList {
    return _guessesList;
  }

  int doGuess(int num) {
    _totalGuesses++;
    _guessesList.add(num);
    return num > _answer ? 1 : num < _answer ? -1 : 0;
  }
}
class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Game _game;
  final _controller = TextEditingController();
  String? _guessNumber;
  String? _feedback;

  void initialize() {
    _game = Game();
    _guessNumber = "I'm thinking of a number between 1 and 100.";
    _feedback = "Can you guess it?";
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    initialize();
    super.dispose();
  }

  void _showMaterialDialog(int answer, int totalGuesses, List guessesList) {
    String list = "";
    for(int i=0;i<guessesList.length;i++) {
      list += guessesList[i].toString();
      if(i!=guessesList.length-1)
        list+=" -> ";
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('GOOD JOB!'),
          content: Text('The answer is $answer.\nYou have made $totalGuesses guesses.\n\n$list'),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //Render all the time (initField)
    return Scaffold(
      appBar: AppBar(
        title: Text("GUESS THE NUMBER", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.yellow.shade100,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildHeader(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildMainContent(),
              ),
              _buildInputPanel(),
            ],
          ),
        ),
      ),
    );
  }

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
            color: Colors.blue
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
        Text(
          _guessNumber!,
          style: GoogleFonts.kanit(
              fontSize: int.tryParse(_guessNumber!) != null ? 80.0 : 30.0,
          ),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(_feedback! != "Can you guess it?")
              Icon(
                  _feedback! == 'CORRECT!' ? Icons.done : Icons.close,
                  size: 40.0,
                  color: _feedback! == 'CORRECT!' ? Colors.green : Colors.red),
            Text(
                _feedback!,
                style: GoogleFonts.kanit(
                    fontSize: _feedback! != "Can you guess it?" ? 40.0 : 30.0,
                ),
            ),
            if(_feedback! == "Can you guess it?")
              Icon(Icons.favorite, size: 40.0, color: Colors.pink.shade300)
          ],
        ),
        if(_feedback != null && _feedback!.contains('CORRECT!'))
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  initialize();
                });
              },
              style: TextButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text('NEW GAME'),
            ),
          ),
      ],
    );
  }

  Widget _buildInputPanel() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue,
          //border: Border.all(width: 5.0),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.0, -1.0),
              color: Colors.grey,
              spreadRadius: 1.0,
              blurRadius: 5.0,
            ),
          ]
      ),
      //elevation: 10.0, Use in Card Widget to create shadow
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextField(
                enabled: !(_feedback != null && _feedback == 'CORRECT!'),
                controller: _controller,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                cursorColor: Colors.yellow,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  isDense: true,
                  // กำหนดลักษณะเส้น border ของ TextField ในสถานะปกติ
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  // กำหนดลักษณะเส้น border ของ TextField เมื่อได้รับโฟกัส
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: 'Enter the number here',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: _feedback != null && _feedback == 'CORRECT!' ? null : () {
                setState(() {
                  String text = _controller.text;
                  int? guess = int.tryParse(text);
                  if (guess != null) {
                    _controller.clear();
                    _guessNumber = text;
                    var result = _game.doGuess(guess);
                    _feedback = result == 0 ? 'CORRECT!':
                    result == 1 ? 'TOO HIGH!'
                                : 'TOO LOW!';
                    if(_feedback == 'CORRECT!')
                      _showMaterialDialog(guess, _game.totalGuesses, _game.guessesList);
                  }
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
