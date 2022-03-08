import java.awt.*;

class Ex01_sub extends Frame{ 
	private Button bt1 = new Button("bt1");
	private Button bt2 = new Button("bt2");
	private Button bt3 = new Button("bt3");
	
	private CardLayout cl = new CardLayout(); //CardLayout ����

	public Ex01_sub(String title) {
		super(title); //������ ������ ������ ����
		super.setSize(500,300);
		this.init(); //ȭ���ʱ�ȭ
		
		Dimension screen = Toolkit.getDefaultToolkit().getScreenSize();
		Dimension frm = super.getSize();
		int x_pos = (int)(screen.getWidth()/2-frm.getWidth()/2);
		int y_pos = (int)(screen.getHeight()/2-frm.getHeight()/2);
		super.setLocation(x_pos, y_pos);
		
		super.setVisible(true);
		
		//ȭ���ġ�� ������ �־� �ð������� �ΰ� ����
		try {
			Thread.sleep(2000);
		}catch(InterruptedException e) {}
		cl.show(this, "bb"); //������Ʈ �̸����� �����ֱ�
		
		try {
			Thread.sleep(2000);
		}catch(InterruptedException e) {}
		cl.show(this, "cc");
		
		try {
			Thread.sleep(2000);
		}catch(InterruptedException e) {}
		cl.show(this, "aa");
	}
	
	public void init() {
		this.setLayout(cl); //�����ӿ� CardLayout ����
		this.add("aa",bt1); 
		this.add("bb",bt2); //���� ���� �־ bt1�� ����
		this.add("cc",bt3); //���� ���� �־ bt1�� ����
	}
}

public class Ex01 {
	public static void main(String[] args) {
		new Ex01_sub("����");
	}
}
