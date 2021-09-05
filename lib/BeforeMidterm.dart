import 'package:flutter/material.dart';

void main() {
  runApp(MyApps());
}
class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
    );
  }
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _score = 0;
  bool _teamB = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: const AssetImage('assets/images/bg.jpg'),
            fit: BoxFit
                .fill, // ยืดเต็มพื้นที่โดยไม่สนใจสัดส่วนของภาพ หรือใช้ BoxFit.cover เพื่อยืดให้เต็มและคงสัดส่วนของภาพไว้ แต่บางส่วนของภาพอาจถูก crop
          ),
        ),
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for(var i=3;i>0;i--)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          child: ElevatedButton(
                            onPressed: _teamB || _score>=20 ? null : () {
                              setState(() {
                                _score+=i;
                                _teamB = !_teamB;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            child: Text(
                              i.toString(),
                              style: TextStyle(fontSize: 40.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                Expanded(
                  child: _score<20 ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for(var i=0;i<_score;i++)
                              Icon(Icons.star, color: Colors.purple),
                            for(var i=_score; i<20; i++)
                              Icon(Icons.star_border_outlined, color: Colors.purple),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.keyboard_arrow_up, color: Colors.black.withOpacity(_teamB?0.1:1.0) ,size: 100.0),
                            Text(_score.toString(), style: TextStyle(fontSize: 150.0)),
                            Icon(Icons.keyboard_arrow_down, color: Colors.black.withOpacity(_teamB?1.0:0.1) ,size: 100.0)
                          ],
                        ),
                      ),
                      Container(
                        width: 30.0,
                      )
                    ],
                  ) :
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_teamB ? "BLUE" : "RED", style: TextStyle(fontSize: 120.0)),
                          Text("win !", style: TextStyle(fontSize: 120.0)),
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _score = 0;
                                _teamB = true;
                              });
                            },
                            child: Text(
                              'NEW GAME',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(var i=1;i<4;i++)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          child: ElevatedButton(
                            onPressed: !_teamB || _score>=20 ? null : () {
                              setState(() {
                                _score+=i;
                                _teamB = !_teamB;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                            ),
                            child: Text(
                              i.toString(),
                              style: TextStyle(fontSize: 40.0),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
