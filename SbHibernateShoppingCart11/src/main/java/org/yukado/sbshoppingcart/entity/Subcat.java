package org.yukado.sbshoppingcart.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity
@Table(name = "Subcat")
public class Subcat implements Serializable {
 
    private static final long serialVersionUID = -1000119078147252957L;
 
    @Id
    @Column(name = "Code", length = 20, nullable = false)
    private String code;
 
    @Column(name = "Subcat", length = 255, nullable = false)
    private String subcat;
    
    @Column(name = "Catnameadd", length = 255, nullable = false)
    private String catnameadd;
    
    public Subcat() {
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