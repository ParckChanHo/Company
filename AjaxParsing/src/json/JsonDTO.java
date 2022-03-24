package json;

public class JsonDTO {
	String userId;
	String passWord;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	
	public JsonDTO(String userId, String passWord) {
		this.userId = userId;
		this.passWord = passWord;
	}
		
}