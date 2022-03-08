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
			
			//remained_money = yearim.takeBus(bus100);  // 함수로 바로가기 하는 법: 커서를 두고 컨츠롤을 누른뒤 open declaration을 누른다.  
			
			//if(remained_money < bus100.charge) {
				//System.out.println("잔액이 부족합니다.");
				//break;
			//}
			
		//}
		
		//int persons;
		
		//while(true) {
			//persons = bus100.take(bus100.charge);
			
			//if(persons == bus100.capacity) {
				//System.out.println("만석입니다.");
				//break;
			//}
		//}
		
		while(true) {
			if(10 == bus100.mil) {
				System.out.println("주유완료");
				break;
			}
		}
		
		bus100.showInfo();
		
		//unreachable code : for,while문으로 인해서 이 코드를 수행할 없는 상황
		
		
		dael.takeBus(bus200);
		dael.showInfo();
		bus200.showInfo();
		

	}

}
