package PraticeEX;

public class Student {
	
	private String className;
	private int studentID;
	
	public Student(String className, int studentID) {
		this.className = className;
		this.studentID = studentID;
	}
	

	public String getClassName() {
		return className;
	}


	public void setClassName(String className) {
		this.className = className;
	}


	public int getStudentID() {
		return studentID;
	}


	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}


	public static void main(String[] args) {
		Student student = new Student("IT", 20211104);
		
		System.out.println(student.className);
		System.out.println(student.studentID);

	}

}
