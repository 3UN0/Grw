package egovframework.groupware.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.groupware.vo.FileVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("fileDAO")
public class FileDAO extends EgovAbstractMapper{
	
	public List<FileVO> fileLst(FileVO fileVO){
		return selectList("BoardDAO.fileLst", fileVO);
	}
	
	public void insertFile(FileVO vo) {
		insert("BoardDAO.insertFile", vo);
	}
	
	public int deleteFile(String string) {
		return delete("BoardDAO.deleteFile", string);
	}
	
	public List<FileVO> findContId(String contentId) {
		return selectList("BoardDAO.fileLst", contentId);
	}

		
}
