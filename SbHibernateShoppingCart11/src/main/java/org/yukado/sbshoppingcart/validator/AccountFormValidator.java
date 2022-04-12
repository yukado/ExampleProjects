package org.yukado.sbshoppingcart.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.yukado.sbshoppingcart.dao.AccountDAO;
import org.yukado.sbshoppingcart.entity.Account;
import org.yukado.sbshoppingcart.form.AccountForm;

@Component
public class AccountFormValidator implements Validator {
 
   @Autowired
   private AccountDAO accountDAO;
 
   // This validator only checks for the ProductForm.
   @Override
   public boolean supports(Class<?> clazz) {
      return clazz == AccountForm.class;
   }
 
   @Override
   public void validate(Object target, Errors errors) {
      AccountForm accountForm = (AccountForm) target;
 
      // Check the fields of ProductForm.
  
      ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "NotEmpty.accountForm.userName");
      ValidationUtils.rejectIfEmptyOrWhitespace(errors, "encrytedPassword", "NotEmpty.accountForm.encrytedPassword");
      ValidationUtils.rejectIfEmptyOrWhitespace(errors, "active", "NotEmpty.accountForm.active");
      ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userVorname", "NotEmpty.accountForm.userVorname");
      ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userNachname", "NotEmpty.accountForm.userNachname");
      ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userStrasse", "NotEmpty.accountForm.userStrasse");
      ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userHausnummer", "NotEmpty.accountForm.userHausnummer");
      ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userPLZ", "NotEmpty.accountForm.userPLZ");
      ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userOrt", "NotEmpty.accountForm.userOrt");     
      ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userTelefon", "NotEmpty.accountForm.userTelefon");
      ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userEmail", "NotEmpty.accountForm.userEmail");
 
      String userName = accountForm.getUserName();
      if (userName != null && userName.length() > 0) {
         if (userName.matches("\\s+")) {
            errors.rejectValue("userName", "Pattern.accountForm.userName");
         } else if (accountForm.isNewAccount()) {
            Account account = accountDAO.findAccount(userName);
            if (account != null) {
               errors.rejectValue("userName", "Duplicate.accountForm.userName");
            }
         }
      }
   }
 
}
