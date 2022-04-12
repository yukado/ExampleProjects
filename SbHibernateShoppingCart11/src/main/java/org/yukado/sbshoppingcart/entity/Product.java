package org.yukado.sbshoppingcart.entity;

import java.io.Serializable;
import java.util.Date;
 
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

 
@Entity
@Table(name = "Products")
public class Product implements Serializable {
 
    private static final long serialVersionUID = -1000119078147252957L;
 
    @Id
    @Column(name = "Code", length = 20, nullable = false)
    private String code;
 
    @Column(name = "Name", length = 255, nullable = false)
    private String name;
    
    @Column(name = "Company", length = 255, nullable = false)
    private String company;
    
    @Column(name = "Category", length = 255, nullable = false)
    private String category;
    
    @Column(name = "Subcategory", length = 255, nullable = false)
    private String subcategory;
    
    @Column(name = "Catname", length = 255, nullable = false)
    private String catname;
    
    @Column(name = "Description", length = 255, nullable = false)
    private String description;
    
    @Column(name = "Tags", length = 255, nullable = false)
    private String tags;
    
    @Column(name = "Price", nullable = false)
    private double price;
 
    @Lob
    @Column(name = "Image1", length = Integer.MAX_VALUE, nullable = true)
    private byte[] image1;
    
    @Lob
    @Column(name = "Image2", length = Integer.MAX_VALUE, nullable = true)
    private byte[] image2;
    
    @Lob
    @Column(name = "Image3", length = Integer.MAX_VALUE, nullable = true)
    private byte[] image3;
    
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "Create_Date", nullable = false)
    private Date createDate;
 
    public Product() {
    }

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubcategory() {
		return subcategory;
	}

	public String getCatname() {
		return catname;
	}

	public void setCatname(String catname) {
		this.catname = catname;
	}

	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public byte[] getImage1() {
		return image1;
	}

	public void setImage1(byte[] image1) {
		this.image1 = image1;
	}

	public byte[] getImage2() {
		return image2;
	}

	public void setImage2(byte[] image2) {
		this.image2 = image2;
	}

	public byte[] getImage3() {
		return image3;
	}

	public void setImage3(byte[] image3) {
		this.image3 = image3;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

 
}