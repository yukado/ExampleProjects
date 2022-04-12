package org.yukado.sbshoppingcart.model;

import org.yukado.sbshoppingcart.entity.Account;

public class AccountInfo {

	private String userName;
	private String encrytedPassword;
	private boolean active;
	private String userRole;
	private String userVorname;
	private String userNachname;
	private String userStrasse;
	private String userHausnummer;
	private String userPLZ;
	private String userOrt;
	private String userTelefon;
	private String userEmail;

	public static final String ROLE_MANAGER = "MANAGER";
    public static final String ROLE_EMPLOYEE = "EMPLOYEE";


public AccountInfo() {
	
}
public AccountInfo(Account account) {

	this.userName = account.getUserName();
	this.encrytedPassword = account.getEncrytedPassword();
	this.active = account.isActive();
	this.userRole = account.getUserRole();
	this.userVorname = account.getUserVorname();
	this.userNachname = account.getUserNachname();
	this.userStrasse = account.getUserStrasse();
	this.userHausnummer = account.getUserHausnummer();
	this.userPLZ = account.getUserPLZ();
	this.userOrt = account.getUserOrt();
	this.userTelefon = account.getUserTelefon();
	this.userEmail = account.getUserEmail();
}

public AccountInfo (String userName, String encrytedPassword, boolean active, String userRole, String userVorname, String userNachname, String userStrasse,
		String userHausnummer, String userPLZ, String userOrt, String userTelefon, String userEmail) {

	this.userName = userName;
	this.encrytedPassword = encrytedPassword;
	this.active = active;
	this.userRole = userRole;
	this.userVorname = userVorname;
	this.userNachname = userNachname;
	this.userStrasse = userStrasse;
	this.userHausnummer = userHausnummer;
	this.userPLZ = userPLZ;
	this.userOrt = userOrt;
	this.userTelefon = userTelefon;
	this.userEmail = userEmail;
}

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
}