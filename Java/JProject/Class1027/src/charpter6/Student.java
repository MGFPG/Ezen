package charpter6;

public class Student {
	
	 public String studentName;   
	 public int grade;        
	 public int money;       
	
	 public Student(String studentName, int money)  {   
		 this.studentName = studentName;
		 this.money = money;
	 }
	    
	 public int takeBus(Bus bus) {
		 bus.showInfo();
		 //System.out.println("Before Money:" + bus.charge);
		 bus.take(bus.charge);
		 
		 bus.showInfo();
		 //System.out.println("After Money:" + bus.charge);
		 
		 this.money -= bus.charge;
		 
		 return this.money;
	 }
	    
	 public void takeSubway(Subway subway) {
		 subway.take(1500);
		 this.money -= 1500;
	 }
	 
	 public void showInfo() {
		  System.out.println(studentName + "¥‘¿« ≥≤¿∫ µ∑¿∫ " + money + "¿‘¥œ¥Ÿ.");
	 }


}
