import 'dart:io';
import 'dart:math';

void main() { //main ทำหน้าที่ในการสื่อสารกับ User : controller
  var correct = false;
  print('╔═══════════════════════════════════════════════');
  print('║               GUESS THE NUMBER                ');
  print('╟───────────────────────────────────────────────');
  stdout.write('║ Enter max number you want to guess: ');
  var numGuesses = stdin.readLineSync();
  int? guessRange = int.tryParse(numGuesses!);
  var game = Game(maxRandom: guessRange!);
  print('╟───────────────────────────────────────────────');
  do {
    stdout.write('║ Guess the number between 1 and $guessRange: ');
    var input = stdin.readLineSync();
    int? guess = int.tryParse(input!);
    if(guess != null) {
      //game.increaseTotalGuesses();
      Map resultMap = game.doGuess(guess!);
      var message = resultMap['text'];
      print('║ ➜ $guess : $message');
      correct = resultMap['isCorrect'];
      print('╟───────────────────────────────────────────────');
    }
  }while(!correct);
  var total = game.getTotalGuesses();
  print('║ Total guesses : $total');
  print('╟───────────────────────────────────────────────');
  print('║                   THE END                     ');
  print('╚═══════════════════════════════════════════════');
}

class Game { // Model : เก็บเฉพาะข้อมูล/Logic การทำงาน ไม่มีหน้าที่ในการสื่อสารกับ User
  late int answer; // not modify null value
  final int maxRandom;
  int totalGuesses = 0;
  //final : run time constant ค่าคงที่ในช่วงเวลาคอมไพล์
  //const : complie time constant ค่าคงที่ที่กำหนดไว้ตั้งแต่ตอนที่คอมไพล์ ทำให้รันโปรแกรมได้เร็วขึ้นในช่วงเวลา run time
  static const List feedbackList = [ // literal value : fixed value
    {
      'text': 'TOO HIGH! ▲',
      'isCorrect': false
    },
    {
      'text': 'TOO LOW! ▼',
      'isCorrect': false
    },
    {
      'text': 'CORRECT! ❤',
      'isCorrect': true
    }
    ];
  /*Game({this.maxRandom : 1000}) {
    this.answer = Random().nextInt(this.maxRandom)+1;
  }*/

  // เฉลย
   Game({required this.maxRandom}) : this.answer = Random().nextInt(maxRandom)+1;

  /*void increaseTotalGuesses() {
    this.totalGuesses++;
  }*/
  int getTotalGuesses() {
    return this.totalGuesses;
  }
  Map doGuess(int num) {
    totalGuesses++;
    return num == this.answer ? feedbackList[2] : num > this.answer ? feedbackList[0] : feedbackList[1];
  }
}