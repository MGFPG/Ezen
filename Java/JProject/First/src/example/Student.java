package example;

//3���� üũ 1. Ŭ���� �̸� 2. ���� �̸� 3. ������ �̸� �� ��� ���ƾ� �Ѵ�! 

public class Student {
	
	String Name;
	int grade;
	String address;
	int Age;
	boolean gender;
	
	public Student(String name, int age, boolean gender) { //�����ڰ� ��� ��������� �����ڷ� ���� �ʿ�� ����
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
// ���ϰ��� ���� �� void