import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      home: Viewer(),
    );
  }
}

class Viewer extends StatefulWidget {
  const Viewer({Key? key}) : super(key: key);

  @override
  _ViewerState createState() => _ViewerState();
}

class _ViewerState extends State<Viewer> {
  var selected = 0;
  var font = [
    GoogleFonts.kanit(fontSize: 60.0),
    GoogleFonts.charmonman(fontSize: 60.0),
    GoogleFonts.koHo(fontSize: 60.0),
    GoogleFonts.pattaya(fontSize: 60.0),
    GoogleFonts.sriracha(fontSize: 60.0)
  ];
  var fontName = ["Kanit", "Charmonman", "KoHo", "Pattaya", "Sriracha"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      appBar: AppBar(
        title: Text("THAI FONT VIEWER"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "การเดินทางขากลับคงจะเหงาน่าดู",
                  textAlign: TextAlign.center,
                  style: font[selected],
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "Font: ${fontName[selected]}",
                  style: TextStyle(fontSize: 20.0),
                ),
                Card(
                  color: Colors.white,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Wrap(
                      children: [
                        for(var i=0; i<font.length; i++)
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selected = i;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.teal,
                              ),
                              child: Text(fontName[i].toString()),
                            ),
                          ),
                      ],
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
