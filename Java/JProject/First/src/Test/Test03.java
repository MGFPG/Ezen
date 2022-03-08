package Test;

public class Test03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		final int ON = 1;
		final int OFF = 0;
		
		int state = 3;
		
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
