package file;

public class FileDTO {
	 String fileName; /* 사용자가 업로드한 파일 이름*/
	 String fileRealName; /* 실제로 서버에 업로드가 된 파일 이름*/
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileRealName() {
		return fileRealName;
	}
	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	
	public FileDTO(String fileName, String fileRealName) {
		super();
		this.fileName = fileName;
		this.fileRealName = fileRealName;
	} 
}
