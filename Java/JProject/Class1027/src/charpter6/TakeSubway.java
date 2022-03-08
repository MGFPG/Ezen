package charpter6;

public class TakeSubway {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Subway redline = new Subway("redline", 1250);
		Subway greenline = new Subway("greedline", 2000);
		
		int money;
		
		for(int i = 0; i<10; i++) {
			
			money = redline.take(i);
			redline.showInfo();
			
			greenline.take(i);
			greenline.showInfo();
		}
		

	}

}
