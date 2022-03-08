package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://192.168.0.28:3306/ezen?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "oracle1234!@";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 嚥≪뮄�젃占쎌뵥 占쎄쉐�⑨옙
				} else {
					return 0; // �뜮袁⑨옙甕곕뜇�깈 �겫�뜆�뵬燁삼옙
				}
			} 
			return -1; // 占쎈툡占쎌뵠占쎈탵揶쏉옙 占쎈씨占쎌벉
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return -2; // 占쎈쑓占쎌뵠占쎄숲甕곗쥙�뵠占쎈뮞 占쎌궎�몴占�
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
