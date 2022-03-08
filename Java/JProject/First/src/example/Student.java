package example;

//3가지 체크 1. 클래스 이름 2. 파일 이름 3. 생성자 이름 이 모두 같아야 한다! 

public class Student {
	
	String Name;
	int grade;
	String address;
	int Age;
	boolean gender;
	
	public Student(String name, int age, boolean gender) { //생성자가 모든 멤버변수를 생성자로 만들 필요는 없다
		this.Name =name;
		this.Age = age;
		this.gender=gender;
	}

	public String getStudentName() {
		return this.Name;
	}
	
	public int getAge() {
		return this.Age;
	}
	

	public void setStudentName(String name) {
		this.Name = name;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
}
// 리턴값이 없을 떄 void