package egovframework.groupware.vo;

import java.sql.Timestamp;

import egovframework.common.vo.SearchVO;

public class SignVO extends SearchVO{
	private String sid;
	private String signId;
	private String signname;
	private String title;
	private String userId;
	private String username;
	private String midnm;
	private String fnlnm;
	private String contents;
	private Timestamp regDate;
	private Timestamp modDate;
	private String midSign;
	private String fnlSign;
	private String acpId;
	private String acpname;
	
	
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	
	
	public String getSignId() {
		return signId;
	}
	public void setSignId(String signId) {
		this.signId = signId;
	}
	

	public String getSignname() {
		return signname;
	}
	public void setSignname(String signname) {
		this.signname = signname;
	}

	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
	public String getMidnm() {
		return midnm;
	}
	public void setMidnm(String midnm) {
		this.midnm = midnm;
	}
	
	
	public String getFnlnm() {
		return fnlnm;
	}
	public void setFnlnm(String fnlnm) {
		this.fnlnm = fnlnm;
	}

	
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
	
	public Timestamp getModDate() {
		return modDate;
	}
	public void setModDate(Timestamp modDate) {
		this.modDate = modDate;
	}
	
	
	public String getMidSign() {
		return midSign;
	}
	public void setMidSign(String midSign) {
		this.midSign = midSign;
	}
	
	
	public String getFnlSign() {
		return fnlSign;
	}
	public void setFnlSign(String fnlSign) {
		this.fnlSign = fnlSign;
	}
	
	
	public String getAcpId() {
		return acpId;
	}
	public void setAcpId(String acpId) {
		this.acpId = acpId;
	}

	
	public String getAcpname() {
		return acpname;
	}
	public void setAcpname(String acpname) {
		this.acpname = acpname;
	}
	
}
