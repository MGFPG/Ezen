package test.ocajp;

public class ArrayTest {

	public static void main(String[] args) {
		String[] str = new String[3];
		for(int i=0; i<3; i++) {
			System.out.println("str["+i+"]"+str[i]);
		}
		
		String[] names = new String[] {"kim","Lee","park"};
		for(int i=0;i<3;i++) {
			str[i]=names[i];
			System.out.println(str[i]);
		}
		
		int[] scores= {11,2,5};
		//int[] scores;
		//scores=new int {11,2,5};
		System.out.println("scores[0]="+scores[0]);
		System.out.println("scores[1]="+scores[1]);
		System.out.println("scores[2]="+scores[2]);

		int sum=0;
		for(int i=0;i<scores.length;i++) {
			sum+=scores[i];
		}
		System.out.println("Sum : "+sum);
		double avg=(double)sum/3;
		System.out.println("Average : "+avg);
		
		//////////////
		System.out.println("1+2+3 : "+add(new int[] {1,2,3}));
	}
	public static int add(int[] scores) {
		int sum=0;
		for(int i=0;i<scores.length;i++) {
			sum+=scores[i];
		}
		return sum;

	}

}
