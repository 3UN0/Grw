package egovframework.groupware.web;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import egovframework.common.util.ValidatorUtil;
import egovframework.common.vo.PagingInfo;
import egovframework.groupware.service.EmplService;
import egovframework.groupware.service.SignService;
import egovframework.groupware.validate.MsgValidator;
import egovframework.groupware.vo.MessageVO;
import egovframework.groupware.vo.SignIdVO;
import egovframework.groupware.vo.SignVO;
import egovframework.user.vo.UserVO;

@Controller
public class GrwSignController {
	
	@Autowired
	private SignService signService;
	

	@Autowired
	private EmplService emplService;
	
	@GetMapping("/grw/sign/signIngLst.do")
	public String signIngLst(SignVO signVO, HttpServletRequest req, ModelMap _model) {
		PagingInfo pagingInfo = new PagingInfo(signVO);

		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userId");
		signVO.setUserId(userid);

		pagingInfo.setTotalRecord(signService.signLstCnt(signVO));
		pagingInfo.setDataList(signService.signIngLst(signVO));
		pagingInfo.setAction("/grw/sign/signIngLst.do");

		_model.addAttribute("pagingInfo",	pagingInfo);
		
		return "grw.sign.signIngLst";
	}
	
	@GetMapping("/grw/sign/signReqLst.do")
	public String signReqLst(SignVO signVO, HttpServletRequest req, ModelMap _model) {
		PagingInfo pagingInfo = new PagingInfo(signVO);

		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userId");
		signVO.setMidSign(userid);
		
		pagingInfo.setTotalRecord(signService.signReqLstCnt(signVO));
		pagingInfo.setDataList(signService.signReqLst(signVO));
		pagingInfo.setAction("/grw/sign/signReqLst.do");

		_model.addAttribute("pagingInfo",	pagingInfo);
		
		return "grw.sign.signReqLst";
	}
	

	@GetMapping("/grw/sign/signFnlReqLst.do")
	public String signFnlReqLst(SignVO signVO, HttpServletRequest req, ModelMap _model) {
		PagingInfo pagingInfo = new PagingInfo(signVO);

		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userId");
		signVO.setFnlSign(userid);
		
		pagingInfo.setTotalRecord(signService.signFnlReqLstCnt(signVO));
		pagingInfo.setDataList(signService.signFnlReqLst(signVO));
		pagingInfo.setAction("/grw/sign/signFnlReqLst.do");

		_model.addAttribute("pagingInfo",	pagingInfo);
		
		return "grw.sign.signFnlReqLst";
	}
	

	@GetMapping("/grw/sign/signDoneLst.do")
	public String signDoneLst(SignVO signVO, HttpServletRequest req, ModelMap _model) {
		PagingInfo pagingInfo = new PagingInfo(signVO);

		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userId");
		signVO.setUserId(userid);
		
		pagingInfo.setTotalRecord(signService.signDoneLstCnt(signVO));
		pagingInfo.setDataList(signService.signDoneLst(signVO));
		pagingInfo.setAction("/grw/sign/signDoneLst.do");

		_model.addAttribute("pagingInfo",	pagingInfo);
		
		return "grw.sign.signDoneLst";
	}
	
	
	@GetMapping("/grw/sign/signSel.do")
	public String signSel(SignVO signVO, HttpServletRequest req, ModelMap _model ) throws Exception {
		SignVO signSel = signService.signSel(signVO);
		_model.addAttribute("signSel", signSel);
		return "grw.sign.signSel";
	}

	
	
	
	@GetMapping("/grw/sign/signWrt.do")
	public String signWrt(UserVO userVO, SignIdVO signidVO, ModelMap model) {
		
		model.addAttribute("signidLst", signService.signidLst(signidVO));
		model.addAttribute("emplList", emplService.emplList(userVO));

		return "grw.sign.signWrt";
	}

	
		// REST
		@RestController
		public class RestBoardController {

			// 등록
			@PostMapping("/grw/sign/signWrt.do")
			public HashMap<String, Object> signWrtAJAX(SignVO signVO, BindingResult _result) throws Exception {
				
				int result = signService.signWrt(signVO);
				return ValidatorUtil.resultSuccess(result);
			
			} 
		
			
			// 승인
			@PostMapping("/grw/sign/acpSign.do")
			public HashMap<String, Object> acpSignAJAX(SignVO signVO, BindingResult _result) {
				System.out.println("sid : "+signVO.getSid());
				
				int result = signService.acpSign(signVO);
				return ValidatorUtil.resultSuccess(result);
				
			}

			
			// 최종승인
			@PostMapping("/grw/sign/acpfnlSign.do")
			public HashMap<String, Object> acpfnlSignAJAX(SignVO signVO, BindingResult _result) {
				System.out.println("sid : "+signVO.getSid());
				
				int result = signService.acpfnlSign(signVO);
				return ValidatorUtil.resultSuccess(result);
				
			}
			

			// 반려
			@PostMapping("/grw/sign/returnSign.do")
			public HashMap<String, Object> returnSignAJAX(SignVO signVO, BindingResult _result) {
				
				int result = signService.returnSign(signVO);
				return ValidatorUtil.resultSuccess(result);
			}
			
		}
		
		
}
