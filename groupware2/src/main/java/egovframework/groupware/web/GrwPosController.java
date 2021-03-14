package egovframework.groupware.web;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import egovframework.common.util.ValidatorUtil;
import egovframework.common.vo.PagingInfo;
import egovframework.groupware.validate.PosValidator;
import egovframework.user.service.UserService;
import egovframework.user.vo.PosVO;

@Controller
public class GrwPosController {
	
	@Autowired
	UserService userService;
	
	
	@GetMapping("/grw/pos/posLst.do")
	public String posSearchLst(PosVO posVO, ModelMap _model) throws Exception {
		PagingInfo pagingInfo = new PagingInfo(posVO);
		
		pagingInfo.setTotalRecord(userService.posCnt(posVO));
		pagingInfo.setDataList(userService.posLst(posVO));
		pagingInfo.setAction("/grw/pos/posLst.do");
		
		_model.addAttribute("pagingInfo",	pagingInfo);
		
		return "grw.pos.posLst";
	}

	@GetMapping("/grw/pos/posIns.do")
	public String partIns(PosVO posVO, ModelMap _model) throws Exception {
		
		return "grw.pos.posIns";
	}
	
	
	@GetMapping("/grw/pos/posSel.do")
	public String posSel(PosVO posVO, ModelMap _model) throws Exception {
		PosVO posSel = userService.posSel(posVO);
		
		_model.addAttribute("posSel", posSel);
		
		return "grw.pos.posSel";
	}
	
	
	@GetMapping("/grw/pos/posUpd.do")
	public String posUpd(PosVO posVO, ModelMap _model) throws Exception {
		PosVO posUpd = userService.posSel(posVO);
		
		_model.addAttribute("posUpd", posUpd);
		
		return "grw.pos.posUpd";
	}
	
	
	
	
		// REST
		@RestController
		public class RestBoardController {
			
			// 등록
			@PostMapping("/grw/pos/posIns.do") 
			public HashMap<String, Object> posInsAJAX(PosVO posVO, BindingResult _result) throws Exception {
				new PosValidator().validate(posVO, _result); 

				posVO.setPosId(posVO.getPosId());	

				int result = userService.posIns(posVO);
				return ValidatorUtil.resultSuccess(result);
			}
			
			
			// 수정
			@PostMapping("/grw/pos/posUpd.do")
			public HashMap<String, Object> posUpdAJAX(PosVO posVO, BindingResult _result) throws Exception {
				new PosValidator().validate(posVO, _result); 
				
				if (_result.hasErrors()) {
					return ValidatorUtil.resultError(_result);
				}else{
					int result = userService.posUpd(posVO);
					return ValidatorUtil.resultSuccess(result);
				}	
					
			}
			
			// 삭제
			@PostMapping("/grw/pos/posDel.do")
			public HashMap<String, Object> posDelAJAX(PosVO posVO) throws Exception {
				// posVO.setPosId(posId);
				System.out.println("posid : "+posVO.getPosId());
				
				int result = userService.posDel(posVO);
				return ValidatorUtil.resultSuccess(result);
			}
			
			
		}
}
