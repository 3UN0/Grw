package egovframework.groupware.validate;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import egovframework.user.vo.PartVO;

public class PartValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return PartVO.class.equals(clazz);
	}
    
	@Override
	public void validate(Object target, Errors errors) {
		PartVO partVO = (PartVO) target;
	}
}
