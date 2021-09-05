// Top-Level Functions : not in class
void main() {
  sayHello('World');
  sayHello("World", text2:"Flutter");
  sum(1,2);
  sum(3,4, c:5);
  Hello.say(text:"World");
  Hello.say();
  //var hello = new Hello();
  //var hello = Hello('Flutter'); //Instantiate : new Object from Class can not type new when create new Object
      //var hello = Hello(text: 'Flutter');
  var hello = Hello(text: 'Worldz');
  hello.said("Android");
  hello.sayH();
  print(hello.text);

  hello = Hello();
  hello.sayH();
}

// String text => must not null value
// String? text => can be null value
      // positional parameter,   {named parameter}
void sayHello(String text, {String? text2, String text3 = 'iOS'}) { // function
  //print('Hello $text');
  //print('Hello '+text);
  print('Hello ${text.toUpperCase()} $text2 $text3');
}
int sum(int a, int b, {int c = 0}) {
  return a+b+c;
}

class Hello {
  //String? _text; // _ : private
  final String text;
  //Hello(this.text); // shortcut of constructor
  Hello({this.text = 'World'});

  //Hello(String text) : _text = t; // initializer : set value of private field

  /*
  Hello(String text) { // shortkey : Alt + insert or Code > Generate...
    this.text = text;
  }*/
  void said(String text) { // instant method
    print('Hello $text');
  }
  static void say({String text : "Flutter"}) { // static method or functions
    print('Hello $text');
  }
  void sayH() {
    print('Hello ${this.text}');
  }
}