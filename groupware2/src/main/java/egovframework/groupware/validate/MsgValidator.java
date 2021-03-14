package egovframework.groupware.validate;


import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import egovframework.groupware.vo.MessageVO;

public class MsgValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		//return SampleVO.class.equals(clazz);
		return MessageVO.class.equals(clazz);
	}
    
	@Override
	public void validate(Object target, Errors errors) {
		//SampleVO sample = (SampleVO) target;
		MessageVO messageVO = (MessageVO) target;
	}
}
