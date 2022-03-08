package example;

public class Salamander {
	
	String name="";
	String ScientificName=""; // 학명
	int tail=0;
	int legs=0;
	int len=0;  // 몸길이
	int eggs=0;
	int Ftoe=0; // 앞발가락은 4개
	int Btoe=0; // 뒷발가락은 5개
	String LC=""; // 멸종위기종
	String breeding="";
	String color="";
	String food="";  // 먹이
	String Kingdom=""; // 계
	String Phylum="";  // 문
	String cla="";  // 양서류를 뜻하는 강(class)의 의미
	String Order="";   // 목
	String Family="";  // 과
	String Genus="";   // 속
	String Species=""; // 종
	String live="";
	String ActivityHour="";
	
	public Salamander(String name, String ScientificName, String color, String food, String cla, String live, String Kingdom, String Phylum, String Order, 
		String Family, String Genus, String Species, String breeding, String LC, String ActivityHour) {
		this.cla = cla;
		this.color = color;
		this.food = food;
		this.name = name;
		this.breeding= breeding;
		this.Family = Family;
		this.Genus = Genus;
		this.Kingdom = Kingdom;
		this.Order = Order;
		this.Phylum = Phylum;
		this.ScientificName = ScientificName;
		this.Species = Species;
		this.LC = LC;
		this.ActivityHour = ActivityHour;
	}
	
	public void setBoby(int tail, int legs, int len, int eggs, int Ftoe, int Btoe) {
		this.legs = legs;
		this.tail = tail;
		this.len = len;
		this.eggs = eggs;
		this.Ftoe = Ftoe;
		this.Btoe = Btoe;
	}
	
	public String getBoby() {
		return this.name;
	}

}
