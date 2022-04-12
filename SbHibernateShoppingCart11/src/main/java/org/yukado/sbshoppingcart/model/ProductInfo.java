package org.yukado.sbshoppingcart.model;

import org.yukado.sbshoppingcart.entity.Product;

public class ProductInfo {
    private String code;
    private String name;
    private double price;
    private String company;
    private String category;
    private String subcategory;
    private String catname;
    private String description;
    private String tags;
 
    public ProductInfo() {
    }
 
    public ProductInfo(Product product) {
        this.code = product.getCode();
        this.name = product.getName();
        this.price = product.getPrice();
        this.company = product.getCompany();
        this.category = product.getCategory();
        this.catname = product.getCatname();
        this.subcategory = product.getSubcategory();
        this.description = product.getDescription();
        this.tags = product.getTags();
    }
 
    // Using in JPA/Hibernate query
    public ProductInfo(String code, String name, double price, String company, String category, String subcategory, String catname, String description, String tags) {
        this.code = code;
        this.name = name;
        this.price = price;
        this.company = company;
        this.category = category;
        this.subcategory = subcategory;
        this.catname = catname;
        this.description = tags;
        this.tags = tags;
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

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
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

	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}

	public String getCatname() {
		return catname;
	}

	public void setCatname(String catname) {
		this.catname = catname;
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
 
}
