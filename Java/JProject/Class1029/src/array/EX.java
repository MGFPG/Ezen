package array;

public class EX {
	
	public static String months[];

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		months = new String[12];
		
		String[] months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
		
		int count = 0;
		
		for(String month : months) {
			switch(count++) {
			case 0: case 1: case 11:
				System.out.println("Winter: " + month);
				break;
			case 2: case 3: case 4:
				System.out.println("Spring: " + month);
				break;
			case 5: case 6: case 7:
				System.out.println("Summer: " + month);
				break;
			case 8: case 9: case 10:
				System.out.println("Autumn: " + month);
				break;
			}
		}

	}

}
