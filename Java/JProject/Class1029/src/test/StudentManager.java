package test;
	
import java.util.Scanner;

public class StudentManager {
		
	static Scanner scan = new Scanner(System.in);

	public static void main(String[] args) {
		final int MAX = 1;
					
		String names[] = new String[MAX];
		String major[] = new String[MAX];
		String phone[] = new String[MAX];
		String sNumber[] = new String[MAX];
		float avg[] = new float[MAX];
			
		int select = 0;
			
		Scanner scan = new Scanner(System.in);
			
		System.out.println("-- 학생 관리 프로그램 --");
			
		while(true) {
			System.out.println("<< 메뉴 >>");
			System.out.println("=============================================================");
			System.out.println("1. 학생 등록 | 2. 학생 목록 | 3. 수강 신청 | 4. 학생 정보 | 5. 종료");
			System.out.println("=============================================================");
			System.out.print("선택> ");
			select = scan.nextInt();		
				
				
			if(select == 5) {
				System.out.println("종료합니다.");
				break;
			}
				
			switch(select) {
				case 1:
				System.out.println("학생 등록");
				for(int i = 0; i < MAX; i++) {
					System.out.println("-------------------");
					scan.nextLine();
					System.out.print("이름 : ");
					names[i] = scan.nextLine();
					System.out.print("학과 : ");
					major[i] = scan.nextLine();
					System.out.print("연락처 : ");
					phone[i] = scan.nextLine();
					System.out.print("학번 : ");
					sNumber[i] = scan.nextLine();
					System.out.print("평균 : ");
					String fStr = scan.nextLine();
					avg[i] = Float.parseFloat(fStr);
					}
					break;
				case 2:
					System.out.println("학생 목록");
					for(int i = 0; i < MAX; i++) {
						System.out.println("-------------------");
						System.out.println(names[i]);
					}
					break;
				case 3:
					System.out.println("수강 신청");
					for(int i = 0; i < MAX; i++) {
						System.out.println("-------------------");
						
					}
					break;
				case 4:
					System.out.println("학생 정보");
					for(int i = 0; i < MAX; i++) {
						System.out.println("-------------------");
						System.out.print(" 이름 : " + names[i]);
						System.out.print(" 학과 : " + major[i]);
						System.out.print(" 연락처 : " + phone[i]);
						System.out.print(" 학번 : " + sNumber[i]);
						System.out.print(" 평균 : " + avg[i]);
					}
					break;
				default:
					System.out.println("잘못 누르셨습니다.");
					break;
				}
		}
	}
		private static int printMenu() {
			return 0;
		}
}

