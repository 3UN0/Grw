package egovframework.groupware.web;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import egovframework.common.util.ValidatorUtil;
import egovframework.common.vo.PagingInfo;
import egovframework.groupware.service.EmplService;
import egovframework.groupware.validate.PartValidator;
import egovframework.groupware.validate.UserValidator;
import egovframework.groupware.vo.ContentVO;
import egovframework.user.service.UserService;
import egovframework.user.vo.PartVO;
import egovframework.user.vo.PosVO;
import egovframework.user.vo.UserSearchVO;

@Controller
public class GrwPartController {
	
	@Autowired
	UserService userService;
	
	
	@GetMapping("/grw/part/partLst.do")
	public String partSearchLst(PartVO partVO, ModelMap _model) throws Exception {
		PagingInfo pagingInfo = new PagingInfo(partVO);
		
		pagingInfo.setTotalRecord(userService.partCnt(partVO));
		pagingInfo.setDataList(userService.partLst(partVO));
		pagingInfo.setAction("/grw/part/partLst.do");
		
		_model.addAttribute("pagingInfo",	pagingInfo);
		
		return "grw.part.partLst";
	}

	@GetMapping("/grw/part/partUpd.do")
	public String partUpd(PartVO partVO, ModelMap _model) throws Exception {
		PartVO partUpd = userService.partSel(partVO);
		
		_model.addAttribute("partUpd", partUpd);
		
		return "grw.part.partUpd";
	}

	
	@GetMapping("/grw/part/partIns.do")
	public String partIns(PartVO partVO, ModelMap _model) throws Exception {
		
		return "grw.part.partIns";
	}
	
	
		// REST
		@RestController
		public class RestBoardController {
			
			// 등록
			@PostMapping("/grw/part/partIns.do") 
			public HashMap<String, Object> emplInsAJAX(PartVO partVO, BindingResult _result) throws Exception {
				new PartValidator().validate(partVO, _result); 

				partVO.setPartId(partVO.getPartId());	


				int result = userService.partIns(partVO);
				return ValidatorUtil.resultSuccess(result);
			}
			
			
			// 수정
			@PostMapping("/grw/part/partUpd.do")
			public HashMap<String, Object> partUpdAJAX(PartVO partVO, BindingResult _result) throws Exception {
				new PartValidator().validate(partVO, _result); 
				
				if (_result.hasErrors()) {
					return ValidatorUtil.resultError(_result);
				}else{
					int result = userService.partUpd(partVO);
					return ValidatorUtil.resultSuccess(result);
				}	
					
			}
			
			// 삭제
			@PostMapping("/grw/part/partDel.do")
			public HashMap<String, Object> emplDelAJAX(PartVO partVO) throws Exception {
					
				int result = userService.partDel(partVO);
				return ValidatorUtil.resultSuccess(result);
			}
			
			
		}
}
