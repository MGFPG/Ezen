package chapter8;

public class Company {
	
	public Company() {}
	
	private static Company instance = new Company();

	public static Company getInstance() {
		
		if (instance == null) {
			instance = new Company();
		}
		
		return instance;
	}
	
}
