package org.yukado.sbshoppingcart.form;

import org.springframework.web.multipart.MultipartFile;
import org.yukado.sbshoppingcart.entity.Product;
 
public class ProductForm {
    private String code;
    private String name;
    private double price;
    private String company;
    private String category;
    private String subcategory;
    private String catname;
    private String description;
    private String tags;
 
    private boolean newProduct = false;
 
    // Upload file.
    private MultipartFile fileData1;
    private MultipartFile fileData2;
    private MultipartFile fileData3;
 
    public ProductForm() {
        this.newProduct= true;
    }
 
    public ProductForm(Product product) {
        this.code = product.getCode();
        this.name = product.getName();
        this.price = product.getPrice();
        this.company = product.getCompany();
        this.category = product.getCategory();
        this.subcategory = product.getSubcategory();
        this.catname = product.getCatname();
        this.description = product.getDescription();
        this.tags = product.getTags();
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

	public MultipartFile getFileData1() {
		return fileData1;
	}

	public void setFileData1(MultipartFile fileData1) {
		this.fileData1 = fileData1;
	}

	public MultipartFile getFileData2() {
		return fileData2;
	}

	public void setFileData2(MultipartFile fileData2) {
		this.fileData2 = fileData2;
	}

	public MultipartFile getFileData3() {
		return fileData3;
	}

	public void setFileData3(MultipartFile fileData3) {
		this.fileData3 = fileData3;
	}

	public boolean isNewProduct() {
        return newProduct;
    }
 
    public void setNewProduct(boolean newProduct) {
        this.newProduct = newProduct;
    }
 
}
