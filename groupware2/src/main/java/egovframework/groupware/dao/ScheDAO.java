package egovframework.groupware.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.groupware.vo.ScheVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("scheDAO")
public class ScheDAO extends EgovAbstractMapper {

	// 일정 목록
	public List<ScheVO> scheLst(Map map){
		return selectList("ScheDAO.scheLst", map);
	}
	
	public int scheWrt(ScheVO vo) {
		return insert("ScheDAO.scheWrt", vo);
	}
	
	public ScheVO scheSel(ScheVO vo) {
		return selectOne("ScheDAO.scheSel", vo);
	}
	
	public int scheUpd(ScheVO vo) {
		return update("ScheDAO.scheUpd", vo);
	}

	public int scheDel(ScheVO vo) {
		return delete("ScheDAO.scheDel", vo);
	}
	
}
