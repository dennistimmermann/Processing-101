//int s = 10;

void setup() {
  size(220,200);
  background(187,201,92);
}

void draw() {
 background(187,201,92);
 stroke(0,0,0,50);
 karopapier(10);
 gebaeude();
 baeume();
 planschbecken(); 
}

void gebaeude() {
 fill(240,126,50);
 rect(40,20,30,110);      //1
 line(55,30,55,120);
 line(40,20,55,30);
 line(70,20,55,30);
 line(40,130,55,120);
 line(70,130,55,120);
 
 fill(240,90,42);
 rect(70,30,60,20);      //2
 //line(80,45,120,45);
 
 fill(209,68,44);
 rect(130,20,60,30);     //3
 line(130,20,190,50);
 line(190,20,130,50);
 
 fill(240,90,42);
 rect(140,50,40,70);     //4
 //line(150,60,150,110);
 
 fill(240,126,50);
 rect(100,120,100,30);   //5
 line(110,135,190,135);
 line(100,120,110,135);
 line(100,150,110,135);
 line(200,120,190,135);
 line(200,150,190,135);
}

void baeume() {
  fill(11,138,24);
  ellipseMode(CORNER);
  ellipse(10,60,20,20);  //7
  for(int i = 8; i > 0; i-=2) {    
    ellipse(20+i*10,160,10,10);
  }
}

void planschbecken() {
  fill(94,215,222);
  ellipseMode(CORNER);
  ellipse(100,80,30,30); //6
}

void karopapier(int spacing) {
  //vertikale linien
 for(int i = 0; i <= width; i+=spacing) {
   line(i, 0, i, height);
 }
 
 //horizontale linien
 for(int j = 0; j <= height; j+=spacing) {
   line(0, j, width, j);
 }  
}
