package egovframework.groupware.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import egovframework.common.util.ValidatorUtil;
import egovframework.groupware.service.ScheService;
import egovframework.groupware.vo.ScheVO;

@Controller
public class GrwScheController {
	
	@Autowired
	private ScheService scheService;

	

	@GetMapping("/grw/sche/scheLst.do")
	public String scheLst(ScheVO scheVO, ModelMap model) {
		/*ScheVO scheLst = scheService.scheSel(scheVO);
		// scheLst.setContent(scheLst.getContent().replaceAll("\n", "<br>"));

		
		model.addAttribute("scheLst", scheLst);*/

		return "grw.sche.scheLst";
	}
	

	@GetMapping("/grw/schedule/scheduleLst.do")
	public String scheduleLst(ScheVO scheVO, ModelMap model) {
		return "grw.schedule.scheduleLst";
	}

	
	@GetMapping("/grw/schedule/scheduleWrt.do")
	public String scheduleWrt() {
		return "grw.schedule.scheduleWrt";
	}

	
	@GetMapping("/grw/schedule/scheduleSel.do")
	public String scheduleSel(ScheVO scheVO, ModelMap model) {
		ScheVO scheSel = scheService.scheSel(scheVO);
		
		scheSel.setContent(scheSel.getContent().replaceAll("\n", "<br>"));
		
		String tempStr = scheSel.getStartDate();
		String tempEnd = scheSel.getEndDate();
		tempStr = tempStr.substring(0, tempStr.length()-2);
		tempEnd = tempEnd.substring(0, tempEnd.length()-2);
		scheSel.setStartDate(tempStr);
		scheSel.setEndDate(tempEnd);
		
		model.addAttribute("scheSel", scheSel);
		return "grw.schedule.scheduleSel";
	}
	
	@GetMapping("/grw/schedule/scheduleUpd.do")
	public String scheduleUpd(ScheVO scheVO, ModelMap model) {
		ScheVO scheUpd = scheService.scheSel(scheVO);
		scheUpd.setContent(scheUpd.getContent().replaceAll("\n", "<br>"));
		
		model.addAttribute("scheUpd", scheUpd);
		
		return "grw.schedule.scheduleUpd";
	}

	
	// REST
	@RestController
	public class RestBoardController {

		@PostMapping("/grw/schedule/scheduleLst.do")
		public List<ScheVO> scheLst(@RequestBody Map<String, Object> map, Model model) throws Exception {
			System.out.println("전체 일정");
			
			List<ScheVO> result = null;

			try {
				result = scheService.scheLst(map);
				// 날짜 뒤에 .0 없애기
				for (int i=0; i<result.size(); i++) {
					String tempStr = result.get(i).getStartDate();
					String tempEnd = result.get(i).getEndDate();
					tempStr = tempStr.substring(0, tempStr.length()-2);
					tempEnd = tempEnd.substring(0, tempEnd.length()-2);
					result.get(i).setStartDate(tempStr);
					result.get(i).setEndDate(tempEnd);
		
				
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			return result;
		}
		
		@PostMapping("/grw/sche/scheLst.do")
		public List<ScheVO> scheLst2(@RequestBody Map<String, Object> map, Model model) throws Exception {
			System.out.println("전체 일정");
			
			List<ScheVO> result = null;

			try {
				result = scheService.scheLst(map);
				// 날짜 뒤에 .0 없애기
				for (int i=0; i<result.size(); i++) {
					String tempStr = result.get(i).getStartDate();
					String tempEnd = result.get(i).getEndDate();
					tempStr = tempStr.substring(0, tempStr.length()-2);
					tempEnd = tempEnd.substring(0, tempEnd.length()-2);
					result.get(i).setStartDate(tempStr);
					result.get(i).setEndDate(tempEnd);
		
				
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			return result;
		}
	
	
		/*@PostMapping(value = "/grw/schedule/scheduleWrt.do")
		public String insertSchedule(ScheVO vo) throws Exception {
			System.out.println("일정 등록");
			
			vo.setScheId("11");
			
			vo.setContent(vo.getContent().replaceAll("\n", "<br>"));
			try {
				scheService.scheWrt(vo);
			} catch(Exception e) {
				e.printStackTrace();
			}
			System.out.println("끝");
			
			return "redirect:/schedule/scheduleLst.do";
		}
*/		
		@PostMapping("/grw/schedule/scheduleWrt.do")
		public HashMap<String, Object> scheduleWrtAJAX(ScheVO scheVO) {
			System.out.println("일정 등록");

			scheVO.setContent(scheVO.getContent().replaceAll("\n", "<br>"));
			
			int result = scheService.scheWrt(scheVO);

			return ValidatorUtil.resultSuccess(result);
		}

		
		/*@PostMapping("/grw/schedule/scheduleSel.do")
		public ScheVO scheSel(@RequestBody ScheVO scheVO, Model model) throws Exception {
			System.out.println("일정 조회");

			ScheVO result = null;
			try {
				result = scheService.scheSel(scheVO);
				result.setContent(result.getContent().replaceAll("\n", "<br>"));
				
				String tempStr = result.getStartDate();
				String tempEnd = result.getEndDate();
				tempStr = tempStr.substring(0, tempStr.length()-2);
				tempEnd = tempEnd.substring(0, tempEnd.length()-2);
				result.setStartDate(tempStr);
				result.setEndDate(tempEnd);
			} catch(Exception e) {
				e.printStackTrace();
			}
			return result;
		}*/
		
		@PostMapping("/grw/schedule/scheduleUpd.do")
		public HashMap<String, Object> scheduleUpdAJAX(ScheVO scheVO) {
			System.out.println("일정 수정");
			System.out.println("id : "+ scheVO.getScheId());

			scheVO.setContent(scheVO.getContent().replaceAll("\n", "<br>"));
			
			int result = scheService.scheUpd(scheVO);

			return ValidatorUtil.resultSuccess(result);
		}
		
		@PostMapping("/grw/schedule/scheduleDel.do")
		public HashMap<String, Object> scheduleDelAjax(ScheVO scheVO) {
			System.out.println("일정 삭제");
			
			int result = scheService.scheDel(scheVO);
			
			return ValidatorUtil.resultSuccess(result);
			
		}
		
	
	}
}
