package egovframework.groupware.validate;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import egovframework.user.vo.UserVO;

public class UserValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return UserVO.class.equals(clazz);
	}
    
	@Override
	public void validate(Object target, Errors errors) {
		UserVO userVO = (UserVO) target;
	}
}
