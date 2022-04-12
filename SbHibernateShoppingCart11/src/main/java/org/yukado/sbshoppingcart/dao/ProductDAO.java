package org.yukado.sbshoppingcart.dao;

import java.io.IOException;
import java.util.Date;
 
import javax.persistence.NoResultException;
 
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.yukado.sbshoppingcart.entity.Product;
import org.yukado.sbshoppingcart.form.ProductForm;
import org.yukado.sbshoppingcart.model.ProductInfo;
import org.yukado.sbshoppingcart.pagination.PaginationResult;
 
@Transactional
@Repository
public class ProductDAO {
 
    @Autowired
    private SessionFactory sessionFactory;
 
    public Product findProduct(String code) {
        try {
            String sql = "Select e from " + Product.class.getName() + " e Where e.code =:code ";
 
            Session session = this.sessionFactory.getCurrentSession();
            Query<Product> query = session.createQuery(sql, Product.class);
            query.setParameter("code", code);
            return (Product) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
 
    public ProductInfo findProductInfo(String code) {
        Product product = this.findProduct(code);
        if (product == null) {
            return null;
        }
        return new ProductInfo(product.getCode(), product.getName(), product.getPrice(), product.getCompany(), product.getCategory(), 
        		product.getSubcategory(), product.getCatname(), product.getDescription(), product.getTags());
    }
    
    public Product findProductByCategory(String category) {
        try {
            String sql = "Select e from " + Product.class.getName() + " e Where e.category =:category ";
 
            Session session = this.sessionFactory.getCurrentSession();
            Query<Product> query = session.createQuery(sql, Product.class);
            query.setParameter("category", category);
            return (Product) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
 
    public ProductInfo findProductByCategoryInfo(String category) {
        Product product = this.findProduct(category);
        if (product == null) {
            return null;
        }
        return new ProductInfo(product.getCode(), product.getName(), product.getPrice(), product.getCompany(), product.getCategory(), 
        		product.getSubcategory(), product.getCatname(), product.getDescription(), product.getTags());
    }
    public Product findProductByTag(String tag) {
        try {
            String sql = "Select e from " + Product.class.getName() + " e Where e.tag =:tag ";
 
            Session session = this.sessionFactory.getCurrentSession();
            Query<Product> query = session.createQuery(sql, Product.class);
            query.setParameter("tag", tag);
            return (Product) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
 
    public ProductInfo findProductByProductyInfo(String tag) {
        Product product = this.findProduct(tag);
        if (product == null) {
            return null;
        }
        return new ProductInfo(product.getCode(), product.getName(), product.getPrice(), product.getCompany(), product.getCategory(), 
        		product.getSubcategory(), product.getCatname(), product.getDescription(), product.getTags());
    }
 
    @Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
    public void save(ProductForm productForm) {
 
        Session session = this.sessionFactory.getCurrentSession();
        String code = productForm.getCode();
 
        Product product = null;
 
        boolean isNew = false;
        if (code != null) {
            product = this.findProduct(code);
        }
        if (product == null) {
            isNew = true;
            product = new Product();
            product.setCreateDate(new Date());
        }
        product.setCode(code);
        product.setName(productForm.getName());
        product.setPrice(productForm.getPrice());
        product.setCompany(productForm.getCompany());
        product.setCategory(productForm.getCategory());
        product.setSubcategory(productForm.getSubcategory());
        product.setDescription(productForm.getDescription());
        product.setTags(productForm.getTags());
        
        if (productForm.getFileData1() != null && productForm.getFileData2() != null && productForm.getFileData3() != null) {
            byte[] image1 = null;
            byte[] image2 = null;
            byte[] image3 = null;
            try {
                image1 = productForm.getFileData1().getBytes();
                image2 = productForm.getFileData2().getBytes();
                image3 = productForm.getFileData3().getBytes();
            } catch (IOException e) {
            }
            if (image1 != null && image1.length > 0 && image2 != null && image2.length > 0 && image3 != null && image3.length > 0) {
                product.setImage1(image1);
                product.setImage2(image2);
                product.setImage3(image3);
            }
        }
        if (isNew) {
            session.persist(product);
        }
        // If error in DB, Exceptions will be thrown out immediately
        session.flush();
    }
 
    public PaginationResult<ProductInfo> queryProducts(int page, int maxResult, int maxNavigationPage,
            String likeName) {
        String sql = "Select new " + ProductInfo.class.getName() //
                + "(p.code, p.name, p.price, p.company, p.category, p.subcategory, p.catname, p.description, p.tags) " + " from "//
                + Product.class.getName() + " p ";
        if (likeName != null && likeName.length() > 0) {
            sql += " Where lower(p.name) like :likeName ";
        }
        sql += " order by p.createDate desc ";
        // 
        Session session = this.sessionFactory.getCurrentSession();
        Query<ProductInfo> query = session.createQuery(sql, ProductInfo.class);
 
        if (likeName != null && likeName.length() > 0) {
            query.setParameter("likeName", "%" + likeName.toLowerCase() + "%");
        }
        return new PaginationResult<ProductInfo>(query, page, maxResult, maxNavigationPage);
    }
 
    public PaginationResult<ProductInfo> queryProducts(int page, int maxResult, int maxNavigationPage) {
        return queryProducts(page, maxResult, maxNavigationPage, null);
    }
    
    public PaginationResult<ProductInfo> queryProductsCode(int page, int maxResult, int maxNavigationPage,
            String likeCode) {
        String sql = "Select new " + ProductInfo.class.getName() //
                + "(p.code, p.name, p.price, p.company, p.category, p.subcategory, p.catname, p.description, p.tags) " + " from "//
                + Product.class.getName() + " p ";
        if (likeCode != null && likeCode.length() > 0) {
            sql += " Where lower(p.code) like :likeCode ";
        }
        sql += " order by p.createDate desc ";
        // 
        Session session = this.sessionFactory.getCurrentSession();
        Query<ProductInfo> query = session.createQuery(sql, ProductInfo.class);
 
        if (likeCode != null && likeCode.length() > 0) {
            query.setParameter("likeCode", "%" + likeCode.toLowerCase() + "%");
        }
        return new PaginationResult<ProductInfo>(query, page, maxResult, maxNavigationPage);
    }
 
    public PaginationResult<ProductInfo> queryProductsCode(int page, int maxResult, int maxNavigationPage) {
        return queryProductsCode(page, maxResult, maxNavigationPage, null);
    }
    
    public PaginationResult<ProductInfo> queryCategory(int page, int maxResult, int maxNavigationPage,
            String likeCategory) {
        String sql = "Select new " + ProductInfo.class.getName() //
                + "(p.code, p.name, p.price, p.company, p.category, p.subcategory, p.catname, p.description, p.tags) " + " from "//
                + Product.class.getName() + " p ";
        if (likeCategory != null && likeCategory.length() > 0) {
            sql += " Where lower(p.category) like :likeCategory ";
        }
        sql += " order by p.createDate desc ";
        // 
        Session session = this.sessionFactory.getCurrentSession();
        Query<ProductInfo> query = session.createQuery(sql, ProductInfo.class);
 
        if (likeCategory != null && likeCategory.length() > 0) {
            query.setParameter("likeCategory", "%" + likeCategory.toLowerCase() + "%");
        }
        return new PaginationResult<ProductInfo>(query, page, maxResult, maxNavigationPage);
    }
 
    public PaginationResult<ProductInfo> queryCategory(int page, int maxResult, int maxNavigationPage) {
        return queryCategory(page, maxResult, maxNavigationPage, null);
    }
    public PaginationResult<ProductInfo> queryTags(int page, int maxResult, int maxNavigationPage,
            String likeTags) {
        String sql = "Select new " + ProductInfo.class.getName() //
                + "(p.code, p.name, p.price, p.company, p.category, p.subcategory, p.catname, p.description, p.tags) " + " from "//
                + Product.class.getName() + " p ";
        if (likeTags != null && likeTags.length() > 0) {
            sql += " Where lower(p.tags) like :likeTags";
        }
        sql += " order by p.createDate desc ";
        // 
        Session session = this.sessionFactory.getCurrentSession();
        Query<ProductInfo> query = session.createQuery(sql, ProductInfo.class);
 
        if (likeTags != null && likeTags.length() > 0) {
            query.setParameter("likeTags", "%" + likeTags.toLowerCase() + "%");
        }
        return new PaginationResult<ProductInfo>(query, page, maxResult, maxNavigationPage);
    }
 
    public PaginationResult<ProductInfo> querySearch(int page, int maxResult, int maxNavigationPage) {
        return queryCategory(page, maxResult, maxNavigationPage, null);
    }
}