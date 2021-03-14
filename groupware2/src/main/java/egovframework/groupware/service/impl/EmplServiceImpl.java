package egovframework.groupware.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.groupware.service.EmplService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.user.dao.UserDAO;
import egovframework.user.vo.UserSearchVO;
import egovframework.user.vo.UserVO;

@Service("emplService")
public class EmplServiceImpl extends EgovAbstractServiceImpl implements EmplService {

	@Resource(name="userDAO")
	private UserDAO userDAO;
	
	@Override
	public List<UserSearchVO> emplSearchLst(UserSearchVO _userSearchVO){
		return userDAO.emplSearchLst(_userSearchVO);
	}

	@Override
	public int emplSearchCnt(UserSearchVO _userSearchVO) {
		return userDAO.emplSearchCnt(_userSearchVO);
	}

	@Override
	public List<UserVO> emplList(UserVO userVO) {
		return userDAO.emplList(userVO);
	}
	
	@Override
	public UserVO emplSel(UserVO _userVO){
		return userDAO.emplSel(_userVO);
	}

	@Override
	public int emplIns(UserVO _userVO) {
		return userDAO.emplIns(_userVO);
	}
	
	@Override
	public int emplUpd(UserVO _userVO){
		return userDAO.emplUpd(_userVO);
	}

	@Override
	public int emplDel(UserVO _userVO) {
		return userDAO.emplDel(_userVO);
	}

	
	
}
