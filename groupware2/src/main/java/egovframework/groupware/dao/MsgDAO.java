package egovframework.groupware.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.groupware.vo.MessageVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("msgDAO")
public class MsgDAO extends EgovAbstractMapper{

	// 받은 쪽지 목록
	public List<MessageVO> rcvMsgLst(MessageVO _vo){
		return selectList("MsgDAO.rcvMsgLst", _vo);
	}
	
	// 받은 쪽지 갯수
	public int rcvMsgLstCnt(MessageVO _vo){
		return selectOne("MsgDAO.rcvMsgLstCnt", _vo);
	}
	
	// 보낸 쪽지 목록
	public List<MessageVO> sndMsgLst(MessageVO _vo){
		return selectList("MsgDAO.sndMsgLst", _vo);
	}
	
	// 보낸 쪽지 갯수
	public int sndMsgLstCnt(MessageVO _vo){
		return selectOne("MsgDAO.sndMsgLstCnt", _vo);
	}
	
	public MessageVO msgSel(MessageVO _vo) {
		return selectOne("MsgDAO.msgSel", _vo);
	}
	
	public int msgUpd(MessageVO _vo) {
		return update("MsgDAO.msgUpd", _vo);
	}
	
	public int msgWrt(MessageVO _vo	) {
		return insert("MsgDAO.msgWrt", _vo);
	}

	public int msgDel(MessageVO _vo	) {
		return insert("MsgDAO.msgDel", _vo);
	}
}

