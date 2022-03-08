package EX;

public class Q03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int num1 =0;
		int num2 =0;
		
		while(num1+num2 !=5) {
			num1=(int)(Math.random()*6)+1;
			num2=(int)(Math.random()*6)+1;
			System.out.println(num1+","+num2);
		}

	}

}
//두개의 주사위를 던졌을 때 나오는 두 가지 눈 구하기. 눈의 합이 5가 아니면 계속 던지고, 합이 5이면 실행을 멈추는 코드. while와 Math.random을 사용