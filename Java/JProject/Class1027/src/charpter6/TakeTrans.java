package charpter6;

public class TakeTrans {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Student yearim = new Student("yearim", 10000);
		Student dael = new Student("dael", 10000);
		
		Bus bus100 = new Bus(100, 1000, 20, 200);
		Bus bus200 = new Bus(200, 1100, 18, 180);
		
		bus100.showInfo();
		
		//int remained_money;
		
		//while(true) {
			
			//remained_money = yearim.takeBus(bus100);  // �Լ��� �ٷΰ��� �ϴ� ��: Ŀ���� �ΰ� �������� ������ open declaration�� ������.  
			
			//if(remained_money < bus100.charge) {
				//System.out.println("�ܾ��� �����մϴ�.");
				//break;
			//}
			
		//}
		
		//int persons;
		
		//while(true) {
			//persons = bus100.take(bus100.charge);
			
			//if(persons == bus100.capacity) {
				//System.out.println("�����Դϴ�.");
				//break;
			//}
		//}
		
		while(true) {
			if(10 == bus100.mil) {
				System.out.println("�����Ϸ�");
				break;
			}
		}
		
		bus100.showInfo();
		
		//unreachable code : for,while������ ���ؼ� �� �ڵ带 ������ ���� ��Ȳ
		
		
		dael.takeBus(bus200);
		dael.showInfo();
		bus200.showInfo();
		

	}

}
