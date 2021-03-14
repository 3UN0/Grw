package egovframework.groupware.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.groupware.dao.FileDAO;
import egovframework.groupware.service.FileService;
import egovframework.groupware.vo.FileVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("fileService")
public class FileServiceImpl extends EgovAbstractServiceImpl implements FileService {

	@Resource(name="fileDAO")
	private FileDAO fileDAO;

	
	
	@Override
	public List<FileVO> fileLst(FileVO fileVO) {
		// TODO Auto-generated method stub
		return fileDAO.fileLst(fileVO);
	}
	
	
	@Override
	public void insertFile(FileVO fileVO) {
		fileDAO.insertFile(fileVO);
	}



	@Override
	public int deleteFile(String string) {
		// TODO Auto-generated method stub
		return fileDAO.deleteFile(string);
	}


}
