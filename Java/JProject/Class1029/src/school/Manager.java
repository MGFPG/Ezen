package school;

import java.util.Scanner;

public class Manager {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		boolean run = true;
		
		while(run) {
		System.out.println("=============================================================");
		System.out.println("1. �л� ��� | 2. �л� ��� | 3. ���� ��û | 4. �л� ���� | 5. ����");
		System.out.println("=============================================================");
		System.out.println("���� > ");
		
		int selectNo = scanner.nextInt();
		
		if (selectNo == 1) {
			CreateStudent();
		} else if (selectNo == 2) {
			Studentlist();
		} else if (selectNo == 3) {
			ClassReg();
		} else if (selectNo == 4) {
			StudentINfor();
		} else if (selectNo == 5) {
			run = false;
		}
		
		}
	}

	private static void CreateStudent() {
		// TODO Auto-generated method stub
		
	}

	private static void StudentINfor() {
		// TODO Auto-generated method stub
		
	}

	private static void ClassReg() {
		// TODO Auto-generated method stub
		
	}

	private static void Student() {
		// TODO Auto-generated method stub
		
	}

	private static void Studentlist() {
		// TODO Auto-generated method stub
		
	}

}
