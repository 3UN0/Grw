package egovframework.groupware.validate;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import egovframework.user.vo.PartVO;
import egovframework.user.vo.PosVO;

public class PosValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return PosVO.class.equals(clazz);
	}
    
	@Override
	public void validate(Object target, Errors errors) {
		PosVO posVO = (PosVO) target;
	}
}
