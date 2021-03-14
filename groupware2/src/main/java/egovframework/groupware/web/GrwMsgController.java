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
import egovframework.groupware.service.MsgService;
import egovframework.groupware.validate.MsgValidator;
import egovframework.groupware.vo.MessageVO;
import egovframework.user.vo.UserVO;

@Controller
public class GrwMsgController {
	
	@Autowired
	private MsgService msgService;

	@Autowired
	private EmplService emplService;

	
	@GetMapping("/grw/msg/rcvMsgLst.do")
	public String rcvMsgLst(MessageVO messageVO, HttpServletRequest req, ModelMap _model) {
		PagingInfo pagingInfo = new PagingInfo(messageVO);
		
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userId");
		messageVO.setReceiverId(userid);

		pagingInfo.setTotalRecord(msgService.rcvMsgLstCnt(messageVO));
		pagingInfo.setDataList(msgService.rcvMsgLst(messageVO));
		pagingInfo.setAction("/grw/msg/rcvMsgLst.do");

		_model.addAttribute("pagingInfo",	pagingInfo);
		
		return "grw.msg.rcvMsgLst";
	}
	
	
	@GetMapping("/grw/msg/sndMsgLst.do")
	public String sndMsgLst(MessageVO messageVO, HttpServletRequest req, ModelMap _model) {
		PagingInfo pagingInfo = new PagingInfo(messageVO);

		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userId");
		messageVO.setSenderId(userid);

		pagingInfo.setTotalRecord(msgService.sndMsgLstCnt(messageVO));
		pagingInfo.setDataList(msgService.sndMsgLst(messageVO));
		pagingInfo.setAction("/grw/msg/sndMsgLst.do");

		_model.addAttribute("pagingInfo",	pagingInfo);
		
		return "grw.msg.sndMsgLst";
	}

	
	
	@GetMapping("/grw/msg/msgSel.do")
	public String msgSel(MessageVO messageVO, HttpServletRequest req, ModelMap _model ) throws Exception {
		MessageVO msgSel = msgService.msgSel(messageVO);
		
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userId");
		
		if(msgSel.getRcvYn().equals("N")) {					// 수신 여부 : N
			if(!userid.equals(msgSel.getSenderId())) {		// 쪽지 보낸 사람이 읽은 경우 아닐 때
				msgService.msgUpd(messageVO);
			}
		}
		
		_model.addAttribute("msgSel", msgSel);

		return "grw.msg.msgSel";
	}

	
	@GetMapping("/grw/msg/msgWrt")
	public String wrtMsg(MessageVO mesageVO, UserVO userVO, ModelMap _model) {
		_model.addAttribute("emplList", emplService.emplList(userVO));

		return "grw.msg.msgWrt";
	}
	
	// REST
		@RestController
		public class RestBoardController {

			// 등록
			@PostMapping("/grw/msg/msgWrt.do")
			public HashMap<String, Object> contWrtAJAX(MessageVO messageVO, BindingResult _result) {
				new MsgValidator().validate(messageVO, _result); 

				if (_result.hasErrors()) {
					return ValidatorUtil.resultError(_result);
				}else{
					int result = msgService.msgWrt(messageVO);
					return ValidatorUtil.resultSuccess(result);
				}
			}
			
			// 삭제
			@PostMapping("/grw/msg/msgDel.do")
			public HashMap<String, Object> contDelAJAX(MessageVO messageVO) {
				
				int result = msgService.msgDel(messageVO);
				return ValidatorUtil.resultSuccess(result);
			}
			
			
		}	
		
		
	
}
