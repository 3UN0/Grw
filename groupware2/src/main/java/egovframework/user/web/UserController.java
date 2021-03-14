package egovframework.user.web;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.common.util.SecurityUtil;
import egovframework.common.util.ValidatorUtil;
import egovframework.groupware.service.EmplService;
import egovframework.groupware.service.FileUploadService;
import egovframework.groupware.validate.UserValidator;
import egovframework.user.service.UserService;
import egovframework.user.vo.PartVO;
import egovframework.user.vo.PosVO;
import egovframework.user.vo.UserVO;

@Controller
public class UserController {

	@Autowired
	private EmplService emplService;
	
	@Autowired
	private UserService userService;

	@Autowired
	private FileUploadService fileUploadService;
	
	// 로그인 출력
	@GetMapping("/grw/user/UserLogin.do")
	public String loginGet() {
		return "grw.user.UserLogin";
	}
	
	// 로그인 처리
	@PostMapping("/grw/user/UserLogin.do")
	public String login(UserVO userVO, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		HttpSession session = req.getSession();
		//session.getAttribute("login");
		
		UserVO login = userService.userLogin(userVO);
		
		if(login != null) { 		// 로그인 성공
			session.setAttribute("login", login);
			session.setAttribute("userId", login.getUserId());
			session.setAttribute("userPw", login.getUserPw());
			return "redirect:/grw/main/main.do";
		} else {					// 로그인 실패
			session.setAttribute("login", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/grw/user/UserLogin.do";
		}
	}
	/*
	@PostMapping("/grw/user/UserLogin.do")
	public String login2(UserVO userVO, HttpSession session, RedirectAttributes rttr) throws Exception {
//		BCryptPasswordEncoder bcryptPasswordEncoder = new BCryptPasswordEncoder();
//	
//		UserVO db = emplService.emplSel(userVO);
//
//		System.out.println("db : "+db.getUserPw());
//		System.out.println("user : "+userVO.getUserPw());
//		
//		String nowpw = bcryptPasswordEncoder.encode(userVO.getUserPw());
//		System.out.println("nowpw "+ nowpw);
//		
//		boolean pwdMatch = bcryptPasswordEncoder.matches(nowpw, db.getUserPw());

		UserVO db = emplService.emplSel(userVO);
		System.out.println("db : "+db.getUserPw());
		System.out.println("user : "+userVO.getUserPw());
		
		byte[] salt = null;
		String nowpw = SecurityUtil.getSecurityHash(userVO.getUserPw(), salt);
		System.out.println("nowpw "+ nowpw);
		
		userVO.setUserPw(nowpw);
		
		session.getAttribute("login");
		UserVO user = userService.userLogin(userVO);
		
		if(user != null) {
			session.setAttribute("login", user);
			session.setAttribute("userId", user.getUserId());
			session.setAttribute("userPw", user.getUserPw());
			return "redirect:/grw/main/main.do";

		} else {
			session.setAttribute("login", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/grw/user/UserLogin.do";
		}
	}
	*/
	
	// 로그아웃
	@RequestMapping("/grw/user/UserLogout.do")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/grw/main/main.do";
	}
	
	// 회원가입 출력
	@GetMapping("/grw/user/UserJoin.do")
	public String joinGet(UserVO userVO, PartVO partVO, PosVO posVO, Model model) throws Exception {
		model.addAttribute("partList", userService.partLst(partVO));
		model.addAttribute("posList", userService.posLst(posVO));

		return "grw.user.UserJoin";
	}
	
	// 회원가입 처리	
	@PostMapping("/grw/user/UserJoin.do")
	public String join(UserVO userVO) throws Exception {
		String inputPass = userVO.getUserPw();
//		String password = bcryptPasswordEncoder.encode(inputPass);
//		userVO.setUserPw(password);
		
		/*byte[] salt = null;
		String password = SecurityUtil.getSecurityHash(inputPass, salt);
		userVO.setUserPw(password);
		*/
		userVO.setUserPw(inputPass);
		
		userService.userJoin(userVO);
		
		return "redirect:/grw/user/UserLogin.do";
	}
	
	// 개인 정보 수정 화면
	@GetMapping("/grw/user/userUpd.do")
	public String userUpdGet(UserVO userVO, HttpServletRequest req) throws Exception {
		return "grw.user.userUpd";
	}
	
	
	
	// REST
	@RestController
	public class RestBoardController {
		// 수정
		@PostMapping("/grw/user/userUpd.do")
		public HashMap<String, Object> userUpdAJAX(UserVO userVO, BindingResult _result, @RequestParam("imgUrl") MultipartFile img, MultipartHttpServletRequest Request) throws Exception {
			new UserValidator().validate(userVO, _result); 
		
			String inputPass = userVO.getUserPw();/*
			byte[] salt = null;
			String password = SecurityUtil.getSecurityHash(inputPass, salt);*/
			userVO.setUserPw(inputPass);
			
			if(img.isEmpty() == false) {	// 첨부파일 변경
				userVO.setImgUrl(fileUploadService.restore(img));
				userVO.setImgOriName(img.getOriginalFilename());
				userVO.setImgName(userVO.getImgUrl().substring(userVO.getImgUrl().lastIndexOf("/")+1));
			} else {
				HttpSession session = Request.getSession();
				String userid = (String) session.getAttribute("userId");
				userVO.setUserId(userid);
				
				UserVO userUpd = emplService.emplSel(userVO);
				userVO.setImgUrl(userUpd.getImgUrl());
			}

			int result = userService.userUpdate(userVO);
			return ValidatorUtil.resultSuccess(result);
		}
	}
	
}
