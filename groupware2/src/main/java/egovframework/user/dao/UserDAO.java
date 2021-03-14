package egovframework.user.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import egovframework.sample.vo.SampleSearchVO;
import egovframework.sample.vo.SampleVO;
import egovframework.user.vo.PartVO;
import egovframework.user.vo.PosVO;
import egovframework.user.vo.UserSearchVO;
import egovframework.user.vo.UserVO;

@Repository("userDAO")
public class UserDAO extends EgovAbstractMapper{
	
	// 사원 목록_검색
	public List<UserSearchVO> emplSearchLst(UserSearchVO _vo){
		return selectList("UserDAO.emplSearchLst", _vo);
	}
	
	// 사원 목록_검색 카운트
	public int emplSearchCnt(UserSearchVO _vo){
		return selectOne("UserDAO.emplSearchCnt", _vo);
	}
	

	// 사원 목록
	public List<UserVO> emplList(UserVO userVO) {
		// TODO Auto-generated method stub
		return selectList("UserDAO.emplList", userVO);
	}
	
	// 사원 상세 조회
	public UserVO emplSel(UserVO _vo){
		return selectOne("UserDAO.emplSel", _vo);
	}
	
	// 입력
	public int emplIns(UserVO _vo) {
		return insert("UserDAO.emplIns", _vo);
	}

	// 수정
	public int emplUpd(UserVO _vo) {
		return update("UserDAO.emplUpd", _vo);
	}
	
	// 삭제
	public int emplDel(UserVO _vo) {
		return delete("UserDAO.emplDel", _vo);
	}
	
	// 로그인
	public UserVO userLogin(UserVO userVO) throws Exception{
		return selectOne("UserDAO.userLogin", userVO);
	}
	
	// 회원 가입
	public int userJoin(UserVO userVO) throws Exception{
		return insert("UserDAO.userJoin", userVO);
	}

	// 비번
	public String loginpw(UserVO userVO) throws Exception{
		return selectOne("UserDAO.loginpw", userVO);
	}
	
	// 개인 정보 수정
	public int userUpdate(UserVO userVO) throws Exception {
		return update("UserDAO.userUpdate", userVO);
	}
	
	
	public int imgDelete(UserVO userVO) {
		return delete("UserDAO.imgDelete", userVO);
	}
	
	
	// 부서 관리
	public List<PartVO> partLst(PartVO partVO) {
		return selectList("UserDAO.partLst", partVO);
	}

	public int partCnt(PartVO partVO) {
		return selectOne("UserDAO.partCnt", partVO);
	}
	
	
	public PartVO partSel(PartVO partVO){
		return selectOne("UserDAO.partSel", partVO);
	}
	
	public int partIns(PartVO partVO) throws Exception {
		return insert("UserDAO.partIns", partVO);
	}
	
	
	public int partUpd(PartVO partVO) throws Exception{
		return update("UserDAO.partUpd", partVO);
	}
	

	public int partDel(PartVO partVO) throws Exception{
		return delete("UserDAO.partDel", partVO);
	}
	
	// 직급 관리
	public List<PosVO> posLst(PosVO posVO) {
		return selectList("UserDAO.posLst", posVO);
	}
	
	public int posCnt(PosVO posVO) {
		return selectOne("UserDAO.posCnt", posVO);
	}
	
	public PosVO posSel(PosVO posVO){
		return selectOne("UserDAO.posSel", posVO);
	}
	
	public int posIns(PosVO posVO) throws Exception {
		return insert("UserDAO.posIns", posVO);
	}
	
	
	public int posUpd(PosVO posVO) throws Exception{
		return update("UserDAO.posUpd", posVO);
	}
	

	public int posDel(PosVO posVO) throws Exception{
		return delete("UserDAO.posDel", posVO);
	}
	
}
