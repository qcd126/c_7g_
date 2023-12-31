//프로세싱 코드
import processing.serial.*;
import processing.net.*;
Server s;
Client c;
Serial p;
void setup(){
  p = new Serial(this,"COM3",9600);
  s = new Server(this, 12345);
}
void draw(){
  c =s.available();
  if(c!=null){
    String m=c.readString();
    m = m.substring(m.length()-1);  // 마지막 1문자만 추출하기
    p.write(m);
    if(m.indexOf("1")==0) background(255,0,0);
    if(m.indexOf("0")==0) background(0,0,255);
  }
}
void keyPressed(){
  background(0);
  textSize(64);
  text(key, 30, 70);
  p.write(key);
}
