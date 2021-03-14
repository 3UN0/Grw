package egovframework.groupware.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.common.util.FileUtils;
import egovframework.groupware.dao.BoardDAO;
import egovframework.groupware.service.BoardService;
import egovframework.groupware.vo.ContSearchVO;
import egovframework.groupware.vo.ContentVO;
import egovframework.groupware.vo.FileVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("boardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {

	@Resource(name="boardDAO")
	private BoardDAO boardDAO;

	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;


	@Override
	public List<ContSearchVO> contSearchLst(ContSearchVO _contSearchVO){
		return boardDAO.contSearchLst(_contSearchVO);
	}

	@Override
	public int contSearchCnt(ContSearchVO _contSearchVO) {
		return boardDAO.contSearchCnt(_contSearchVO);
	}
	
	@Override
	public ContentVO contSel(ContentVO _contentVO) {
		return boardDAO.contSel(_contentVO);
	}

	@Override
	public int contWrt(ContentVO _contentVO) {
		// TODO Auto-generated method stub
		return boardDAO.contWrt(_contentVO);
	}

	/*@Override
	public int contWrt(ContentVO contentVO, MultipartHttpServletRequest mpRequest) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("========= 글1 : "+ contentVO.getContentId());

	//	contentVO.setBrdId(contentVO.getBrdId());
	//	contentVO.setContentId(contentVO.getContentId());	
	
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(contentVO, mpRequest);
		int size = list.size();
		for(int i=0;i<size;i++) {
		//	System.out.println("========= 글2 : "+ contentVO.getContentId());
		//	contentVO.setBrdId(contentVO.getBrdId());
		//	contentVO.setContentId(contentVO.getContentId());	
		
			boardDAO.insertFile(list.get(i));
		}
		return boardDAO.contWrt(contentVO);
	}*/
	
	
	
	@Override
	public int contUpd(ContentVO _contentVO) {
		// TODO Auto-generated method stub
		return boardDAO.contUpd(_contentVO);
	}

	@Override
	public int contDel(ContentVO _contentVO) {
		// TODO Auto-generated method stub
		return boardDAO.contDel(_contentVO);
	}
	
	@Override
	public int hitsUpd(ContentVO _vo) {
		return boardDAO.hitsUpd(_vo);
	}

	@Override
	public int fileDelete(ContentVO _contentVO) throws Exception {
		return boardDAO.fileDelete(_contentVO);
	}

	@Override
	public List<FileVO> fileLst(FileVO fileVO) {
		// TODO Auto-generated method stub
		return boardDAO.fileLst(fileVO);
	}
	
	@Override
	public FileVO fileSel(FileVO fileVO) {
		return boardDAO.fileSel(fileVO);
	}
	
	@Override
	public int fileDel(FileVO _VO) {
		return boardDAO.fileDel(_VO);
	}

	@Override
	public int deleteFile(FileVO _VO) {
		return boardDAO.deleteFile(_VO);
	}
	
	
}