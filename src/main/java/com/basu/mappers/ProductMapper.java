package com.basu.mappers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.basu.response.ProductDto;
import com.basu.schemas.Product;

public class ProductMapper {

	public static List<ProductDto> map(Page<Product> products) {
		// TODO Auto-generated method stub
		
		List<ProductDto> productDtoList = new ArrayList<ProductDto>();
		
		for (Product product: products) {
			ProductDto productDto = new ProductDto();
			productDto.setId(product.getHjid());
			productDto.setName(product.getProductName());
			productDto.setCategory(product.getProductCategory().getCategoryHierarchy());
			productDto.setPrice(product.getProductPrice());
			productDto.setWeight(product.getProductWeight());
			productDto.setShortDesc(product.getProductShortDesc());
			productDto.setLongDesc(product.getProductLongDesc());
			productDto.setUpdatedate(product.getProductUpdateDateItem());
			productDto.setStock(product.getProductStock());
			productDto.setProductimage(product.getMainImage().getImageFullSizeUrl());
			productDto.setThumbnails(product.getMainImage().getImageThumbnailUrl());
			productDtoList.add(productDto);
		}
		return productDtoList;
	}
}
