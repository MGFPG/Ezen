package exception;

public class ArrayExceptionHandling {

	public static void main(String[] args) {

		int[] arr = new int[5];
		
		for(int i = 0; i<=5; i++){
			arr[i] = i;
			System.out.println(arr[i]);
		}
	
		System.out.println("프로그램 종료");
	}
}
