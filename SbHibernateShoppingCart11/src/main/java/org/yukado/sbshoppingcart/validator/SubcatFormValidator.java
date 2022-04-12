package org.yukado.sbshoppingcart.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.yukado.sbshoppingcart.dao.SubcatDAO;
import org.yukado.sbshoppingcart.entity.Subcat;
import org.yukado.sbshoppingcart.form.SubcatForm;
 
@Component
public class SubcatFormValidator implements Validator {
 
   @Autowired
   private SubcatDAO subcatDAO;
 
   // This validator only checks for the ProductForm.
   @Override
   public boolean supports(Class<?> clazz) {
      return clazz == SubcatForm.class;
   }
 
   @Override
   public void validate(Object target, Errors errors) {
	   SubcatForm subcatForm = (SubcatForm) target;
 
      // Check the fields of ProductForm.
      ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "NotEmpty.subcatForm.code");
      ValidationUtils.rejectIfEmptyOrWhitespace(errors, "subcat", "NotEmpty.subcatForm.name");
      ValidationUtils.rejectIfEmptyOrWhitespace(errors, "catnameadd", "NotEmpty.subcatForm.catnameadd");
 
      String code = subcatForm.getCode();
      if (code != null && code.length() > 0) {
         if (code.matches("\\s+")) {
            errors.rejectValue("code", "Pattern.subcatForm.code");
         } else if (subcatForm.isNewSubcat()) {
            Subcat subcat = subcatDAO.findSubcat(code);
            if (subcat != null) {
               errors.rejectValue("code", "Duplicate.subcatForm.code");
            }
         }
      }
   }
 
}
