package com.basu.mappers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.basu.response.ProductDto;
import com.basu.response.W2UIFormProductResponse;
import com.basu.schemas.Image;
import com.basu.schemas.Product;
import com.basu.schemas.ProductDimensions;

public class ProductMapper {

	public static List<ProductDto> map(Page<Product> products) {
		// TODO Auto-generated method stub

		List<ProductDto> productDtoList = new ArrayList<ProductDto>();

		for (Product product: products) {
			ProductDto productDto = new ProductDto();
			productDto.setId(product.getHjid());
			productDto.setName(product.getProductName());
			if (product.getProductCategory() != null)
				productDto.setCategory(product.getProductCategory().getCategoryHierarchy());
			productDto.setPrice(product.getProductPrice());
			productDto.setWeight(product.getProductWeight());
			productDto.setShortDesc(product.getProductShortDesc());
			productDto.setLongDesc(product.getProductLongDesc());
			productDto.setUpdatedate(product.getProductUpdateDateItem());
			productDto.setStock(product.getProductStock());
			if (product.getMainImage() != null)
			{
				productDto.setProductimage(product.getMainImage().getImageFullSizeUrl());
				productDto.setThumbnails(product.getMainImage().getImageThumbnailUrl());
			}
			productDtoList.add(productDto);
		}
		return productDtoList;
	}

	public static W2UIFormProductResponse map2w2ui(Product product) {

		W2UIFormProductResponse w2uiProduct = new W2UIFormProductResponse();
		if (product.getProductCategory()!=null){
			w2uiProduct.getRecord().setCategory(product.getProductCategory().getCategoryHierarchy());
		}

		if (product.getProductDimensions()!=null){
			ProductDimensions dimensions = product.getProductDimensions();
			w2uiProduct.getRecord().setHeight(dimensions.getHeight());
			w2uiProduct.getRecord().setLength(dimensions.getLength());
			w2uiProduct.getRecord().setLengthclass(dimensions.getLengthClass().name());
			
			w2uiProduct.getRecord().setWidth(dimensions.getWidth());
			
			w2uiProduct.getRecord().setWeightclass(dimensions.getWeightClass().name());
			w2uiProduct.getRecord().setWeight(dimensions.getWeight());
		}
		
		w2uiProduct.getRecord().setLongDesc(product.getProductLongDesc());
		w2uiProduct.getRecord().setShortDesc(product.getProductShortDesc());
		w2uiProduct.getRecord().setProductname(product.getProductName());
		w2uiProduct.getRecord().setPrice(product.getProductPrice().floatValue());
		String additionalImagesText = "";
		if (product.getAdditionalImages()!=null && product.getAdditionalImages().size()>0) {
			List<Image> additionalImages = product.getAdditionalImages();
			for (Image image : additionalImages){
				additionalImagesText += image.getImageFullSizeUrl()+"::";
			}
			additionalImagesText = additionalImagesText.substring(0, additionalImagesText.lastIndexOf("::")-1);
		}
		w2uiProduct.getRecord().setAdditionalImages(additionalImagesText);
		return w2uiProduct;
	}
}
