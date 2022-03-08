package charpter6;

public class Bus {
	
	 int busNumber;          
	 int passengerCount; 
	 int money=0;
	 int capacity=0;
	 int charge;
	 int mil=0;
	 String color = "Green";
	    
	 public Bus(int busNumebr, int charge, int capacity, int mil)  {   
		  this.busNumber = busNumebr;
		  this.charge = charge;
		  this.capacity = capacity;
		  this.mil = mil;
	 }
	
	 public int take(int money)  {  
		  this.money += charge;   
		  passengerCount++;
		  return this.passengerCount;
	 }
	 
	 public int run() {
		 mil--;
		 return mil;
	 }
	 
	 public void setcolor(String color) {
		 this.color = color;
	 }
	    
	 public void showInfo() {     
		  System.out.println("\nbus busNumber: " + busNumber + "\nbus passengerCount: " + passengerCount + "\nbus money: " + money + 
				  "\nbus Bus color: " + color + "\nbus mil: " + mil);
	 }


}
