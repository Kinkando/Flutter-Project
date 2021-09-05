import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';

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
      home: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var score = 0;
  bool teamBlue = true;

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
          // ไม่ให้ layout ไปอยู่ตรงส่วน status bar หรือ notch
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [3, 2, 1]
                        .map(
                          (item) => Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: ElevatedButton(
                                onPressed: !teamBlue && score < 20
                                    ? () {
                                        setState(() {
                                          score += item;
                                          teamBlue = !teamBlue;
                                        });
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                ),
                                child: Text(
                                  item.toString(),
                                  style: TextStyle(fontSize: 40.0),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                /*Stack(
                  children: [
                    if (score < 20)
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            for (var i = 0; i < score; i++)
                              Icon(Icons.star, color: Colors.purple),
                            for (var i = score; i < 20; i++)
                              Icon(Icons.star_border, color: Colors.purple),
                          ],
                        ),
                      ),
                    Center(
                      child: score < 20
                          ? Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Opacity(
                                opacity: teamBlue ? 0.1 : 1.0,
                                child: Icon(
                                  Icons.expand_less,
                                  size: 90.0,
                                ),
                              ),
                              Text(
                                score.toString(),
                                style: TextStyle(fontSize: 120.0),
                              ),
                              Opacity(
                                opacity: teamBlue ? 1.0 : 0.1,
                                child: Icon(
                                  Icons.expand_more,
                                  size: 90.0,
                                ),
                              ),
                            ],
                          )
                          : Column(
                              children: [
                                Text(
                                  teamBlue ? "BLUE" : "RED",
                                  style: TextStyle(fontSize: 100.0),
                                ),
                                Text(
                                  "win !",
                                  style: TextStyle(fontSize: 100.0),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      score = 0;
                                      teamBlue = true;
                                    });
                                  },
                                  child: Text(
                                    'NEW GAME',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),*/
                Row(
                  children: [
                    if (score < 20)
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            for (var i = 0; i < score; i++)
                              Icon(Icons.star, color: Colors.purple),
                            for (var i = score; i < 20; i++)
                              Icon(Icons.star_border, color: Colors.purple),
                          ],
                        ),
                      ),
                    Expanded(
                      child: score < 20
                          ? Padding(
                              padding: const EdgeInsets.only(right: 40.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Opacity(
                                    opacity: teamBlue ? 0.1 : 1.0,
                                    child: Icon(
                                      Icons.expand_less,
                                      size: 90.0,
                                    ),
                                  ),
                                  Text(
                                    score.toString(),
                                    style: TextStyle(fontSize: 120.0),
                                  ),
                                  Opacity(
                                    opacity: teamBlue ? 1.0 : 0.1,
                                    child: Icon(
                                      Icons.expand_more,
                                      size: 90.0,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                Text(
                                  teamBlue ? "BLUE" : "RED",
                                  style: TextStyle(fontSize: 100.0),
                                ),
                                Text(
                                  "win !",
                                  style: TextStyle(fontSize: 100.0),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      score = 0;
                                      teamBlue = true;
                                    });
                                  },
                                  child: Text(
                                    'NEW GAME',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [1, 2, 3]
                        .map(
                          (item) => Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: ElevatedButton(
                                onPressed: teamBlue && score < 20
                                    ? () {
                                        setState(() {
                                          score += item;
                                          teamBlue = !teamBlue;
                                        });
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                ),
                                child: Text(
                                  item.toString(),
                                  style: TextStyle(fontSize: 40.0),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
