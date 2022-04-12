package org.yukado.sbshoppingcart.dao;

 
import javax.persistence.NoResultException;
 
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.yukado.sbshoppingcart.entity.Subcat;
import org.yukado.sbshoppingcart.form.SubcatForm;
import org.yukado.sbshoppingcart.model.SubcatInfo;
import org.yukado.sbshoppingcart.pagination.PaginationResult;
 
@Transactional
@Repository
public class SubcatDAO {
 
    @Autowired
    private SessionFactory sessionFactory;
 
    public Subcat findSubcat(String code) {
        try {
            String sql = "Select e from " + Subcat.class.getName() + " e Where e.code =:code ";
 
            Session session = this.sessionFactory.getCurrentSession();
            Query<Subcat> query = session.createQuery(sql, Subcat.class);
            query.setParameter("code", code);
            return (Subcat) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
 
    public SubcatInfo findSubcatInfo(String code) {
    	Subcat subcat = this.findSubcat(code);
        if (subcat == null) {
            return null;
        }
        return new SubcatInfo(subcat.getCode(), subcat.getSubcat(), subcat.getCatnameadd());
    }
    
    public Subcat findSubcatCatname(String catnameadd) {
        try {
            String sql = "Select e from " + Subcat.class.getName() + " e Where e.catnameadd =:catnameadd ";
 
            Session session = this.sessionFactory.getCurrentSession();
            Query<Subcat> query = session.createQuery(sql, Subcat.class);
            query.setParameter("catnameadd", catnameadd);
            return (Subcat) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
 
    public SubcatInfo findSubcatCatnameInfo(String catnameadd) {
    	Subcat subcat = this.findSubcat(catnameadd);
        if (subcat == null) {
            return null;
        }
        return new SubcatInfo(subcat.getCode(), subcat.getSubcat(), subcat.getCatnameadd());
    }
    
   
 
    @Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
    public void save(SubcatForm subcatForm) {
 
        Session session = this.sessionFactory.getCurrentSession();
        String code = subcatForm.getCode();
 
        Subcat subcat = null;
 
        boolean isNew = false;
        if (code != null) {
        	subcat = this.findSubcat(code);
        }
        if (subcat == null) {
            isNew = true;
            subcat = new Subcat();
            
        }
        subcat.setCode(code);
        subcat.setSubcat(subcatForm.getSubcat());
        subcat.setCatnameadd(subcatForm.getCatnameadd());
        
       
        
        if (isNew) {
            session.persist(subcat);
        }
        // If error in DB, Exceptions will be thrown out immediately
        session.flush();
    }
 
    public PaginationResult<SubcatInfo> querySubcats(int page, int maxResult, int maxNavigationPage,
            String likeSubcat) {
        String sql = "Select new " + SubcatInfo.class.getName() //
                + "(p.code, p.subcat, p.catnameadd) " + " from "//
                + Subcat.class.getName() + " p ";
        if (likeSubcat != null && likeSubcat.length() > 0) {
            sql += " Where lower(p.subcat) like :likeSubcat ";
        }
        
        // 
        Session session = this.sessionFactory.getCurrentSession();
        Query<SubcatInfo> query = session.createQuery(sql, SubcatInfo.class);
 
        if (likeSubcat != null && likeSubcat.length() > 0) {
            query.setParameter("likeSubcat", "%" + likeSubcat.toLowerCase() + "%");
        }
        return new PaginationResult<SubcatInfo>(query, page, maxResult, maxNavigationPage);
    }
 
    public PaginationResult<SubcatInfo> querySubcats(int page, int maxResult, int maxNavigationPage) {
        return querySubcats(page, maxResult, maxNavigationPage, null);
    }
    
    public PaginationResult<SubcatInfo> querySubcatsCode(int page, int maxResult, int maxNavigationPage,
            String likeSubcatCode) {
        String sql = "Select new " + SubcatInfo.class.getName() //
                + "(p.code, p.subcat, p.catnameadd) " + " from "//
                + Subcat.class.getName() + " p ";
        if (likeSubcatCode != null && likeSubcatCode.length() > 0) {
            sql += " Where lower(p.code) like :likeSubcatCode ";
        }
        
        // 
        Session session = this.sessionFactory.getCurrentSession();
        Query<SubcatInfo> query = session.createQuery(sql, SubcatInfo.class);
 
        if (likeSubcatCode != null && likeSubcatCode.length() > 0) {
            query.setParameter("likeSubcatCode", "%" + likeSubcatCode.toLowerCase() + "%");
        }
        return new PaginationResult<SubcatInfo>(query, page, maxResult, maxNavigationPage);
    }
 
    public PaginationResult<SubcatInfo> querySubcatsCode(int page, int maxResult, int maxNavigationPage) {
        return querySubcatsCode(page, maxResult, maxNavigationPage, null);
    }
    
    public PaginationResult<SubcatInfo> querySubcatsCatname(int page, int maxResult, int maxNavigationPage,
            String likeSubcatCatname) {
        String sql = "Select new " + SubcatInfo.class.getName() //
                + "(p.code, p.subcat, p.catnameadd) " + " from "//
                + Subcat.class.getName() + " p ";
        if (likeSubcatCatname != null && likeSubcatCatname.length() > 0) {
            sql += " Where lower(p.catnameadd) like :likeSubcatCatname ";
        }
        
        // 
        Session session = this.sessionFactory.getCurrentSession();
        Query<SubcatInfo> query = session.createQuery(sql, SubcatInfo.class);
 
        if (likeSubcatCatname != null && likeSubcatCatname.length() > 0) {
            query.setParameter("likeSubcatCatname", "%" + likeSubcatCatname.toLowerCase() + "%");
        }
        return new PaginationResult<SubcatInfo>(query, page, maxResult, maxNavigationPage);
    }
 
    public PaginationResult<SubcatInfo> querySubcatsCatname(int page, int maxResult, int maxNavigationPage) {
        return querySubcatsCatname(page, maxResult, maxNavigationPage, null);
    }
    
}