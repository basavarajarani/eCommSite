package com.basu.schemas;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

@Entity(name="Authorities")
@Table(name="AUTHORITIES")
@Inheritance(strategy = InheritanceType.JOINED)
public class Authorities implements Serializable {


	protected String userName;
	protected String authority;
	protected Long hjid;

	@Id
    @Column(name = "HJID")
    @GeneratedValue(strategy = GenerationType.AUTO)
	public Long getHjid() {
		return hjid;
	}
	public void setHjid(Long hjid) {
		this.hjid = hjid;
	}

	
	@Basic
	@Column(name="USERNAME", length = 255)
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Basic
	@Column(name="AUTHORITY", length=255)
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
}
