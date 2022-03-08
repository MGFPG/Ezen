package Test;

public class Test05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		final char ON = '1';
		final char OFF = '0';
		
		char state = '0';
		
		switch(state){
			
			case ON:
				System.out.println("On");
				break;
			case OFF:
				System.out.println("Off");
				break;
			default:
				assert false;
		}

	}

}
