package json;
import java.util.ArrayList;
import java.sql.*;

public class JsonDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "scott";
	String pw = "1234";
	
	public JsonDAO() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<JsonDTO> select(){
		ArrayList<JsonDTO> list = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet res = null;
		
		try {
			list = new ArrayList<JsonDTO>();
			con = DriverManager.getConnection(url, id, pw);
			String sql = "SELECT * FROM json";
			pstmt = con.prepareStatement(sql);
			res = pstmt.executeQuery();
			while (res.next()) {
				String userId = res.getString("userId");
				String password = res.getString("password");

				JsonDTO dto = new JsonDTO(userId, password);
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(res != null) res.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return list;
	}
	
}
