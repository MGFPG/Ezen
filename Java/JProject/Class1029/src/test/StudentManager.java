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
			
		System.out.println("-- �л� ���� ���α׷� --");
			
		while(true) {
			System.out.println("<< �޴� >>");
			System.out.println("=============================================================");
			System.out.println("1. �л� ��� | 2. �л� ��� | 3. ���� ��û | 4. �л� ���� | 5. ����");
			System.out.println("=============================================================");
			System.out.print("����> ");
			select = scan.nextInt();		
				
				
			if(select == 5) {
				System.out.println("�����մϴ�.");
				break;
			}
				
			switch(select) {
				case 1:
				System.out.println("�л� ���");
				for(int i = 0; i < MAX; i++) {
					System.out.println("-------------------");
					scan.nextLine();
					System.out.print("�̸� : ");
					names[i] = scan.nextLine();
					System.out.print("�а� : ");
					major[i] = scan.nextLine();
					System.out.print("����ó : ");
					phone[i] = scan.nextLine();
					System.out.print("�й� : ");
					sNumber[i] = scan.nextLine();
					System.out.print("��� : ");
					String fStr = scan.nextLine();
					avg[i] = Float.parseFloat(fStr);
					}
					break;
				case 2:
					System.out.println("�л� ���");
					for(int i = 0; i < MAX; i++) {
						System.out.println("-------------------");
						System.out.println(names[i]);
					}
					break;
				case 3:
					System.out.println("���� ��û");
					for(int i = 0; i < MAX; i++) {
						System.out.println("-------------------");
						
					}
					break;
				case 4:
					System.out.println("�л� ����");
					for(int i = 0; i < MAX; i++) {
						System.out.println("-------------------");
						System.out.print(" �̸� : " + names[i]);
						System.out.print(" �а� : " + major[i]);
						System.out.print(" ����ó : " + phone[i]);
						System.out.print(" �й� : " + sNumber[i]);
						System.out.print(" ��� : " + avg[i]);
					}
					break;
				default:
					System.out.println("�߸� �����̽��ϴ�.");
					break;
				}
		}
	}
		private static int printMenu() {
			return 0;
		}
}

