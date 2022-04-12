package org.yukado.sbshoppingcart.model;

import org.yukado.sbshoppingcart.entity.Subcat;

public class SubcatInfo {
    private String code;
    private String subcat;
    private String catnameadd;
 
    public SubcatInfo() {
    }
 
    public SubcatInfo(Subcat subcat) {
        this.code = subcat.getCode();
        this.subcat = subcat.getSubcat();
        this.catnameadd = subcat.getCatnameadd();

    }
 
    // Using in JPA/Hibernate query
    public SubcatInfo(String code, String subcat, String catnameadd) {
        this.code = code;
        this.subcat = subcat;
        this.catnameadd = catnameadd;
    }

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getSubcat() {
		return subcat;
	}

	public void setSubcat(String subcat) {
		this.subcat = subcat;
	}

	public String getCatnameadd() {
		return catnameadd;
	}

	public void setCatnameadd(String catnameadd) {
		this.catnameadd = catnameadd;
	}
}
