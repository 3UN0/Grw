package egovframework.groupware.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.groupware.vo.SignIdVO;
import egovframework.groupware.vo.SignVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("signDAO")
public class SignDAO extends EgovAbstractMapper{
	
	public List<SignVO> signIngLst(SignVO _vo){
		return selectList("SignDAO.signIngLst", _vo);
	}
	
	
	public int signLstCnt(SignVO _vo){
		return selectOne("SignDAO.signLstCnt", _vo);
	}

	
	public List<SignVO> signDoneLst(SignVO _vo){
		return selectList("SignDAO.signDoneLst", _vo);
	}


	public int signDoneLstCnt(SignVO _vo){
		return selectOne("SignDAO.signDoneLstCnt", _vo);
	}

	
	public List<SignVO> signReqLst(SignVO _vo){
		return selectList("SignDAO.signReqLst", _vo);
	}
	
	
	public int signReqLstCnt(SignVO _vo){
		return selectOne("SignDAO.signReqLstCnt", _vo);
	}

	
	public List<SignVO> signFnlReqLst(SignVO _vo){
		return selectList("SignDAO.signFnlReqLst", _vo);
	}
	
	
	public int signFnlReqLstCnt(SignVO _vo){
		return selectOne("SignDAO.signFnlReqLstCnt", _vo);
	}

	
	public SignVO signSel(SignVO vo) {
		return selectOne("SignDAO.signSel", vo);
	}
	
	public int signWrt(SignVO vo) {
		return insert("SignDAO.signWrt", vo);
	}
	

	public List<SignIdVO> signidLst(SignIdVO _vo){
		return selectList("SignDAO.signidLst", _vo);
	}
		
	
	public int signidCnt(SignIdVO _vo){
		return selectOne("SignDAO.signidCnt", _vo);
	}
	

	public int acpSign(SignVO vo) {
		return update("SignDAO.acpSign", vo);
	}


	public int acpfnlSign(SignVO vo) {
		return update("SignDAO.acpfnlSign", vo);
	}
	
	public int returnSign(SignVO vo) {
		return update("SignDAO.returnSign", vo);
	}
	
	


}
