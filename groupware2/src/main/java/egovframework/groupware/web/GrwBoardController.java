package egovframework.groupware.web;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.common.util.FileUtils;
import egovframework.common.util.HttpUtil;
import egovframework.common.util.ValidatorUtil;
import egovframework.common.vo.PagingInfo;
import egovframework.groupware.service.BoardService;
import egovframework.groupware.service.ComService;
import egovframework.groupware.service.FileService;
import egovframework.groupware.service.FileUploadService;
import egovframework.groupware.validate.GroupwareValidator;
import egovframework.groupware.vo.CommentVO;
import egovframework.groupware.vo.ContSearchVO;
import egovframework.groupware.vo.ContentVO;
import egovframework.groupware.vo.FileVO;
import egovframework.user.vo.UserVO;

@Controller
public class GrwBoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private FileService fileService;

	@Autowired
	private ComService comService;
	
	@Autowired
	private FileUploadService fileUploadService;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	
	// 글 목록 조회
	@GetMapping("/grw/board/brdLst.do")
	public String contSearchLst(ContSearchVO _contSearchVO, ModelMap _model) {
		_contSearchVO.setBrdId(_contSearchVO.getBrdId());

		PagingInfo pagingInfo = new PagingInfo(_contSearchVO);

		pagingInfo.setParameter(HttpUtil.getParameter("brdId", _contSearchVO));
		pagingInfo.setTotalRecord(boardService.contSearchCnt(_contSearchVO));
		pagingInfo.setDataList(boardService.contSearchLst(_contSearchVO));
		pagingInfo.setAction("/grw/board/brdLst.do?brdId=" + _contSearchVO.getBrdId() );
		
		_model.addAttribute("pagingInfo",	pagingInfo);

		return "grw.board.brdLst";
	}
	
	// 글 조회
	@GetMapping("/grw/board/contSel.do")
	public String contsel(ContentVO _contentVO, FileVO fileVO, CommentVO commentVO, ModelMap _model, HttpServletResponse response) {
		// 조회수 업데이트 
		boardService.hitsUpd(_contentVO);
		// 글 내용 조회
		ContentVO contSel = boardService.contSel(_contentVO);
		// 첨부파일 조회
		List<FileVO> filelst = boardService.fileLst(fileVO);
		
		_model.addAttribute("fileSel", filelst);
		_model.addAttribute("contSel", contSel);
		_model.addAttribute("comment", comService.comLst(commentVO));
		
		return "grw.board.contSel";
	}
	

	@GetMapping("/grw/board/contWrt.do")
	public String contWrt(ContSearchVO _contSearchVO, UserVO userVO) {
		return "grw.board.contWrt";
	}

	
	@GetMapping("/grw/board/contUpd.do")
	public String contUpd(ContentVO contentVO, FileVO fileVO, ModelMap _model) {
		ContentVO contUpd = boardService.contSel(contentVO);
		List<FileVO> filelst = boardService.fileLst(fileVO);
		
		_model.addAttribute("fileSel", filelst);
		_model.addAttribute("contUpd", contUpd);
		
		return "grw.board.contUpd";
	}
	
	
	@RequestMapping("/grw/download.do")
	public void fileDownload(ContentVO contentVO, FileVO fileVO, MultipartFile file, HttpServletResponse response) throws Exception{
		
		//ContentVO content = boardService.contSel(contentVO);
		FileVO filelist = boardService.fileSel(fileVO);

		//String originalFileName = content.getFileOriName();
		//String storedFileName = content.getFileName();
		String originalFileName = filelist.getOrigFileName();
		String storedFileName = filelist.getStoredFileName();
		
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		//byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\uploads\\"+storedFileName));
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\upload\\mp\\"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	
	@RequestMapping("/grw/fileDel.do")
	public String fileDel(ContentVO contentVO, FileVO fileVO, ModelMap _model) throws Exception {
		boardService.fileDel(fileVO);
		ContentVO contUpd = boardService.contSel(contentVO);
	
		_model.addAttribute("contUpd", contUpd);
		
		return "grw.board.contUpd";
	}
	
	

	@RequestMapping("/grw/fileDelete.do")
	public String imgDelete(ContentVO contentVO, ModelMap _model) throws Exception {
		boardService.fileDelete(contentVO);
		ContentVO contUpd = boardService.contSel(contentVO);
	
		_model.addAttribute("contUpd", contUpd);
		
		return "grw.board.contUpd";
	}
	
	/*
	@GetMapping("/grw/uploadForm.do")
	public void uploadAjax() {
		System.out.println("upload ajax");
	}
	*/
	
	// REST
	@RestController
	public class RestBoardController {

		// 등록
		@PostMapping("/grw/board/contWrt.do")
		public HashMap<String, Object> contWrtAJAX(ContentVO contentVO, BindingResult _result, MultipartFile[] uploadFile, MultipartHttpServletRequest request) throws Exception {
			
			contentVO.setBrdId(contentVO.getBrdId());
			contentVO.setContentId(contentVO.getContentId());	
			int result = boardService.contWrt(contentVO);
			
			List<FileVO> list = new ArrayList<>();

			String uploadFolder = "C:\\upload\\mp";
			
			// make folder ----------
			File uploadPath = new File(uploadFolder);
			System.out.println("upload path : " + uploadPath);
			
			if(uploadPath.exists()==false) {
				uploadPath.mkdirs();
			}
			
			for(MultipartFile multipartFile : uploadFile) {
				System.out.println("upload file");
				
				System.out.println("file name : " + multipartFile.getOriginalFilename());
				System.out.println("file size : " + multipartFile.getSize());
				
				FileVO fileVO = new FileVO();
				
				String uploadFilename = multipartFile.getOriginalFilename();
				uploadFilename = uploadFilename.substring(uploadFilename.lastIndexOf("\\")+1);
				UUID uuid = UUID.randomUUID();
				uploadFilename = uuid.toString() + "_" + uploadFilename;
				System.out.println("only file name : "+uploadFilename);
				
				try {
					File saveFile = new File(uploadPath, uploadFilename);
					multipartFile.transferTo(saveFile);
					
					fileVO.setContentId(contentVO.getContentId());
					fileVO.setFileId(fileVO.getFileId());
					fileVO.setOrigFileName(multipartFile.getOriginalFilename());
					fileVO.setStoredFileName(uploadFilename);
					fileVO.setFileSize(multipartFile.getSize());
					list.add(fileVO);
					
					System.out.println("filecont : " + fileVO.getContentId());
					
					fileService.insertFile(fileVO);

				} catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}
			
			return ValidatorUtil.resultSuccess(result);
		
		} 
		
		
		// 수정
		/*@PostMapping("/grw/board/contUpd.do")
		public HashMap<String, Object> contUpdAJAX(ContentVO contentVO, BindingResult _result, @RequestParam("fileUrl") MultipartFile file, MultipartHttpServletRequest request) throws Exception {
			new GroupwareValidator().validate(contentVO, _result);
			file = request.getFile("file");
			// System.out.println("file : "+file.getName());
			
			if(file.isEmpty() == false) {	// 첨부파일 추가
				System.out.println("첨부파일 있음");
				
				boardService.fileDelete(contentVO);

				String url = fileUploadService.restore(file);

				contentVO.setFileUrl(url);
				contentVO.setFileOriName(file.getOriginalFilename());
				contentVO.setFileName(contentVO.getFileUrl().substring(contentVO.getFileUrl().lastIndexOf("/")+1));
			} else {
				String requestName = file.getName();
				System.out.println("request : " + requestName);
				
				ContentVO contUpd = boardService.contSel(contentVO);
				contentVO.setFileUrl(contUpd.getFileUrl());
		
			}
			if(file != null) {
				System.out.println("첨부파일 없음");
			}
			
			int result = boardService.contUpd(contentVO);
			return ValidatorUtil.resultSuccess(result);
		}*/
		
		
		/*@PostMapping("/grw/board/contUpd.do")
		public HashMap<String, Object> contUpdAJAX(ContentVO contentVO, BindingResult _result, @RequestParam("fileUrl") MultipartFile file, MultipartHttpServletRequest Request) throws Exception {
			new GroupwareValidator().validate(contentVO, _result);
			
			if(file.isEmpty() == false) {	// 첨부파일 변경
				contentVO.setFileUrl(fileUploadService.restore(file));
				contentVO.setFileOriName(file.getOriginalFilename());
				contentVO.setFileName(contentVO.getFileUrl().substring(contentVO.getFileUrl().lastIndexOf("/")+1));
			} else {
				HttpSession session = Request.getSession();
				String userid = (String) session.getAttribute("userId");
				contentVO.setUserId(userid);
				
				ContentVO contUpd = boardService.contSel(contentVO);
				contentVO.setFileUrl(contUpd.getFileUrl());
			}
			
			int result = boardService.contUpd(contentVO);
			return ValidatorUtil.resultSuccess(result);
		}*/
		
		
		/*@PostMapping("/grw/board/contUpd.do")
		public HashMap<String, Object> contUpdAJAX2(ContentVO contentVO, BindingResult _result, MultipartFile[] uploadFile, MultipartHttpServletRequest request) throws Exception {
			new GroupwareValidator().validate(contentVO, _result);
			
			if(uploadFile.length) {	// 첨부파일 변경
				contentVO.setFileUrl(fileUploadService.restore(file));
				contentVO.setFileOriName(uploadFile.getOriginalFilename());
				contentVO.setFileName(contentVO.getFileUrl().substring(contentVO.getFileUrl().lastIndexOf("/")+1));
			} else {
				HttpSession session = request.getSession();
				String userid = (String) session.getAttribute("userId");
				contentVO.setUserId(userid);
				
				ContentVO contUpd = boardService.contSel(contentVO);
				contentVO.setFileUrl(contUpd.getFileUrl());
			}
			
			int result = boardService.contUpd(contentVO);
			return ValidatorUtil.resultSuccess(result);
		}*/
		
		
		@PostMapping("/grw/board/contUpd.do")
		public HashMap<String, Object> contUpdAJAX2(ContentVO contentVO, BindingResult _result, MultipartFile[] uploadFile, MultipartHttpServletRequest request) throws Exception {
			new GroupwareValidator().validate(contentVO, _result);
			
			fileService.deleteFile(contentVO.getContentId());
			
			if (uploadFile.length >0) {

				List<FileVO> list = new ArrayList<>();
	
				String uploadFolder = "C:\\upload\\mp";
				
				// make folder ----------
				File uploadPath = new File(uploadFolder);
				System.out.println("upload path : " + uploadPath);
				
				if(uploadPath.exists()==false) {
					uploadPath.mkdirs();
				}
				
				for(MultipartFile multipartFile : uploadFile) {
					System.out.println("upload file");
					
					System.out.println("file name : " + multipartFile.getOriginalFilename());
					System.out.println("file size : " + multipartFile.getSize());
					
					FileVO fileVO = new FileVO();
					
					String uploadFilename = multipartFile.getOriginalFilename();
					uploadFilename = uploadFilename.substring(uploadFilename.lastIndexOf("\\")+1);
					UUID uuid = UUID.randomUUID();
					uploadFilename = uuid.toString() + "_" + uploadFilename;
					System.out.println("only file name : "+uploadFilename);
					
					try {
						File saveFile = new File(uploadPath, uploadFilename);
						multipartFile.transferTo(saveFile);
						
						fileVO.setContentId(contentVO.getContentId());
						fileVO.setFileId(fileVO.getFileId());
						fileVO.setOrigFileName(multipartFile.getOriginalFilename());
						fileVO.setStoredFileName(uploadFilename);
						fileVO.setFileSize(multipartFile.getSize());
						list.add(fileVO);
						
						System.out.println("filecont : " + fileVO.getContentId());
						
						fileService.insertFile(fileVO);
	
					} catch(Exception e) {
						System.out.println(e.getMessage());
					}
				}
			
			}
			
			int result = boardService.contUpd(contentVO);

			return ValidatorUtil.resultSuccess(result);
		
		}
		
		
		// 삭제
		@PostMapping("/grw/board/contDel.do")
		public HashMap<String, Object> contDelAJAX(ContentVO contentVO) {
			
			int result = boardService.contDel(contentVO);
			return ValidatorUtil.resultSuccess(result);
		}
		
		
		
	}
	
}
	