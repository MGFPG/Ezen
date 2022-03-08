package example;

public class StudentEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Student student = new Student("Yearim",25,true);
		
		student.setStudentName("Yearim Lim");
		String newname = student.getStudentName();
		System.out.println(newname);
		int age = student.getAge();
		System.out.println(age);
	}

}
