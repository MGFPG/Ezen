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

// 10�� A�� ������ �޾� A, B, C, D, F ������ ����ϴ� ���α׷��� �ۼ��Ͻÿ�.

// 9�� B, 8�� C