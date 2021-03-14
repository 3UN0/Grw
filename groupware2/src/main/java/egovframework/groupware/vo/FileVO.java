package egovframework.groupware.vo;

import java.sql.Timestamp;

public class FileVO {
	private String fileId;
	private String contentId;
	private String origFileName;
	private String storedFileName;
	private float fileSize;
	private Timestamp regDate;
	private String delYn;
	
	
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	
	
	public String getContentId() {
		return contentId;
	}
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
	
	
	public String getOrigFileName() {
		return origFileName;
	}
	public void setOrigFileName(String origFileName) {
		this.origFileName = origFileName;
	}
	
	
	public String getStoredFileName() {
		return storedFileName;
	}
	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}
	
	
	public float getFileSize() {
		return fileSize;
	}
	public void setFileSize(float fileSize) {
		this.fileSize = fileSize;
	}
	
	
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
	
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	
}
