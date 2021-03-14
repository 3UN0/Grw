package egovframework.groupware.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.groupware.dao.MsgDAO;
import egovframework.groupware.service.MsgService;
import egovframework.groupware.vo.MessageVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("msgService")
public class MsgServiceImpl extends EgovAbstractServiceImpl implements MsgService {

	@Resource(name="msgDAO")
	private MsgDAO msgDAO;

	@Override
	public List<MessageVO> rcvMsgLst(MessageVO _vo) {
		return msgDAO.rcvMsgLst(_vo);
	}

	@Override
	public int rcvMsgLstCnt(MessageVO _vo) {
		return msgDAO.rcvMsgLstCnt(_vo);
	}
	
	@Override
	public List<MessageVO> sndMsgLst(MessageVO _vo) {
		return msgDAO.sndMsgLst(_vo);
	}

	@Override
	public int sndMsgLstCnt(MessageVO _vo) {
		return msgDAO.sndMsgLstCnt(_vo);
	}

	@Override
	public MessageVO msgSel(MessageVO _vo) {
		return msgDAO.msgSel(_vo);
	}

	@Override
	public int msgUpd(MessageVO _vo) {
		return msgDAO.msgUpd(_vo);
	}

	@Override
	public int msgWrt(MessageVO _vo) {
		return msgDAO.msgWrt(_vo);
	}

	@Override
	public int msgDel(MessageVO _vo) {
		return msgDAO.msgDel(_vo);
	}

	
}
