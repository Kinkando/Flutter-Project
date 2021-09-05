import 'dart:io';
import 'dart:math';
void main() {
  const MAX_RANDOM = 100;
  var r = new Random();
  var answer = r.nextInt(MAX_RANDOM)+1;
  var guess;
  var round = 0;
  print("─────────────────────────────────────────");
  print("             GUESS THE NUMBER            ");
  print("─────────────────────────────────────────");
  do {
    stdout.write('Guess the number between 1 and $MAX_RANDOM: ');
    String? input = stdin.readLineSync(); //String? => can null
    if (input == null || int.tryParse(input) == null) {
      continue;
    }
    guess = int.parse(input);
    round++;
    if (answer == guess)
      print('➜ $input is CORRECT!, total guesses: $round');
    else if (answer > guess)
      print("➜ $input is TOO LOW!");
    else
      print("➜ $input is TOO HIGH!");
    print("─────────────────────────────────────────");
  }while(guess!=answer);
  print("                 THE END                 ");
  print("─────────────────────────────────────────");
}