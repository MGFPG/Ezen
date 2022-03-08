package innerclass;

class OutClass {

	private int num = 10;
	private static int sNum = 20;
	
	private InClass inClass;
	
	public OutClass(){
		inClass = new InClass();
	}
	
	class InClass{
		
		int inNum = 100;
		//static int sInNum = 200;  //에러 남
		
		void inTest(){
			System.out.println("OutClass num = " +num + "(외부 클래스의 인스턴스 변수)");
			System.out.println("OutClass sNum = " + sNum + "(외부 클래스의 스태틱 변수)");
		}
		
	    //static void sTest(){  //에러 남
	    	
	    //}
		
	}
	
	public void usingClass() {
		inClass.inTest();
	}
}

	public class InnerTest{
		public static void main(String[] args) {
			OutClass outClass = new OutClass();
			System.out.println("외부 클래스를 이용하여 내부 클래스 기능을 호출");
			outClass.usingClass();
		}
	}
