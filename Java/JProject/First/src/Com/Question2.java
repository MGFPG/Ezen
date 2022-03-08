package Com;

public class Question2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int score = 10;
		char grade;
		
		if(score >=10){
			grade = 'A'; 
		}
		else if(score >=9){
			grade = 'B'; 
		}
		else if(score >=8){
			grade = 'C'; 
		}
		else if(score >=7){
			grade = 'D'; 
		}
		else{
			grade = 'F';
		} 
		
		System.out.println(grade);
	}
}

// 10이 A인 점수를 받아 A, B, C, D, F 인지를 출력하는 프로그램을 작성하시오.

// 9는 B, 8은 C