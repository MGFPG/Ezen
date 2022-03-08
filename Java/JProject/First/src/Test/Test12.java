package Test;

public class Test12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String group="";
		
		int age = 8;
		
		switch(age){
			case 4: case 5:{
				group = "Play House";
			}
			case 6: case 7:case 8:
				group = "Nursery";
		}
		
		System.out.println(group); //The local variable group may not have been initialized


	}

}
