package egovframework.groupware.service;

import java.util.List;

import egovframework.user.vo.UserSearchVO;
import egovframework.user.vo.UserVO;

public interface EmplService {
	
	public List<UserSearchVO> emplSearchLst(UserSearchVO _vo);
	
	public int emplSearchCnt(UserSearchVO _vo);

	public List<UserVO> emplList(UserVO userVO);
	
	public UserVO emplSel(UserVO _vo);

	public int emplIns(UserVO _vo);
	
	public int emplUpd(UserVO _vo);

	public int emplDel(UserVO _vo);
	


}
