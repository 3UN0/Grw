package egovframework.groupware.web;

import java.util.HashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import egovframework.common.util.ValidatorUtil;
import egovframework.groupware.service.ComService;
import egovframework.groupware.vo.CommentVO;

@Controller
public class GrwComController {

	@Autowired
	private ComService comService;


	// REST
	@RestController
	public class RestBoardController {

		// 등록
		@RequestMapping("/grw/comWrt.do")
		public HashMap<String, Object> comWrtAJAX(CommentVO commentVO, BindingResult _result) {
		
			int result = comService.comWrt(commentVO);
			return ValidatorUtil.resultSuccess(result);
		
		} 
				
		// 수정
		@RequestMapping("/grw/comUpd.do")
		public HashMap<String, Object> comUpdAJAX(CommentVO commentVO, BindingResult _result) {

			int result = comService.comUpd(commentVO);
			return ValidatorUtil.resultSuccess(result);
		}
		
		// 삭제
		@RequestMapping("/grw/comDel.do")
		public HashMap<String, Object> comDelAJAX(CommentVO commentVO) {

			int result = comService.comDel(commentVO);
			return ValidatorUtil.resultSuccess(result);
		}
		
		
		
	}
	
}
	