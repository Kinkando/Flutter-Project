/*
1กค-5533-57
2กค-6087-61
3กค-6230-41
4กค-5916-44
5กค-6166-50
*/
void main() {
  Map<String, dynamic> reportMap1 = {
    'date': '1กค',
    'case': 5544,
    'death': 57,
  };
  Map<String, dynamic> reportMap2 = {
    'date': '2กค',
    'case': 6087,
    'death': 61,
  };
  Map<String, dynamic> reportMap3 = {
    'date': '3กค',
    'case': 6230,
    'death': 41,
  };
  Map<String, dynamic> reportMap4 = {
    'date': '4กค',
    'case': 5916,
    'death': 44,
  };
  Map<String, dynamic> reportMap5 = {
    'date': '5กค',
    'case': 6166,
    'death': 50,
  };

  List<String> dateList = ['1กค', '2กค', '3กค', '4กค', '5กค'];
  List<int> caseList = [5544, 6087, 6230, 5916, 6166];
  List<int> deathList = [57, 61, 41, 44, 50];

  /*for (var i = 0; i < caseList.length; i++) {
    print('วันที่ ${dateList[i]}, ติดเชื้อ ${caseList[i]}, เสียชีวิต ${deathList[i]}');
  }*/

  List<Map<String, dynamic>> reportList = [
    {'date': '1กค', 'case': 5544, 'death': 57},
    {'date': '2กค', 'case': 6087, 'death': 61},
    {'date': '3กค', 'case': 6230, 'death': 41},
    {'date': '4กค', 'case': 5916, 'death': 44},
    {'date': '5กค', 'case': 6166, 'death': 50}
  ];

 /* for(var i=0; i<reportList.length; i++) // Procedural Programmal
    print('วันที่ ${reportList[i]['date']}, ติดเชื้อ ${reportList[i]['case']}, เสียชีวิต ${reportList[i]['death']}');*/

  /*var f = (int i) { //create function
    print(i);
  };
  f(2);*/
  /*var f = (Map<String, dynamic> i) {
    print(i);
  };

  reportList.forEach(f); //โยนฟังก์ชันให้ forEach ไป call โดยจะส่ง reportList แต่ละก้อนเป็น parameter ให้ฟังก์ชัน f
                         //วนลูปให้ครบรอบสมาชิก แล้วดึงข้อมูลในแต่ละรอบส่งไปเป็นพารามิเตอร์ให้ฟังก์ชัน f โดยต้องกำหนดชนิดข้อมูลที่รับพารามิเตอร์มาให้ตรงกันกับชนิดข้อมูลของ reportList*/
  reportList.forEach((Map<String, dynamic> item) { // Functional Programming : ไม่ต้องมีตัวแปรระบุ State, index
    /*return*/ print('วันที่ ${item['date']}, ติดเชื้อ ${item['case']}, เสียชีวิต ${item['death']}');
  });
  reportList.forEach((Map<String, dynamic> item) => print('วันที่ ${item['date']}, ติดเชื้อ ${item['case']}, เสียชีวิต ${item['death']}')); //Array Syntax (Shorthand) : only 1 statement return *ไม่ต้องมีคำว่า return*
}
