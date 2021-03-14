package egovframework.groupware.service;

import java.util.List;

import egovframework.groupware.vo.SignIdVO;
import egovframework.groupware.vo.SignVO;

public interface SignService {
	
	public List<SignVO> signIngLst(SignVO _vo);
	
	public int signLstCnt(SignVO _vo);

	public List<SignVO> signReqLst(SignVO _vo);
	
	public int signReqLstCnt(SignVO _vo);

	public List<SignVO> signFnlReqLst(SignVO _vo);
	
	public int signFnlReqLstCnt(SignVO _vo);
	
	public List<SignVO> signDoneLst(SignVO _vo);

	public int signDoneLstCnt(SignVO _vo);

	public SignVO signSel(SignVO vo);
	
	public int signWrt(SignVO vo) throws Exception;
	
	
	public List<SignIdVO> signidLst(SignIdVO _vo);
	
	public int signidCnt(SignIdVO _vo);

	public int acpSign(SignVO vo);

	public int acpfnlSign(SignVO vo);
	
	public int returnSign(SignVO vo);
	
}
