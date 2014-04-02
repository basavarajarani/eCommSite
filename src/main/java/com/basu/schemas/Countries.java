package com.basu.schemas;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="Countries")
@Table(name="Countries")
public class Countries implements Serializable
{
	protected int id;
	protected String country_code;
	protected String country_name;
	
	@Id
	@Column( name="id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Basic
	@Column(name="country_code")
	public String getCountry_code() {
		return country_code;
	}
	

	public void setCountry_code(String country_code) {
		this.country_code = country_code;
	}
	
	@Basic
	@Column(name="country_name")
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