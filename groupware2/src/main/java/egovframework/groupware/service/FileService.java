package egovframework.groupware.service;

import java.util.List;

import egovframework.groupware.vo.FileVO;

public interface FileService {
	
	public List<FileVO> fileLst(FileVO fileVO);
	
	public void insertFile(FileVO fileVO);

	public int deleteFile(String string);


}
