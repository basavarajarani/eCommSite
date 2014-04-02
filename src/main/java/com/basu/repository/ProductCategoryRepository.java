package com.basu.repository;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Component;

import com.basu.schemas.ProductCategory;

@Component
public interface ProductCategoryRepository extends
		JpaRepository<ProductCategory, Long> {
	
	
	Page<ProductCategory> findByCategoryNameLike(String categoryName, Pageable pageable);
	
	public ProductCategory findByCategoryHierarchyLike(String categoryHierarchy);
	
	@Query ("select p from ProductCategory p where lower(p.categoryName) = lower(:categoryName)")
	public ProductCategory find(@Param ("categoryName") String categoryName);

	@Query ("select p from ProductCategory p where p.parentCategory = null")
	public List<ProductCategory> findAllTopLevelProductCategories();
	
	@Query ("select p from ProductCategory p where p.categoryName LIKE %:categoryName%")
	Page<ProductCategory> findAllByCategoryNameContainingLike(@Param("categoryName") String categoryName, Pageable pageable);
	
	@Query ("select p from ProductCategory p where p.categoryHierarchy LIKE :categoryHierarchy%")
	public List<ProductCategory> findAllByCategoryHierarchyLike(@Param("categoryHierarchy") String categoryHierarchy);
}
