package egovframework.user.service;

import java.util.List;

import egovframework.user.vo.PartVO;
import egovframework.user.vo.PosVO;
import egovframework.user.vo.UserSearchVO;
import egovframework.user.vo.UserVO;

public interface UserService {
	
	// 로그인
	public UserVO userLogin(UserVO userVO) throws Exception;
	
	// 회원가입
	public int userJoin(UserVO userVO) throws Exception;
	
	public String loginpw(UserVO userVO) throws Exception;
	
	// 개인 정보 수정
	public int userUpdate(UserVO userVO) throws Exception;
	
	// 이미지 삭제
	public int imgDelete(UserVO _userVO) throws Exception;

	
	// 부서 목록
	public List<PartVO> partLst(PartVO partVO) throws Exception;

	public int partCnt(PartVO partVO);

	public PartVO partSel(PartVO partVO) throws Exception;
	
	public int partIns(PartVO partVO) throws Exception;
	
	public int partUpd(PartVO partVO) throws Exception;
	
	public int partDel(PartVO partVO) throws Exception;

	//직급 목록
	public List<PosVO> posLst(PosVO posVO) throws Exception;

	public int posCnt(PosVO posVO);

	public PosVO posSel(PosVO posVO) throws Exception;
	
	public int posIns(PosVO posVO) throws Exception;
	
	public int posUpd(PosVO posVO) throws Exception;
	
	public int posDel(PosVO posVO) throws Exception;

	
}
