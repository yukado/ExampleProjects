package org.yukado.sbshoppingcart.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.yukado.sbshoppingcart.dao.CatDAO;
import org.yukado.sbshoppingcart.entity.Cat;
import org.yukado.sbshoppingcart.form.CatForm;
 
@Component
public class CatFormValidator implements Validator {
 
   @Autowired
   private CatDAO catDAO;
 
   // This validator only checks for the ProductForm.
   @Override
   public boolean supports(Class<?> clazz) {
      return clazz == CatForm.class;
   }
 
   @Override
   public void validate(Object target, Errors errors) {
	   CatForm catForm = (CatForm) target;
 
      // Check the fields of ProductForm.
      ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "NotEmpty.catForm.code");
      ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cat", "NotEmpty.catForm.name");
 
      String code = catForm.getCode();
      if (code != null && code.length() > 0) {
         if (code.matches("\\s+")) {
            errors.rejectValue("code", "Pattern.catForm.code");
         } else if (catForm.isNewCat()) {
            Cat cat = catDAO.findCat(code);
            if (cat != null) {
               errors.rejectValue("code", "Duplicate.catForm.code");
            }
         }
      }
   }
 
}
