import 'dart:math';

class Game {
  final int _answer;
  int _totalGuesses;
  //final String b;
  //bool? c;
  //ถ้าไม่กำหนดค่าเริ่มต้น จะเกิด null safety

  //Game(this._answer);

  Game() : _answer = Random().nextInt(100)+1, _totalGuesses=0;
  //Game() : _answer = Random().nextInt(100)+1 { print('Game constructor'); }
  //Game(int a, String b) : _answer = 10, b = 'Hello'; เรียกว่า Initializer List ค่าที่เป็น final ได้
  //Game(int a, String b) : _answer = 10, b = 'Hello' { c = true; } ส่วน body สามารถกำหนดค่าอื่นๆได้ ที่ไม่ใช่การ Initialize ค่าตัวแปร

  int get totalGuesses { //จะมองเป็นตัวแปร ต่างจาก method
    return _totalGuesses;
  }

  /*int getTotalGuesses() {
    return _totalGuesses;
  }*/

  int doGuess(int num) {
    _totalGuesses++;
    return num > _answer ? 1 : num < _answer ? -1 : 0;
  }
}