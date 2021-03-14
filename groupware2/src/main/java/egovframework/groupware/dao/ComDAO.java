package egovframework.groupware.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.groupware.vo.CommentVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("comDAO")
public class ComDAO extends EgovAbstractMapper{
	
	// 댓글 목록
	public List<CommentVO> comLst(CommentVO vo) {
		return selectList("ComDAO.comLst", vo);
	}
	
	public int comWrt(CommentVO vo) {
		return insert("ComDAO.comWrt", vo);
	}
	
	public int comUpd(CommentVO vo) {
		return update("ComDAO.comUpd", vo);
	}
	
	public int comDel(CommentVO vo) {
		return delete("ComDAO.comDel", vo);
	}
	
	
}
