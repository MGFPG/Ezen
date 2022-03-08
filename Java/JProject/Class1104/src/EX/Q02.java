package EX;

public class Q02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int num=0;
		for(int i = 1; i<100; i++) {
			if(i%3==0) {
				num+=i;
			}
			System.out.println("3의 배수의 합은: "+ num);
		}

	}

}
// for문 이용해서 1부터 100까지 3의 배수 총합 구하기