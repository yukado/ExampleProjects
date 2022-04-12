package org.yukado.sbshoppingcart.dao;

 
import javax.persistence.NoResultException;
 
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.yukado.sbshoppingcart.entity.Cat;
import org.yukado.sbshoppingcart.form.CatForm;
import org.yukado.sbshoppingcart.model.CatInfo;
import org.yukado.sbshoppingcart.pagination.PaginationResult;
 
@Transactional
@Repository
public class CatDAO {
 
    @Autowired
    private SessionFactory sessionFactory;
 
    public Cat findCat(String code) {
        try {
            String sql = "Select e from " + Cat.class.getName() + " e Where e.code =:code ";
 
            Session session = this.sessionFactory.getCurrentSession();
            Query<Cat> query = session.createQuery(sql, Cat.class);
            query.setParameter("code", code);
            return (Cat) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
 
    public CatInfo findCatInfo(String code) {
        Cat cat = this.findCat(code);
        if (cat == null) {
            return null;
        }
        return new CatInfo(cat.getCode(), cat.getCat());
    }
    
   
 
    @Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
    public void save(CatForm catForm) {
 
        Session session = this.sessionFactory.getCurrentSession();
        String code = catForm.getCode();
 
        Cat cat = null;
 
        boolean isNew = false;
        if (code != null) {
        	cat = this.findCat(code);
        }
        if (cat == null) {
            isNew = true;
            cat = new Cat();
            
        }
        cat.setCode(code);
        cat.setCat(catForm.getCat());

        
       
        
        if (isNew) {
            session.persist(cat);
        }
        // If error in DB, Exceptions will be thrown out immediately
        session.flush();
    }
 
    public PaginationResult<CatInfo> queryCats(int page, int maxResult, int maxNavigationPage,
            String likeCat) {
        String sql = "Select new " + CatInfo.class.getName() //
                + "(p.code, p.cat) " + " from "//
                + Cat.class.getName() + " p ";
        if (likeCat != null && likeCat.length() > 0) {
            sql += " Where lower(p.cat) like :likeCat ";
        }
        
        // 
        Session session = this.sessionFactory.getCurrentSession();
        Query<CatInfo> query = session.createQuery(sql, CatInfo.class);
 
        if (likeCat != null && likeCat.length() > 0) {
            query.setParameter("likeCat", "%" + likeCat.toLowerCase() + "%");
        }
        return new PaginationResult<CatInfo>(query, page, maxResult, maxNavigationPage);
    }
 
    public PaginationResult<CatInfo> queryCats(int page, int maxResult, int maxNavigationPage) {
        return queryCats(page, maxResult, maxNavigationPage, null);
    }
    
    public PaginationResult<CatInfo> queryCatsCode(int page, int maxResult, int maxNavigationPage,
            String likeCatCode) {
        String sql = "Select new " + CatInfo.class.getName() //
                + "(p.code, p.cat) " + " from "//
                + Cat.class.getName() + " p ";
        if (likeCatCode != null && likeCatCode.length() > 0) {
            sql += " Where lower(p.code) like :likeCatCode ";
        }
        
        // 
        Session session = this.sessionFactory.getCurrentSession();
        Query<CatInfo> query = session.createQuery(sql, CatInfo.class);
 
        if (likeCatCode != null && likeCatCode.length() > 0) {
            query.setParameter("likeCatCode", "%" + likeCatCode.toLowerCase() + "%");
        }
        return new PaginationResult<CatInfo>(query, page, maxResult, maxNavigationPage);
    }
 
    public PaginationResult<CatInfo> queryCatsCode(int page, int maxResult, int maxNavigationPage) {
        return queryCatsCode(page, maxResult, maxNavigationPage, null);
    }
    
}