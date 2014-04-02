package com.basu.dao;

import java.util.List;

import com.basu.schemas.ProductCategory;

public interface ProductCategoryDao {

	public List<ProductCategory> getUniqueProductCategories();
	public boolean addNewProductCategory(ProductCategory productCategory);
	public ProductCategory getProductCategory(String parentCategoryName);
}
