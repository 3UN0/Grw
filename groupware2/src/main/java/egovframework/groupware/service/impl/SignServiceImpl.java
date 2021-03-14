package egovframework.groupware.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.groupware.dao.SignDAO;
import egovframework.groupware.service.SignService;
import egovframework.groupware.vo.SignIdVO;
import egovframework.groupware.vo.SignVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("signService")
public class SignServiceImpl extends EgovAbstractServiceImpl implements SignService {

	@Resource(name="signDAO")
	private SignDAO signDAO;

	
	@Override
	public List<SignVO> signIngLst(SignVO vo) {
		return signDAO.signIngLst(vo);
	}

	@Override
	public int signLstCnt(SignVO vo) {
		return signDAO.signLstCnt(vo);
	}
	
	@Override
	public List<SignVO> signReqLst(SignVO vo) {
		return signDAO.signReqLst(vo);
	}

	@Override
	public int signReqLstCnt(SignVO vo) {
		return signDAO.signReqLstCnt(vo);
	}

	@Override
	public List<SignVO> signFnlReqLst(SignVO vo) {
		return signDAO.signFnlReqLst(vo);
	}

	@Override
	public int signFnlReqLstCnt(SignVO vo) {
		return signDAO.signFnlReqLstCnt(vo);
	}

	@Override
	public List<SignVO> signDoneLst(SignVO vo) {
		return signDAO.signDoneLst(vo);
	}

	@Override
	public int signDoneLstCnt(SignVO vo) {
		return signDAO.signDoneLstCnt(vo);
	}
	
	@Override
	public SignVO signSel(SignVO vo) {
		return signDAO.signSel(vo);
	}
	
	
	@Override
	public int signWrt(SignVO vo) {
		return signDAO.signWrt(vo);
	}

	@Override
	public List<SignIdVO> signidLst(SignIdVO _vo) {
		return signDAO.signidLst(_vo);
	}

	@Override
	public int signidCnt(SignIdVO _vo) {
		return signDAO.signidCnt(_vo);
	}

	
	@Override
	public int acpSign(SignVO vo) {
		return signDAO.acpSign(vo);
	}

	
	@Override
	public int acpfnlSign(SignVO vo) {
		return signDAO.acpfnlSign(vo);
	}

	@Override
	public int returnSign(SignVO vo) {
		return signDAO.returnSign(vo);
	}


}
