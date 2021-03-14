package egovframework.groupware.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.groupware.dao.ComDAO;
import egovframework.groupware.service.ComService;
import egovframework.groupware.vo.CommentVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("comService")
public class ComServiceImpl extends EgovAbstractServiceImpl implements ComService {

	@Resource(name="comDAO")
	private ComDAO comDAO;
	
	@Override
	public List<CommentVO> comLst(CommentVO commentVO) {
		return comDAO.comLst(commentVO);
	}

	@Override
	public int comWrt(CommentVO commentVO) {
		return comDAO.comWrt(commentVO);
	}

	@Override
	public int comUpd(CommentVO commentVO) {
		return comDAO.comUpd(commentVO);
	}

	@Override
	public int comDel(CommentVO commentVO) {
		return comDAO.comDel(commentVO);
	}

	
	
	
}
