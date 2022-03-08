import java.awt.Container;

import javax.swing.JFrame;
import java.awt.BorderLayout;
import java.awt.Container;

import javax.swing.JButton;


public class SwingEx01 extends JFrame{
	
	public SwingEx01() {
		Container mct = getContentPane();
		mct.setLayout(new BorderLayout(1, 10));
		mct.add(new JButton("Right"), BorderLayout.EAST);
		mct.add(new JButton("Left"), BorderLayout.WEST);
		mct.add(new JButton("top"), BorderLayout.NORTH);
		mct.add(new JButton("bottom"), BorderLayout.SOUTH);
		mct.add(new JButton("center"), "Center");
	}
	public static void main(String[] args) {
		SwingEx01 my = new SwingEx01();
		my.setTitle("test");
		my.setSize(500,500);
		my.setVisible(true);
		my.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
}

