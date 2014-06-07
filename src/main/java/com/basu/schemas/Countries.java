package com.basu.schemas;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="Country")
@Table(name="COUNTRY")
public class Countries implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected int id;
	protected String country_code;
	protected String country_name;
	
	@Id
	@Column( name="ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Basic
	@Column(name="COUNTRY_CODE")
	public String getCountry_code() {
		return country_code;
	}
	

	public void setCountry_code(String country_code) {
		this.country_code = country_code;
	}
	
	@Basic
	@Column(name="COUNTRY_NAME")
	public String getCountry_name() {
		return country_name;
	}
	public void setCountry_name(String country_name) {
		this.country_name = country_name;
	}
	
	public String toString(){
		return id + ":"+country_code+":"+country_name;
	}
	
	
}