package egovframework.user.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.user.dao.UserDAO;
import egovframework.user.service.UserService;
import egovframework.user.vo.PartVO;
import egovframework.user.vo.PosVO;
import egovframework.user.vo.UserVO;

@Service("userService")
public class UserServiceImpl extends EgovAbstractServiceImpl implements UserService{

	@Resource(name="userDAO")
	private UserDAO userDAO;

	// 로그인
	@Override
	public UserVO userLogin(UserVO userVO) throws Exception {
		return userDAO.userLogin(userVO);
	}
	
	// 회원가입
	@Override
	public int userJoin(UserVO userVO) throws Exception {
		return userDAO.userJoin(userVO);
	}

	@Override
	public String loginpw(UserVO userVO) throws Exception {
		return userDAO.loginpw(userVO);
	}
	
	// 개인 정보 수정
	@Override
	public int userUpdate(UserVO userVO) throws Exception {
		return userDAO.userUpdate(userVO);
	}
	
	
	@Override
	public int imgDelete(UserVO _userVO) throws Exception {
		return userDAO.imgDelete(_userVO);
	}
	
	
	@Override
	public List<PartVO> partLst(PartVO partVO) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.partLst(partVO);
	}

	@Override
	public int partCnt(PartVO partVO) {
		return userDAO.partCnt(partVO);
	}

	
	@Override
	public PartVO partSel(PartVO partVO) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.partSel(partVO);
	}
	
	@Override
	public int partIns(PartVO partVO) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.partIns(partVO);
	}
	
	@Override
	public int partUpd(PartVO partVO) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.partUpd(partVO);
	}

	@Override
	public int partDel(PartVO partVO) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.partDel(partVO);
	}
	
	
	@Override
	public List<PosVO> posLst(PosVO posVO) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.posLst(posVO);
	}

	@Override
	public int posCnt(PosVO posVO) {
		// TODO Auto-generated method stub
		return userDAO.posCnt(posVO);
	}


	@Override
	public PosVO posSel(PosVO posVO) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.posSel(posVO);
	}

	@Override
	public int posIns(PosVO posVO) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.posIns(posVO);
	}

	@Override
	public int posUpd(PosVO posVO) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.posUpd(posVO);
	}

	@Override
	public int posDel(PosVO posVO) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.posDel(posVO);
	}


}
