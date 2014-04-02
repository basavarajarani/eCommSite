package com.basu.controller;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.basu.mappers.ProductMapper;
import com.basu.response.JqgridResponse;
import com.basu.response.ProductDto;
import com.basu.response.StatusResponse;
import com.basu.schemas.Image;
import com.basu.schemas.Product;
import com.basu.schemas.ProductCategory;
import com.basu.service.ECommService;

@Controller
public class ProductController {

	@Autowired
	private ECommService eCommService;

	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="productoperations", method=RequestMethod.GET)
	public ModelAndView getProductOperationsForm()
	{
		
		System.out.println("Invoking getProductOperationsForm");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("MainView");
		modelAndView.addObject("module","ProductOperationsForm");
		return modelAndView;
	}

	@Secured ("ROLE_ADMIN")
	@RequestMapping(value="getproductrecords", produces="application/json")
	public @ResponseBody JqgridResponse<ProductDto> getProductRecords(
			@RequestParam("_search") Boolean search,
			@RequestParam(value="filters", required=false) String filters,
			@RequestParam(value="page", required=false) Integer page,
			@RequestParam(value="rows", required=false) Integer rows,
			@RequestParam(value="sidx", required=false) String sidx,
			@RequestParam(value="sord", required=false) String sord)

	{
		System.out.println("Invoking getProductRecords () for page:"+page.intValue()+" rows:"+rows.intValue());
		Pageable pageRequest = new PageRequest(page-1, rows);

		if (search==true) {
			return getFilteredProductRecords(filters, pageRequest);
		}

		Page<Product> products = this.eCommService.getAllProducts(pageRequest);
		List<ProductDto> productDtoList = ProductMapper.map(products);
		JqgridResponse<ProductDto> jqGridResponse = new JqgridResponse<ProductDto>();
		jqGridResponse.setRows(productDtoList);
		jqGridResponse.setRecords(Long.valueOf(products.getTotalElements()).toString());
		jqGridResponse.setTotal(Integer.valueOf(products.getTotalPages()).toString());
		jqGridResponse.setPage(Integer.valueOf(products.getNumber()+1).toString());
		return jqGridResponse;

	}

	private JqgridResponse<ProductDto> getFilteredProductRecords(String filters,
			Pageable pageRequest) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="productCreationForm", method=RequestMethod.GET)
	public ModelAndView getProductCreationForm()
	{
		
		System.out.println("Invoking getProductOperationsForm");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("MainView");
		modelAndView.addObject("module","ProductCreationForm");
		return modelAndView;
	}
	

	@Transactional
	@RequestMapping(value="/products/category={categoryId}/page={pageId}", method=RequestMethod.GET)
	public @ResponseBody ModelAndView getProductsFromCategoryId(@PathVariable String categoryId, @PathVariable String pageId) {
		
		System.out.println("Request for products from categoryid:"+categoryId);
		int intPageId = Integer.valueOf(pageId).intValue();
		
		Pageable pageRequest = new PageRequest(intPageId-1, 10);
		
		Page<Product> products = this.eCommService.getAllProductsForACategory(categoryId,pageRequest);
		//Page<Product> products = this.eCommService.getAllProducts(pageRequest);
		
		List<ProductDto> productDtoList = ProductMapper.map(products);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("MainView");
		modelAndView.addObject("module", "ProductsListingForm");
		modelAndView.addObject("products",productDtoList);
		modelAndView.addObject("totalelements",Long.valueOf(products.getTotalElements()).toString());
		modelAndView.addObject("totalpages",Integer.valueOf(products.getTotalPages()).toString());
		modelAndView.addObject("pagenumber",Integer.valueOf(products.getNumber()+1).toString());
		
		return modelAndView;
	}
	
	@Transactional
	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="addProductRecords", method=RequestMethod.POST)
	public @ResponseBody StatusResponse addProductRecords(
			@RequestParam(value="name") String name,
			@RequestParam(value="category") String category,
			@RequestParam(value="price") String price,
			@RequestParam(value="weight") String weight,
			@RequestParam(value="shortdesc") String shortDesc,
			@RequestParam(value="longdesc") String longDesc,
			@RequestParam(value="updatedate") String updateDate,
			@RequestParam(value="productimage") String productImage
			) throws Exception {
		System.out.println("Invoked addProductRecords image:"+productImage);

		Product product = new Product();
		product.setProductName(name);
		ProductCategory productCategory = this.eCommService.getProductCategoryFromHierarchy(category);
		System.out.println("ProductCategory:"+productCategory.getCategoryName());
		product.setProductCategory(productCategory);
		product.setProductPrice(new BigDecimal(Integer.valueOf(price).intValue()));
		product.setProductWeight(new BigDecimal(Integer.valueOf(weight).intValue()));
		product.setProductShortDesc(shortDesc);
		product.setProductLongDesc(longDesc);
		Image image = new Image();
		image.setImageFullSizeUrl(productImage);
		product.setMainImage(image);
		String result = this.eCommService.addProductRecord(product);
		
		System.out.println("Result of product creation:"+result);

		return new StatusResponse(true,result);
	}	
}
