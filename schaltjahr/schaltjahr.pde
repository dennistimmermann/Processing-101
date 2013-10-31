void setup() {
  if(schaltjahr(2013)) {
    println("yeah");
   }
  else {
    println("nope");
  } 
}

boolean schaltjahr(int jahr) {
  return (jahr%4 == 0 && jahr%100 != 0 || jahr%400 == 0);  
}
