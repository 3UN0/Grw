package egovframework.groupware.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.groupware.dao.ScheDAO;
import egovframework.groupware.service.ScheService;
import egovframework.groupware.vo.ScheVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("scheService")
public class ScheServiceImpl extends EgovAbstractServiceImpl implements ScheService {


	@Resource(name="scheDAO")
	private ScheDAO scheDAO;
	
	
	@Override
	public List<ScheVO> scheLst(Map map) {
		return scheDAO.scheLst(map);
	}


	@Override
	public int scheWrt(ScheVO vo) {
		return scheDAO.scheWrt(vo);
	}


	@Override
	public ScheVO scheSel(ScheVO vo) {
		// TODO Auto-generated method stub
		return scheDAO.scheSel(vo);
	}


	@Override
	public int scheUpd(ScheVO vo) {
		// TODO Auto-generated method stub
		return scheDAO.scheUpd(vo);
	}


	@Override
	public int scheDel(ScheVO vo) {
		// TODO Auto-generated method stub
		return scheDAO.scheDel(vo);
	}

}
