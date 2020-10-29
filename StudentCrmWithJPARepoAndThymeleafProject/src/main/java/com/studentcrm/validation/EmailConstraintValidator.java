package com.studentcrm.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;


public class EmailConstraintValidator implements ConstraintValidator<EmailValidation, String>{

	public String[] emailPrefix;
	
	@Override
	public void initialize(EmailValidation emailConstraintAnnotation) {
		emailPrefix = emailConstraintAnnotation.value();
	}
	
	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		boolean result = false;
		if(value != null) {
			for(String tempPrefix:emailPrefix) {
				result = value.endsWith(tempPrefix);
				if(result) {
					break;
				}
			}
		}
		return result;
	}

}
