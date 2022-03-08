package Test;

import java.util.ArrayList;

public class TakeEX {

	public static void main(String[] args) {
		
		Bus bus = new Bus(100);
		Subway subway = new Subway("Green");
		ArrayList<Student> passenger = new ArrayList<Student>();
		
		String name = "";
		for(int i = 0; i < 500; i++) {
			name = String.format("passenger %d", i);
			passenger.add(new Student(name, 0));	
		}
		
		Student student;
		
		for(int j = 0; j<24; j++) {
			student = passenger.remove(0);
			student.takeBus(bus);
			System.out.println(student.name);
		}
		
		System.out.println("남은 학생 수: " + passenger.size());
		
		for(int i = 0; i<350; i++) {
			student = passenger.remove(0);
			student.takeSubway(subway);
			System.out.println(student.name);
		}
		
		System.out.println("남은 학생 수: " + passenger.size());
		System.out.println("==============================================================================");
		System.out.println("BusNumber: " + bus.busNumber);
		System.out.println("SubwayLineNumber: " + subway.lineNumber);

	}

}
