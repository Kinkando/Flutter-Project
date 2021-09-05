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
  var font = GoogleFonts.kanit(fontSize: 60.0);
  var fontName = "Kanit";

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
                  style: font,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "Font: $fontName",
                  style: TextStyle(fontSize: 20.0),
                ),
                Card(
                  color: Colors.white,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                font = GoogleFonts.kanit(fontSize: 60.0);
                                fontName = "Kanit";
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.teal,
                            ),
                            child: Text("Kanit"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                font = GoogleFonts.charmonman(fontSize: 60.0);
                                fontName = "Charmonman";
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.teal,
                            ),
                            child: Text("Charmonman"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                font = GoogleFonts.koHo(fontSize: 60.0);
                                fontName = "KoHo";
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.teal,
                            ),
                            child: Text("KoHo"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                font = GoogleFonts.pattaya(fontSize: 60.0);
                                fontName = "Pattaya";
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.teal,
                            ),
                            child: Text("Pattaya"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                font = GoogleFonts.sriracha(fontSize: 60.0);
                                fontName = "Sriracha";
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.teal,
                            ),
                            child: Text("Sriracha"),
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
