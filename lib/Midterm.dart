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
        primarySwatch: Colors.red,
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
  var _redScore = 0;
  var _blueScore = 0;
  var _round = 0;
  List<Widget> scoreList = [];
  countScore(bool teamR) {
    _redScore += teamR ? 10 : 9;
    _blueScore += teamR ? 9 : 10;
    scoreList.add(
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
                "ROUND ${++_round}"
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(teamR? "10" : "9", style: TextStyle(fontSize: 28.0)),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(teamR? "9" : "10", style: TextStyle(fontSize: 28.0)),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.0,
          )
        ],
      ),
    );
    if(_round==3) {
      scoreList.add(
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                  "TOTAL"
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(_redScore.toString(), style: TextStyle(fontSize: 28.0)),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(_blueScore.toString(), style: TextStyle(fontSize: 28.0)),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1.0,
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OLYMPIC BOXING SCORING')),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image(
                image: AssetImage('assets/images/logo.png'),
                height: 60.0,
              ),
            ),
            Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Center(
                  child: Text(
                    "Women's Light (57-60kg) Semi-final",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Icon(Icons.person, color: Color(0xFFA00000), size: 70.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/flag_ireland.png'),
                            width: 40.0,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "  IRELAND",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text("HARRINGTON Kellie Anne", style: TextStyle(fontSize: 14.0)),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 50.0,
                  child: _round==3 && _redScore>_blueScore ?
                  Icon(Icons.check, size: 50.0, color: Colors.green)
                      :null,
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.person, color: Color(0xFF0000A0), size: 70.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/flag_thailand.png'),
                            width: 40.0,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "  THAILAND",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text("SEESONDEE Sudaporn", style: TextStyle(fontSize: 14.0)),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 50.0,
                  child: _round==3 && _blueScore>_redScore ?
                  Icon(Icons.check, size: 50.0, color: Colors.green)
                      :null,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: Container(height:6.0, color:Color(0xFFA00000))),
                Expanded(child: Container(height:6.0, color:Color(0xFF0000A0))),
              ],
            ),
            Expanded(
              child: Column(
                children: scoreList,
              ),
            ),
            _round < 3 ?
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          countScore(true);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFA00000),
                        minimumSize: Size(100.0, 50.0),
                      ),
                      child: Icon(Icons.person, size: 28.0, color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          countScore(false);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0000A0),
                        minimumSize: Size(100.0, 50.0),
                      ),
                      child: Icon(Icons.person, size: 28.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ) :
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _redScore = 0;
                          _blueScore = 0;
                          _round = 0;
                          scoreList.clear();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        minimumSize: Size(100.0, 50.0),
                      ),
                      child: Icon(Icons.clear, size: 28.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}