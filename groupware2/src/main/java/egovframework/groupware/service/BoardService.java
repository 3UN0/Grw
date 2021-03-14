package egovframework.groupware.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.groupware.vo.ContSearchVO;
import egovframework.groupware.vo.ContentVO;
import egovframework.groupware.vo.FileVO;

public interface BoardService {

	public List<ContSearchVO> contSearchLst(ContSearchVO _vo);
	
	public int contSearchCnt(ContSearchVO _vo);
	
	public ContentVO contSel(ContentVO _vo);

	public int contWrt(ContentVO _vo);

//	public int contWrt(ContentVO _vo, MultipartHttpServletRequest mpRequest) throws Exception;

	public int contUpd(ContentVO _vo);

	public int contDel(ContentVO _vo);
	
	public int hitsUpd(ContentVO _vo);
	
	public int fileDelete(ContentVO _vo) throws Exception;
	
	public List<FileVO> fileLst(FileVO fileVO);
	
	public FileVO fileSel(FileVO _vo);

	public int fileDel(FileVO _vo);
	
	public int deleteFile(FileVO vo);

}
