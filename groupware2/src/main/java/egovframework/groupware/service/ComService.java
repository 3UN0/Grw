package egovframework.groupware.service;

import java.util.List;

import egovframework.groupware.vo.CommentVO;

public interface ComService {

	public List<CommentVO> comLst(CommentVO commentVO);
	
	public int comWrt(CommentVO commentVO);
	
	public int comUpd(CommentVO commentVO);
	
	public int comDel(CommentVO commentVO);
}
