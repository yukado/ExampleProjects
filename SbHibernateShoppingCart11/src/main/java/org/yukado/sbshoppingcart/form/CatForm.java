package org.yukado.sbshoppingcart.form;

import org.yukado.sbshoppingcart.entity.Cat;
 
public class CatForm {
    private String code;
    private String cat;

 
    private boolean newCat = false;
 
    public CatForm() {
        this.newCat= true;
    }
 
    public CatForm(Cat cat) {
        this.code = cat.getCode();
        this.cat = cat.getCat();

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

	public boolean isNewCat() {
        return newCat;
    }
 
    public void setNewCat(boolean newCat) {
        this.newCat = newCat;
    }
 
}
