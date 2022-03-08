package example;

public class Book {
	
	String bookname="";
	int price = 0;
	String name="";
	
	public Book(String bookname, String name) {
		this.bookname = bookname;
		this.name = name;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getPrice() {
		return this.bookname;
	}

}
