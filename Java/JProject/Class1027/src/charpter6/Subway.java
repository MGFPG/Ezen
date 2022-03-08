package charpter6;

public class Subway {
	
	 public String lineNumber;          
	 public int passengerCount;          
	 public int money;
	 int charge;
	    
	 public Subway(String lineNumber, int charge) {   
		  this.lineNumber = lineNumber;
		  this.charge = charge;
	 }
	    
	 public int take(int money) {      
		  this.money += charge;         
		  passengerCount++;
		  return this.passengerCount;
	 } 
	    
	 public void showInfo()         
	 {
		  System.out.println(lineNumber + "의 승객은 " + passengerCount +"명이고, 수입은 " + money + "입니다.");
	 }

}
