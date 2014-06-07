package com.basu.mappers;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.data.domain.Page;

import com.basu.common.ProductCategoryUtil;
import com.basu.response.ProductCategoryDto;
import com.basu.schemas.ProductCategory;

public class ProductCategoryMapper {
	
	
	
	
	public static ProductCategoryDto map(ProductCategory productCategory){
		
		ProductCategoryDto productCategoryDto = new ProductCategoryDto();
		
		productCategoryDto.setId(productCategory.getHjid());
		productCategoryDto.setCategoryname(productCategory.getCategoryName());
		if (productCategory.getParentCategory()!= null)
			productCategoryDto.setParentcategory(productCategory.getParentCategory().getCategoryName());
		productCategoryDto.setCategoryhierarchy(productCategory.getCategoryHierarchy());
		//productCategoryDto.setCategoryhierarchy(ProductCategoryUtil.singleProductCategoryBuildTreeBackwards(productCategory));
		return productCategoryDto;
	}
	
	public static Set<ProductCategoryDto> map(Page<ProductCategory> productCategoryList){
		Set<ProductCategoryDto> prodCatDtoList = new HashSet<ProductCategoryDto>();
		for (ProductCategory pc : productCategoryList){
			prodCatDtoList.add(map(pc));
		}
		return prodCatDtoList;
		
	}
	

}
