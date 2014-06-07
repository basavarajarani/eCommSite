package com.basu.schemas;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="Attributes")
@Table(name="ATTRIBUTES")
public class Attributes implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected int id;
	protected String name;
	protected String value;
	
	@Id
	@Column(name="ID")
	@GeneratedValue(strategy = GenerationType.AUTO)	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Basic
	@Column(name="NAME")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Basic
	@Column(name="VALUE")
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
}