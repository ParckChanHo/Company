package file;

public class FileDTO {
	String m_fileFullPath; // 업로드한 파일의 전체 경로를 DB에 저장하기 위함

	public String getM_fileFullPath() {
		return m_fileFullPath;
	}

	public void setM_fileFullPath(String m_fileFullPath) {
		this.m_fileFullPath = m_fileFullPath;
	}
	
	
}
