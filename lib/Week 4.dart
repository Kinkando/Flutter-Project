void main() {
  Object b; //ทุก class/object จะต้องมี Object เป็น Parent Node หรือ Loot Node ที่ทุก class/object ไป Inheritance ต่อๆกันมา
  //dynamic b; //dynamically typed - สามารถเปลี่ยนแปลงชนิดข้อมูลได้เรื่อยๆ ณ เวลานั้นๆ หรือใช้ var b; ก็ได้เช่นกัน
  //แต่การประกาศ var มันจะทำการ Infer typed ตอน run-time ทำให้ถูกละเว้นการตรวจสอบ method/function ใดๆ ว่า match กับ ชนิดข้อมูลนั้นๆไหม
  b = 123;
  print(b);
  b = 'hello';
  print(b);
  /*String a;
  int a = 10;// statically typed - fixed ชนิดข้อมูล ไม่สามารถเปลี่ยนแปลงชนิดข้อมูลได้
  var s = 'string'; // inference typed ตามชนิดข้อมูลที่เป็นค่าเริ่มต้น และถูกกำหนดเป็น statically typed
   */
  final name = 'Android'; //statically typed - inference typed with value type และเป็นค่าคงที่ในตอน run time เก็บค่าและล็อกค่าไว้ห้ามแก้ไข และจองพื้นที่ในหน่วยความจำ *ตัวแปรคงที่*
  const minutePerHour = 60; //ตัวแปรคงที่ในตอน compile และแทนค่าๆนั้น ลงไปตอน compile เลย ไม่ต้องไปดึงค่าตอน run time (literal) *ตัวแปรคงที่*

  var foo = const [1,2,3]; //ค่าคงที่ (constant values) เป็น List ที่ถูก Compiler Infer Type ให้เป็น List เมื่อกำหนดให้เป็น var
  //foo.add(4); // Error เนื่องจากเป็น Unmodifiable List ที่ไม่สามารถเพิ่ม/ลบ/แก้ไข ค่าใน List เมื่อถูกกำหนดเป็น const และ
  foo = [4,5,6];
  foo.add(999); // สามารถใช้ได้ เนื่องจากตอนนี้ตัวแปร foo ย้ายตัวชี้ไปที่ 4,5,6
  print(foo);

  //เนื่องจาก final จะ lock ที่ตัวแปรว่าห้ามไปชี้ที่อื่น
  final fee = const[1,2,3];
  //fee.add(4); //ไม่สามารถเพิ่มได้
  final fee2 = [1,2,3];
  fee2.add(4); //สามารถเพิ่มได้

  var f = sum; //เอา f ไปแทนเป็นตัวฟังก์ขัน sum ทั้งก้อน (โดยไม่ใส่ () ) และไม่ใช่การเรียกใช้ฟังก์ชัน
  print(f(123,456));

  var f2 = (int a, int b) { //Function Expression : นิพจน์ฟังก์ชัน
    return a+b;
  };
  var f3 = (int a, int b) => a+b; // Arrow Syntax : return only 1 statement
}

                     //default 999,  null
            //Parameter
       //Positional          Named
int sum(int a, int b, {int? c, int d = 999}) { //Function Declaration
  return a + b + c! + d;
}
         //Required    //Optional     //ฟังก์ชันหนึ่งไม่สามารถมีทั้ง Optional (Positional Parameter) และ Named Parameter พร้อมกันได้
int sum2(int a, int b, [int c = 0]) { // วิธี call คือ var s = sum(3,4,5); คือ ถ้าต้องการระบุค่า c สามารถใส่ได้เลย ไม่ต้องระบุชื่อ
  return a+b+c;
}