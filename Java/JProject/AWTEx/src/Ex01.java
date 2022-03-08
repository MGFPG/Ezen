import java.awt.*;

class Ex01_sub extends Frame{ 
	private Button bt1 = new Button("bt1");
	private Button bt2 = new Button("bt2");
	private Button bt3 = new Button("bt3");
	
	private CardLayout cl = new CardLayout(); //CardLayout 생성

	public Ex01_sub(String title) {
		super(title); //제목을 가지는 프레임 생성
		super.setSize(500,300);
		this.init(); //화면초기화
		
		Dimension screen = Toolkit.getDefaultToolkit().getScreenSize();
		Dimension frm = super.getSize();
		int x_pos = (int)(screen.getWidth()/2-frm.getWidth()/2);
		int y_pos = (int)(screen.getHeight()/2-frm.getHeight()/2);
		super.setLocation(x_pos, y_pos);
		
		super.setVisible(true);
		
		//화면배치가 숨겨져 있어 시간간격을 두고 보기
		try {
			Thread.sleep(2000);
		}catch(InterruptedException e) {}
		cl.show(this, "bb"); //컴포넌트 이름으로 보여주기
		
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
		this.setLayout(cl); //프레임에 CardLayout 설정
		this.add("aa",bt1); 
		this.add("bb",bt2); //서로 겹쳐 있어서 bt1만 보임
		this.add("cc",bt3); //서로 겹쳐 있어서 bt1만 보임
	}
}

public class Ex01 {
	public static void main(String[] args) {
		new Ex01_sub("제목");
	}
}
