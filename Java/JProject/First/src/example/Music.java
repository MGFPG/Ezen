package example;

public class Music {
	
	String name="";
	String singer="";
	int price=0;
	int num=0;
	
	public Music(String name, String singer) {
		this.name = name;
		this.singer = singer;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getPrice() {
		return this.name;
	}

}
