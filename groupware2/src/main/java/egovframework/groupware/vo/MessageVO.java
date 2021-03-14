package egovframework.groupware.vo;

import java.sql.Timestamp;

import egovframework.common.vo.SearchVO;

public class MessageVO extends SearchVO{
	private String msgId;
	private String message;
	private String senderId;
	private String receiverId;
	private String sender;
	private String receiver;
	private Timestamp sndDate;
	private Timestamp rcvDate;
	private Timestamp delDate;
	private String rcvYn;
	private String delYn;
	
	public String getMsgId() {
		return msgId;
	}
	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}
	
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	
	
	public String getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}

	
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	
	
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	
	
	public Timestamp getSndDate() {
		return sndDate;
	}
	public void setSndDate(Timestamp sndDate) {
		this.sndDate = sndDate;
	}
	
	
	public Timestamp getRcvDate() {
		return rcvDate;
	}
	public void setRcvDate(Timestamp rcvDate) {
		this.rcvDate = rcvDate;
	}
	
	
	public Timestamp getDelDate() {
		return delDate;
	}
	public void setDelDate(Timestamp delDate) {
		this.delDate = delDate;
	}
	
	
	public String getRcvYn() {
		return rcvYn;
	}
	public void setRcvYn(String rcvYn) {
		this.rcvYn = rcvYn;
	}
	
	
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	
	
}
