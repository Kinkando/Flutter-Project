void main() {
  List list = [1, 2, 3, 4, 5];
  /*list.forEach((item) {
    print(item);
  });*/
  List list2 = list.map((e) {return e+10;}).toList();    // ส่ง parameter call back function
                                                         // เรียกใช้ฟังก์ชัน toList()
                                                         // เก็บลงตัวแปร list อีกตัวก็ได้
  //list.map((e) => null);  //map จากค่าเดิมเป็นค่าใหม่ (ของแต่ละสมาชิก) ส่งฟังก์ชันไปให้ map
  //list2.forEach((element) => print(element));
  List list3 = list.map((i) {
    return {
      'data' : i,
    };
  }).toList();
  print(list3);

    //Imperative UI สั่งการเปลี่ยนแปลง UI โดยตรง
        //b.setColor(red);    b.clearChildren();    b.add(new ViewC(...));
    //Declarative UI เปลี่ยนแปลงค่าของตัวแปร (State) และสั่ง UI Render ใหม่
        //return ViewB( color: red,   child: ViewC(...),  );


  List<Map<String, dynamic>> reportList = [
    {'date': '1กค', 'case': 5533, 'death': 57},
    {'date': '2กค', 'case': 6087, 'death': 61},
    {'date': '3กค', 'case': 6230, 'death': 41},
    {'date': '4กค', 'case': 5916, 'death': 44},
    {'date': '5กค', 'case': 6166, 'death': 50},
  ];
}

//เข้าไปที่ไฟล์ pubspec.yaml ในโฟลเดอร์ test เพื่อ set path ดึงรูปภาพมา
//โดยไป Uncomment บรรทัดที 48 เป็น assets โดยเว้น space 2 space
//ใส่ path โฟลเดอร์รูปภาพ โดยเว้น 3 space