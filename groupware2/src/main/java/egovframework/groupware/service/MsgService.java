package egovframework.groupware.service;

import java.util.List;

import egovframework.groupware.vo.MessageVO;

public interface MsgService {
	
	public List<MessageVO> rcvMsgLst(MessageVO _vo);

	public int rcvMsgLstCnt(MessageVO _vo);
	
	public List<MessageVO> sndMsgLst(MessageVO _vo);
		
	public int sndMsgLstCnt(MessageVO _vo);

	public MessageVO msgSel(MessageVO _vo);
	
	public int msgUpd(MessageVO _vo);

	public int msgWrt(MessageVO _vo);
	
	public int msgDel(MessageVO _vo);
	
}
