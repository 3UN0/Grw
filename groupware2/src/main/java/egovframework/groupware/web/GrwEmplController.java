package egovframework.groupware.web;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.common.util.ValidatorUtil;
import egovframework.common.vo.PagingInfo;
import egovframework.groupware.service.EmplService;
import egovframework.groupware.service.FileUploadService;
import egovframework.groupware.validate.GroupwareValidator;
import egovframework.groupware.validate.UserValidator;
import egovframework.user.service.UserService;
import egovframework.user.vo.PartVO;
import egovframework.user.vo.PosVO;
import egovframework.user.vo.UserSearchVO;
import egovframework.user.vo.UserVO;

@Controller
public class GrwEmplController {
	
	@Autowired
	private EmplService emplService;

	@Autowired
	private UserService userService;

	@Autowired
	private FileUploadService fileUploadService;
	
	
	@GetMapping("/grw/empl/emplLst.do")
	public String emplSearchLst(UserSearchVO _userSearchVO, ModelMap _model, PartVO _partVO, PosVO _posVO) throws Exception {
		PagingInfo pagingInfo = new PagingInfo(_userSearchVO);
		
		pagingInfo.setTotalRecord(emplService.emplSearchCnt(_userSearchVO));
		pagingInfo.setDataList(emplService.emplSearchLst(_userSearchVO));
		pagingInfo.setAction("/grw/empl/emplLst.do");
		
		_model.addAttribute("pagingInfo",	pagingInfo);

		return "grw.empl.emplLst";
	}


	@GetMapping("/grw/empl/emplSel.do")
	public String emplSel(UserVO userVO, ModelMap _model) throws Exception {
		UserVO emplSel = emplService.emplSel(userVO);
		
		_model.addAttribute("emplSel",	emplSel);
		
		return "grw.empl.emplSel";
	}
	

	@GetMapping("/grw/empl/emplIns.do")
	public String emplIns(UserVO userVO, PartVO partVO, PosVO posVO, Model _model) throws Exception {
		_model.addAttribute("partLst", userService.partLst(partVO));
		_model.addAttribute("posLst", userService.posLst(posVO));
		
		return "grw.empl.emplIns";
	}
	
	@GetMapping("/grw/empl/emplUpd.do")
	public String emplUpd(UserVO userVO, PartVO partVO, PosVO posVO, ModelMap _model) throws Exception {
		UserVO emplUpd = emplService.emplSel(userVO);
		
		_model.addAttribute("partLst", userService.partLst(partVO));
		_model.addAttribute("posLst", userService.posLst(posVO));
		_model.addAttribute("emplUpd", emplUpd);
		
		return "grw.empl.emplUpd";
	}
	
	@RequestMapping("/grw/imgDelete.do")
	public String imgDelete(UserVO userVO) throws Exception {
		userService.imgDelete(userVO);
		System.out.println("imgname : " + userVO.getImgName());
		System.out.println("imgoriname : " + userVO.getImgName());
		return "grw.user.userUpd";
	}
	
	
	@RequestMapping("/grw/getImage.do")
	public void getImage(UserVO userVO, HttpServletRequest req, HttpSession session, HttpServletResponse res, MultipartFile files) throws Exception {
		UserVO user = emplService.emplSel(userVO);
		
		String fileNm = "";
		String ext = "";
		String realFile = user.getImgUrl();
		
		if(user.getImgUrl() != null) {
			fileNm = user.getImgName();
			ext = fileNm.substring(fileNm.lastIndexOf(".")+1, fileNm.length());
		}
		
		
		BufferedOutputStream out = null;
		InputStream in = null;

		try {
			res.setContentType("image/" + ext);
			res.setHeader("Content-Disposition", "inline;filename=" + fileNm);
			File file = new File(realFile);
			if(file.exists()){
				in = new FileInputStream(file);
				out = new BufferedOutputStream(res.getOutputStream());
				int len;
				byte[] buf = new byte[1024];
				while ((len = in.read(buf)) > 0) {
					out.write(buf, 0, len);
				}
			}
		} catch (Exception e) {
			// 예외처리
		} finally {
			if(out != null){ out.flush(); }
			if(out != null){ out.close(); }
			if(in != null){ in.close(); }
		}
	}
	
		// REST
		@RestController
		public class RestBoardController {
			
			// 등록
			@PostMapping("/grw/empl/emplIns.do") 
			public HashMap<String, Object> emplInsAJAX(UserVO userVO, BindingResult _result, @RequestParam("imgUrl") MultipartFile img, MultipartHttpServletRequest Request) {
				new UserValidator().validate(userVO, _result); 

				userVO.setImgUrl(fileUploadService.restore(img));

				String ImgFileName = img.getOriginalFilename();
				userVO.setImgOriName(ImgFileName);
			
				String StroedimgName =userVO.getImgUrl().substring(userVO.getImgUrl().lastIndexOf("/")+1, userVO.getImgUrl().length());	
				userVO.setImgName(StroedimgName);

				int result = emplService.emplIns(userVO);
				return ValidatorUtil.resultSuccess(result);
			}
			
			
			// 수정
			@PostMapping("/grw/empl/emplUpd.do")
			public HashMap<String, Object> emplUpdAJAX(UserVO userVO, BindingResult _result) {
				new UserValidator().validate(userVO, _result); 

				if (_result.hasErrors()) {
					return ValidatorUtil.resultError(_result);
				}else{
					int result = emplService.emplUpd(userVO);
					return ValidatorUtil.resultSuccess(result);
				}	
					
			}
			
			// 삭제
			@PostMapping("/grw/empl/emplDel.do")
			public HashMap<String, Object> emplDelAJAX(UserVO userVO) {
				
				int result = emplService.emplDel(userVO);
				return ValidatorUtil.resultSuccess(result);
			}
			
			
		}
}
