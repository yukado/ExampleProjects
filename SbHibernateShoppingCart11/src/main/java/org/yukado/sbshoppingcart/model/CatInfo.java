package org.yukado.sbshoppingcart.model;

import org.yukado.sbshoppingcart.entity.Cat;

public class CatInfo {
    private String code;
    private String cat;
 
    public CatInfo() {
    }
 
    public CatInfo(Cat cat) {
        this.code = cat.getCode();
        this.cat = cat.getCat();

    }
 
    // Using in JPA/Hibernate query
    public CatInfo(String code, String cat) {
        this.code = code;
        this.cat = cat;

    }

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCat() {
		return cat;
	}

	public void setCat(String cat) {
		this.cat = cat;
	}
 
}
