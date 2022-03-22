package file;

import java.sql.*;
import file.FileDTO;

public class FileDAO {
	private Connection conn;
	private ResultSet rs;
	
	public FileDAO() {
		try {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String id = "scott";
			String pw = "1234";
			Class.forName(driver);
			conn = DriverManager.getConnection(url,id,pw);
		} catch(Exception e) {
			e.printStackTrace();
		}

	}

	public int upload(String m_fileFullPath) {
		String sql = "insert into fileTable values(?)";
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_fileFullPath);
	
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return -1; // 오류가 발생할 떄
	} // end upload()
	
	public FileDTO show(String fileName) {
		String sql="select * from fileTable where m_fileFullPath like ?";
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+fileName+"%");
	
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				FileDTO dto = new FileDTO();
				dto.setM_fileFullPath(rs.getString("m_fileFullPath"));
				
				return dto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return null; // 오류 발생
	}
	
	
	
	
	
	
}
