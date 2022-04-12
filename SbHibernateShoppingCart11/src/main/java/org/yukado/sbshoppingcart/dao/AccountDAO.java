package org.yukado.sbshoppingcart.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.yukado.sbshoppingcart.entity.Account;
import org.yukado.sbshoppingcart.form.AccountForm;
import org.yukado.sbshoppingcart.model.AccountInfo;
import org.yukado.sbshoppingcart.pagination.PaginationResult;
 
@Transactional
@Repository
public class AccountDAO {
	
	
	

@Autowired
    private SessionFactory sessionFactory;

@Bean
public BCryptPasswordEncoder passwordEncoder() {
   BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
   return bCryptPasswordEncoder;
}
 
    public Account findAccount(String userName) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.find(Account.class, userName);
    }
    public AccountInfo findAccountInfo(String userName) {
        Account account = this.findAccount(userName);
        if (account == null) {
            return null;
        }
        return new AccountInfo(account.getUserName(), account.getEncrytedPassword(), account.isActive(), account.getUserRole(), 
        		account.getUserVorname(), account.getUserNachname(), account.getUserStrasse(), account.getUserHausnummer(), account.getUserPLZ(),
        		account.getUserOrt(), account.getUserTelefon(), account.getUserEmail());
    }
    

	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
    public void save(AccountForm accountForm) {
 
		  Session session = this.sessionFactory.getCurrentSession();
	        String userName = accountForm.getUserName();
	 
	        Account account = null;
	 
	        boolean isNew = false;
	        if (userName != null) {
	            account = this.findAccount(userName);
	        }
	        if (account == null) {
	            isNew = true;
	            account = new Account();
	            
	        }

        account.setUserName(accountForm.getUserName());
		account.setEncrytedPassword(passwordEncoder().encode(accountForm.getEncrytedPassword()).toString());
        account.setActive(accountForm.isActive());
        account.setUserRole(accountForm.getUserRole());
        account.setUserVorname(accountForm.getUserVorname());
        account.setUserNachname(accountForm.getUserNachname());
        account.setUserStrasse(accountForm.getUserStrasse());
        account.setUserHausnummer(accountForm.getUserHausnummer());
        account.setUserPLZ(accountForm.getUserPLZ());
        account.setUserOrt(accountForm.getUserOrt());
        account.setUserTelefon(accountForm.getUserTelefon());
        account.setUserEmail(accountForm.getUserEmail());
        
     
        if (isNew) {
            session.persist(account);
        }
        // If error in DB, Exceptions will be thrown out immediately
        session.flush();
    }
 
    public PaginationResult<AccountInfo> queryAccounts(int page, int maxResult, int maxNavigationPage,
            String likeName) {
        String sql = "Select new " + AccountInfo.class.getName() //
                + "(p.userName, p.encrytedPassword, p.active, p.company, p.userRole, p.userVorname, p.userNachname, p.userStraße, p.userHausnummer, p.userPLZ, p.userOrt,"
                + " p.userTelefon, p.userEmail) " + " from "//
                + Account.class.getName() + " p ";
        if (likeName != null && likeName.length() > 0) {
            sql += " Where lower(p.userName) like :likeName ";
        }
        sql += " order by p.createDate desc ";
        // 
        Session session = this.sessionFactory.getCurrentSession();
        Query<AccountInfo> query = session.createQuery(sql, AccountInfo.class);
 
        if (likeName != null && likeName.length() > 0) {
            query.setParameter("likeName", "%" + likeName.toLowerCase() + "%");
        }
        return new PaginationResult<AccountInfo>(query, page, maxResult, maxNavigationPage);
    }
 
    public PaginationResult<AccountInfo> queryAccounts(int page, int maxResult, int maxNavigationPage) {
        return queryAccounts(page, maxResult, maxNavigationPage, null);
    }   
 
}