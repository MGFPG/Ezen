package example;

public class Salamander {
	
	String name="";
	String ScientificName=""; // �и�
	int tail=0;
	int legs=0;
	int len=0;  // ������
	int eggs=0;
	int Ftoe=0; // �չ߰����� 4��
	int Btoe=0; // �޹߰����� 5��
	String LC=""; // ����������
	String breeding="";
	String color="";
	String food="";  // ����
	String Kingdom=""; // ��
	String Phylum="";  // ��
	String cla="";  // �缭���� ���ϴ� ��(class)�� �ǹ�
	String Order="";   // ��
	String Family="";  // ��
	String Genus="";   // ��
	String Species=""; // ��
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
