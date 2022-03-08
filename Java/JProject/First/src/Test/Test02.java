package Test;

public class Test02 {
	
	private static final int ON = 1;
	private static final int OFF = 0;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int state = 1;
		switch(state) {
		
		case ON:
			System.out.println("On");
			break;
		
		default:
			System.out.println("Unknown");
			
		case OFF:
			System.out.println("Off");
		}

	}

}
