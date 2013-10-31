//int s = 10;

void setup() {
  size(220,200);
  background(187,201,92);
}

void draw() {
 background(187,201,92);
 stroke(0,0,0,50);
 karopapier(10);
 komplex();
 baeume();
 planschbecken(); 
}

void komplex() {
  gebaeude(40,20,30,110);
  gang(70,30,60,20);
  turm(130,20,60,30);
  gang(140,50,40,70);
  gebaeude(100,120,100,30);
}
  
void gebaeude(int x, int y, int w, int h) {
 fill(240,126,50);
 rect(x,y,w,h);      //1
 line(x+w/2,y+10,x+w/2,y+h-10);
 line(x+w,y,x+w/2,y+10);
 line(x,y,x+w/2,y+10);
 line(x,y+h,x+w/2,y+h-10);
 line(x+w,y+h,x+w/2,y+h-10);
}

void gang(int x, int y, int w, int h) {
 fill(240,90,42);
 rect(x,y,w,h);      //2
 //line(80,45,120,45);
}

void turm(int x, int y, int w, int h) { //130, 20
 fill(209,68,44);
 rect(x,y,w,h);     //3
 line(x,y,x+w,y+h);
 line(x+w,y,x,y+h);
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
