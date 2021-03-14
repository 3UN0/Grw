package egovframework.groupware.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.groupware.vo.ContSearchVO;
import egovframework.groupware.vo.ContentVO;
import egovframework.groupware.vo.FileVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("boardDAO")
public class BoardDAO extends EgovAbstractMapper{

	// 글 목록
	public List<ContSearchVO> contSearchLst(ContSearchVO _vo){
		return selectList("BoardDAO.contSearchLst", _vo);
	}
	
	// 글 목록 갯수
	public int contSearchCnt(ContSearchVO _vo){
		return selectOne("BoardDAO.contSearchCnt", _vo);
	}

	public ContentVO contSel(ContentVO _vo){
		return selectOne("BoardDAO.contSel", _vo);
	}
	
	/*public int contWrt(ContentVO _vo) {
		return insert("BoardDAO.contWrt", _vo);
	}*/
	
	public int contWrt(ContentVO _vo) {
		return insert("BoardDAO.contWrt", _vo);
	}
	
	public int contUpd(ContentVO _vo) {
		return update("BoardDAO.contUpd", _vo);
	}
	
	public int contDel(ContentVO _vo) {
		return delete("BoardDAO.contDel", _vo);
	}

	public int hitsUpd(ContentVO _vo) {
		return update("BoardDAO.hitsUpd", _vo);
	}
	
	
	public List<FileVO> fileLst(FileVO fileVO){
		return selectList("BoardDAO.fileLst", fileVO);
	}
	
	public FileVO fileSel(FileVO _vo){
		return selectOne("BoardDAO.fileSel", _vo);
	}
	
	public int fileDel(FileVO vo) {
		return update("BoardDAO.fileDel", vo);
	}
	
	public void insertFile(Map<String, Object> map) throws Exception{
		insert("BoardDAO.insertFile", map);
	}
	
	
	public int fileDelete(ContentVO _vo) {
		return delete("BoardDAO.fileDelete", _vo);
	}

	public int deleteFile(FileVO vo) {
		// TODO Auto-generated method stub
		return delete("BoardDAO.deleteFile", vo);
	}
	
}

