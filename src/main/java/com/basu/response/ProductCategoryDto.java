package com.basu.response;

import java.io.Serializable;


@SuppressWarnings("serial")
public class ProductCategoryDto implements Serializable {
	
	private Long id;
	private String categoryname;
	private String parentcategory;
	private String categoryhierarchy;
	
	public Long getId() {
		return id;
	}
	public void setId(Long long1) {
		this.id = long1;
	}
	public String getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	public String getParentcategory() {
		return parentcategory;
	}
	public void setParentcategory(String parentcategory) {
		this.parentcategory = parentcategory;
	}
	public String getCategoryhierarchy() {
		return categoryhierarchy;
	}
	public void setCategoryhierarchy(String categoryhierarchy) {
		this.categoryhierarchy = categoryhierarchy;
	}

}
