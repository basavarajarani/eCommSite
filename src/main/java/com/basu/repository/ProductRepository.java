package com.basu.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.basu.schemas.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {

	@Query ("select p from Product p where p.productCategory.categoryHierarchy like :categoryHierarchy%" )
	Page<Product> getAllProductsForACategoryHierarchy(@Param("categoryHierarchy")String categoryHierarchy, Pageable pageRequest);
	
	Page<Product> findByProductNameContaining(String productName, Pageable pageRequest);

	Page<Product> findByFeaturedProductTrue(Pageable pageRequest);
}
