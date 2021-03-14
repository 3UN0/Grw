package egovframework.groupware.service;

import java.util.List;
import java.util.Map;

import egovframework.groupware.vo.ScheVO;

public interface ScheService {
	
	public List<ScheVO> scheLst(Map map);

	public int scheWrt(ScheVO vo);
	
	public ScheVO scheSel(ScheVO vo);
	
	public int scheUpd(ScheVO vo);
	
	public int scheDel(ScheVO vo);

}
