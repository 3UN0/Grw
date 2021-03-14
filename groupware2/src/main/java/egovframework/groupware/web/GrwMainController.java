package egovframework.groupware.web;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import egovframework.common.vo.PagingInfo;
import egovframework.groupware.service.BoardService;
import egovframework.groupware.service.FileService;
import egovframework.groupware.service.MsgService;
import egovframework.groupware.vo.ContSearchVO;
import egovframework.groupware.vo.ContentVO;
import egovframework.groupware.vo.FileVO;
import egovframework.groupware.vo.MessageVO;

@Controller
public class GrwMainController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private FileService fileService;

	@Autowired
	private MsgService msgService;

	/*
	// 메인 출력
	@GetMapping("/grw/main/main.do")
	public String grwMain() {
		return "grw.main.main";
	}
*/
	@GetMapping("/grw/main/main.do")
	public String contSearchLst(ContSearchVO _contSearchVO, MessageVO messageVO, HttpServletRequest req, ModelMap _model) {
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userId");
		messageVO.setReceiverId(userid);
		_contSearchVO.setBrdId("00");

		PagingInfo pagingInfo = new PagingInfo(_contSearchVO);
		PagingInfo pagingInfo2 = new PagingInfo(messageVO);

		pagingInfo.setTotalRecord(boardService.contSearchCnt(_contSearchVO));
		pagingInfo.setDataList(boardService.contSearchLst(_contSearchVO));
		pagingInfo.setAction("/grw/board/brdLst.do?brdId=10" );

		pagingInfo2.setTotalRecord(msgService.rcvMsgLstCnt(messageVO));
		pagingInfo2.setDataList(msgService.rcvMsgLst(messageVO));
		pagingInfo2.setAction("/grw/msg/rcvMsgLst.do");

		_model.addAttribute("pagingInfo",	pagingInfo);
		_model.addAttribute("pagingInfo2",	pagingInfo2);

		return "grw.main.main";
	}	
	
	

	@GetMapping("/grw/main/uploadForm.do")
	public String uploadAjax() {
		System.out.println("upload ajax");
		
		return "grw.main.uploadForm";
	}

	
	@GetMapping("/grw/main/samplePage.do")
	public String sampleAjax() {
		
		return "grw.main.samplePage";
	}

	@GetMapping("/grw/main/samplePage2.do")
	public String sampleAjax2() {
		
		return "grw.main.samplePage2";
	}

	
	
	/*@PostMapping("/grw/main/uploadForm.do")
	public String uploadAjax(MultipartFile[] uploadFile, ModelMap model) {
		String uploadPath = "C:\\upload\\mp";
		
		for(MultipartFile multipartFile : uploadFile) {
			System.out.println("upload ajax");
			
			System.out.println("file name : " + multipartFile.getOriginalFilename());
			System.out.println("file size : " + multipartFile.getSize());
			
			File saveFile = new File(uploadPath, multipartFile.getOriginalFilename());
			
			try {
				multipartFile.transferTo(saveFile);
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return "grw.main.main";
	}
	*/
	
	@RestController
	public class Restmaincontroller{
		
		@PostMapping("/grw/main/uploadForm.do")
		public ResponseEntity<List<FileVO>> uploadAjax(ContentVO contentVO, MultipartFile[] uploadFile, ModelMap model) {
			contentVO.setBrdId("01");
			contentVO.setContentId(contentVO.getContentId());	

			System.out.println("글번호: " +contentVO.getContentId());
			List<FileVO> list = new ArrayList<>();
			
			String uploadFolder = "C:\\upload\\mp";
			
			// make folder ----------
			File uploadPath = new File(uploadFolder);
			System.out.println("upload path : " + uploadPath);
			
			if(uploadPath.exists()==false) {
				uploadPath.mkdirs();
			}
			
			
			for(MultipartFile multipartFile : uploadFile) {
				System.out.println("upload ajax");
				
				
				System.out.println("file name : " + multipartFile.getOriginalFilename());
				System.out.println("file size : " + multipartFile.getSize());
				
				FileVO fileVO = new FileVO();
				
				String uploadFilename = multipartFile.getOriginalFilename();
				
				uploadFilename = uploadFilename.substring(uploadFilename.lastIndexOf("\\")+1);
			//	fileVO.setOrigFileName(multipartFile.getOriginalFilename());
				
				UUID uuid = UUID.randomUUID();
				uploadFilename = uuid.toString() + "_" + uploadFilename;
				System.out.println("only file name : "+uploadFilename);
				
				try {
					File saveFile = new File(uploadPath, uploadFilename);
					multipartFile.transferTo(saveFile);
					
					contentVO.setBrdId("01");
					
					fileVO.setContentId(contentVO.getContentId());
					fileVO.setFileId(fileVO.getFileId());
					fileVO.setOrigFileName(multipartFile.getOriginalFilename());
					fileVO.setStoredFileName(uploadFilename);
					fileVO.setFileSize(multipartFile.getSize());
					list.add(fileVO);

					//fileService.insertFile(fileVO);

				} catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}
			return new ResponseEntity<>(list, HttpStatus.OK);
		}
		
	}
	
}
