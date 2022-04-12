package org.yukado.sbshoppingcart.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity
@Table(name = "Accounts")
public class Account implements Serializable {
 
    private static final long serialVersionUID = -2054386655979281969L;
 
    public static final String ROLE_MANAGER = "MANAGER";
    public static final String ROLE_EMPLOYEE = "EMPLOYEE";
   
    @Id
    @Column(name = "User_Name", length = 20, nullable = false)
    private String userName;
 
    @Column(name = "Encryted_Password", length = 128, nullable = false)
    private String encrytedPassword;
 
    @Column(name = "Active", length = 1, nullable = false)
    private boolean active;
 
    @Column(name = "User_Role", length = 20, nullable = false)
    private String userRole;
    
    @Column(name = "User_Vorname", length = 20, nullable = false)
    private String userVorname;
    
    @Column(name = "User_Nachname", length = 20, nullable = false)
    private String userNachname;
    
    @Column(name = "User_Strasse", length = 20, nullable = false)
    private String userStrasse;
    
    @Column(name = "User_Hausnummer", length = 20, nullable = false)
    private String userHausnummer;
    
    @Column(name = "User_PLZ", length = 20, nullable = false)
    private String userPLZ;
    
    @Column(name = "User_ORT", length = 20, nullable = false)
    private String userOrt;
    
    @Column(name = "User_Telefon", length = 20, nullable = false)
    private String userTelefon;
    
    @Column(name = "User_Email", length = 20, nullable = false)
    private String userEmail;
    
    public String getUserName() {
        return userName;
    }
 
    public void setUserName(String userName) {
        this.userName = userName;
    }
 
    public String getEncrytedPassword() {
        return encrytedPassword;
    }
 
    public void setEncrytedPassword(String encrytedPassword) {
        this.encrytedPassword = encrytedPassword;
    }
 
    public boolean isActive() {
        return active;
    }
 
    public void setActive(boolean active) {
        this.active = active;
    }
 
    public String getUserRole() {
        return userRole;
    }
 
    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }
    
 
    public String getUserVorname() {
		return userVorname;
	}

	public void setUserVorname(String userVorname) {
		this.userVorname = userVorname;
	}

	public String getUserNachname() {
		return userNachname;
	}

	public void setUserNachname(String userNachname) {
		this.userNachname = userNachname;
	}

	public String getUserStrasse() {
		return userStrasse;
	}

	public void setUserStrasse(String userStrasse) {
		this.userStrasse = userStrasse;
	}

	public String getUserHausnummer() {
		return userHausnummer;
	}

	public void setUserHausnummer(String userHausnummer) {
		this.userHausnummer = userHausnummer;
	}

	public String getUserPLZ() {
		return userPLZ;
	}

	public void setUserPLZ(String userPLZ) {
		this.userPLZ = userPLZ;
	}

	public String getUserTelefon() {
		return userTelefon;
	}

	public void setUserTelefon(String userTelefon) {
		this.userTelefon = userTelefon;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserOrt() {
		return userOrt;
	}

	public void setUserOrt(String userOrt) {
		this.userOrt = userOrt;
	}

	@Override
    public String toString() {
        return "[" + this.userName + "," + this.encrytedPassword + "," + this.userRole + "]";
    }
 
}
