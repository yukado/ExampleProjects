package org.yukado.sbshoppingcart.form;

import org.yukado.sbshoppingcart.entity.Subcat;
 
public class SubcatForm {
    private String code;
    private String subcat;
    private String catnameadd;
 
    private boolean newSubcat = false;
 
    public SubcatForm() {
        this.newSubcat= true;
    }
 
    public SubcatForm(Subcat subcat) {
        this.code = subcat.getCode();
        this.subcat = subcat.getSubcat();
        this.catnameadd = subcat.getCatnameadd();

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

	public boolean isNewSubcat() {
        return newSubcat;
    }

	public String getCatnameadd() {
		return catnameadd;
	}

	public void setCatnameadd(String catnameadd) {
		this.catnameadd = catnameadd;
	}
    public void setNewSubcat(boolean newSubcat) {
        this.newSubcat = newSubcat;
    }

 
}
