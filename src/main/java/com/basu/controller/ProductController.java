package com.basu.controller;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.WordUtils;
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

import com.basu.common.JqgridFilter;
import com.basu.common.JqgridObjectMapper;
import com.basu.mappers.ProductMapper;
import com.basu.response.JqgridResponse;
import com.basu.response.ProductDto;
import com.basu.response.StatusResponse;
import com.basu.response.W2UIFormProductResponse;
import com.basu.schemas.Attributes;
import com.basu.schemas.Image;
import com.basu.schemas.Product;
import com.basu.schemas.ProductCategory;
import com.basu.schemas.ProductDimensions;
import com.basu.schemas.ProductDimensions.LengthClass;
import com.basu.schemas.ProductDimensions.WeightClass;
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
		modelAndView.setViewName("AdminView");
		modelAndView.addObject("module","ProductOperationsForm");
		return modelAndView;
	}

	@Secured ("ROLE_ADMIN")
	@RequestMapping(value="getProductRecordsJqGrid", produces="application/json")
	public @ResponseBody JqgridResponse<ProductDto> getProductRecordsJqGrid(
			@RequestParam("_search") Boolean search,
			@RequestParam(value="filters", required=false) String filters,
			@RequestParam(value="page", required=false) Integer page,
			@RequestParam(value="rows", required=false) Integer rows,
			@RequestParam(value="sidx", required=false) String sidx,
			@RequestParam(value="sord", required=false) String sord) throws Exception

			{
		System.out.println("Invoking getProductRecords () for page:"+page.intValue()+" rows:"+rows.intValue()+" sidx:"+sidx+" sord:"+sord+" filters:"+filters);
		Pageable pageRequest = new PageRequest(page-1, rows);

		if (search==true) {
			return getFilteredProductRecords(filters, sidx, sord, pageRequest);
		}

		Page<Product> products = this.eCommService.getAllProducts(pageRequest,sidx,sord);
		Set<ProductDto> productDtoList = ProductMapper.map(products);
		JqgridResponse<ProductDto> jqGridResponse = new JqgridResponse<ProductDto>();
		jqGridResponse.setRows(productDtoList);
		jqGridResponse.setRecords(Long.valueOf(products.getTotalElements()).toString());
		jqGridResponse.setTotal(Integer.valueOf(products.getTotalPages()).toString());
		jqGridResponse.setPage(Integer.valueOf(products.getNumber()+1).toString());
		return jqGridResponse;

			}

	private JqgridResponse<ProductDto> getFilteredProductRecords(String filters,String sidx, String sord,
			Pageable pageRequest) throws Exception {
		// TODO Auto-generated method stub
		
		String productName = null;

		JqgridFilter jqgridFilter = JqgridObjectMapper.map(filters);
		String functionName = "findBy";
		String parameterValue = "";
		for (JqgridFilter.Rule rule: jqgridFilter.getRules()) {
				functionName += WordUtils.capitalize(rule.getField())+"Containing";
				parameterValue = rule.getData();
		}
		
		Page<Product> products = this.eCommService.getAllProducts(pageRequest,sidx,sord,functionName,parameterValue);
		Set<ProductDto> productDtoList = ProductMapper.map(products);
		JqgridResponse<ProductDto> jqGridResponse = new JqgridResponse<ProductDto>();
		jqGridResponse.setRows(productDtoList);
		jqGridResponse.setRecords(Long.valueOf(products.getTotalElements()).toString());
		jqGridResponse.setTotal(Integer.valueOf(products.getTotalPages()).toString());
		jqGridResponse.setPage(Integer.valueOf(products.getNumber()+1).toString());
		return jqGridResponse;
		
	}

	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="productCreationPage", method=RequestMethod.GET)
	public ModelAndView getProductCreationPage()
	{

		System.out.println("Invoking getProductCreationPage");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("AdminView");
		modelAndView.addObject("module","ProductCreationPage");
		return modelAndView;
	}


/*	@Transactional
	@RequestMapping(value="/products/category={categoryId}/page={pageId}", method=RequestMethod.GET)
	public @ResponseBody ModelAndView getProductsFromCategoryId(@PathVariable String categoryId, @PathVariable String pageId) {

		System.out.println("Request for products from categoryid:"+categoryId);
		int intPageId = Integer.valueOf(pageId).intValue();

		Pageable pageRequest = new PageRequest(intPageId-1, 10);

		Page<Product> products = this.eCommService.getAllProductsForACategory(categoryId,pageRequest);
		//Page<Product> products = this.eCommService.getAllProducts(pageRequest);

		Set<ProductDto> productDtoList = ProductMapper.map(products);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("MainView");
		modelAndView.addObject("module", "ProductsListingForm");
		modelAndView.addObject("products",productDtoList);
		modelAndView.addObject("totalelements",Long.valueOf(products.getTotalElements()).toString());
		modelAndView.addObject("totalpages",Integer.valueOf(products.getTotalPages()).toString());
		modelAndView.addObject("pagenumber",Integer.valueOf(products.getNumber()+1).toString());

		return modelAndView;
	}*/
	
	@Transactional
	@RequestMapping(value="/products/category={categoryId}/page={pageId}", method=RequestMethod.GET)
	public @ResponseBody Set<ProductDto> getProductsFromCategoryId(@PathVariable String categoryId, @PathVariable String pageId) {

		System.out.println("Request for products from categoryid:"+categoryId);
		int intPageId = Integer.valueOf(pageId).intValue();

		Pageable pageRequest = new PageRequest(intPageId-1, 9);

		Page<Product> products = this.eCommService.getAllProductsForACategory(categoryId,pageRequest);
		//Page<Product> products = this.eCommService.getAllProducts(pageRequest);

		Set<ProductDto> productDtoList = ProductMapper.map(products);


		return productDtoList;
	}
	
	@Transactional
	@RequestMapping(value="getFeaturedProducts", method=RequestMethod.GET)
	public @ResponseBody Set<ProductDto> getFeaturedProducts(){
		Pageable pageRequest = new PageRequest(0, 9);
		Page<Product> products = this.eCommService.getAllFeaturedProducts(pageRequest);
		Set<ProductDto> productDtoList = ProductMapper.map(products);
		return productDtoList;
	}

	@Transactional
	@RequestMapping(value="/products/id={productId}", method=RequestMethod.GET)
	public @ResponseBody ProductDto getProductFromProductId(@PathVariable int productId){
		Product product = this.eCommService.getProductById(productId);
		ProductDto productDto = ProductMapper.map(product);
		return productDto;
		
	}
	
	@Transactional
	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="getProductById", method=RequestMethod.GET, produces="application/json")
	public @ResponseBody W2UIFormProductResponse getProductById(
			@RequestParam(value="cmd") String cmd,
			@RequestParam(value="recid") int recid){

		Product product = this.eCommService.getProductById(recid);
		W2UIFormProductResponse w2uiProduct = ProductMapper.map2w2ui(product);
		w2uiProduct.setStatus("success");
		return w2uiProduct;
	}

	@Transactional
	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="addProductNewAPI",method=RequestMethod.POST, produces="application/json")
	public @ResponseBody Set<String> addProductNewAPI(
			HttpServletRequest request,
			@RequestParam(value="cmd") String cmd,
			@RequestParam(value="name") String name,
			@RequestParam(value="recid") int recid,
			@RequestParam(value="category") String categoryHierarchy,
			@RequestParam(value="height") float height,
			@RequestParam(value="length") float length,
			@RequestParam(value="lengthclass") String lengthClass,
			@RequestParam(value="longDesc") String longDesc,
			@RequestParam(value="price") float price,
			@RequestParam(value="productname") String productName,
			@RequestParam(value="shortDesc") String shortDesc,
			@RequestParam(value="weight") float weight,
			@RequestParam(value="weightclass") String weightClass,
			@RequestParam(value="width") float width,
			@RequestParam(value="additionalimages") String additionalImagesText,
			@RequestParam(value="mainimage") String mainImage,
			@RequestParam(value="attributes") String attributes,
			@RequestParam(value="featuredproduct") boolean featuredProduct){

		System.out.println("cmd:"+cmd);
		System.out.println("name:"+name);
		System.out.println("Record:"+request.getQueryString());
		System.out.println("cmd="+cmd+" name="+name+" recid="+recid+" category="+categoryHierarchy+" height="+height+
				" length="+length+" lengthclass="+lengthClass+" longDesc="+longDesc+" price="+price+
				" productname="+productName+" shortDesc="+shortDesc+" weight="+weight+" weightclass="+weightClass+
				" width="+width+" mainimage="+mainImage);

		if (cmd.contains("mod-record")) {
			/* Modify the record */
			Product product = this.eCommService.getProductById(recid);

			product.setProductName(productName);
			product.setProductShortDesc(shortDesc);
			product.setProductLongDesc(longDesc);
			product.setProductPrice(new BigDecimal(price));

			/* Handle the dimensions part */
			ProductDimensions dimensions = product.getProductDimensions();
			if (dimensions==null) {
				dimensions = new ProductDimensions();
				product.setProductDimensions(dimensions);
			}

			dimensions.setLengthClass(LengthClass.valueOf(lengthClass));
			dimensions.setHeight(height);
			dimensions.setLength(length);
			dimensions.setWidth(width);
			dimensions.setWeightClass(WeightClass.valueOf(weightClass));
			dimensions.setWeight(weight);

			/* Handle the Product Category part */

			ProductCategory productCategory = this.eCommService.getProductCategoryFromHierarchy(categoryHierarchy);
			product.setProductCategory(productCategory);
			
			/* Handle the main image part */
			Image mainImageImg = new Image();
			mainImageImg.setImageFullSizeUrl(mainImage);
			product.setMainImage(mainImageImg);
			
			/* Handle additional Images */
			String []additionalImagesTextItems = additionalImagesText.split("::");
			
			if (additionalImagesTextItems.length > 0) 
			{		
				Set<Image> additionalImages = new HashSet<Image>();

				for (int i = 0;i<additionalImagesTextItems.length;i++) {
					if (!additionalImagesTextItems[i].trim().isEmpty()) {
						Image image = new Image();
						image.setImageFullSizeUrl(additionalImagesTextItems[i]);
						additionalImages.add(image);
					}
				}
				
				if (product.getAdditionalImages()!=null){
					product.getAdditionalImages().clear();
					product.getAdditionalImages().addAll(additionalImages);
				} else {
					product.setAdditionalImages(additionalImages);
				}
				
				
			}
			
			/* Handle the attributes */
			if (!attributes.isEmpty()){
				Set<Attributes> productAttributes = new HashSet<Attributes>();
				String[]attributeList = attributes.split("::");
				for (int i =0;i<attributeList.length;i++){
					String []attributeValue = attributeList[i].split("-->");
					Attributes attribute = new Attributes();
					attribute.setName(attributeValue[0]);
					attribute.setValue(attributeValue[1]);
					productAttributes.add(attribute);
				}
				if (product.getAttributes()!=null){
					product.getAttributes().clear();
					product.getAttributes().addAll(productAttributes);
				} else {
					product.setAttributes(productAttributes);
				}
			}
			product.setFeaturedProduct(featuredProduct);
			

			String result = this.eCommService.addProductRecord(product);
			Set<String> returnString = new HashSet<String>();
			returnString.add(result);
			return returnString;
		} 

		Product product = new Product();
		ProductCategory productCategory = this.eCommService.getProductCategoryFromHierarchy(categoryHierarchy);
		product.setProductCategory(productCategory);

		ProductDimensions dimensions = new ProductDimensions();
		/*			if (lengthClass.equalsIgnoreCase("centemeter"))
				dimensions.setLengthClass(LengthClass.Centemeter);
			else if (lengthClass.equalsIgnoreCase("milimeter"))
				dimensions.setLengthClass(LengthClass.Milimeter);
			else if (lengthClass.equalsIgnoreCase("inch"))
				dimensions.setLengthClass(LengthClass.Inch);*/
		dimensions.setLengthClass(LengthClass.valueOf(lengthClass));

		dimensions.setHeight(height);
		dimensions.setLength(length);
		dimensions.setWidth(width);

		/*			if (weightClass.equalsIgnoreCase("kilogram"))
				dimensions.setWeightClass(WeightClass.Kilogram);
			else if (weightClass.equalsIgnoreCase("gram"))
				dimensions.setWeightClass(WeightClass.Gram);
			else if (weightClass.equalsIgnoreCase("pound"))
				dimensions.setWeightClass(WeightClass.Pound);
			else if (weightClass.equalsIgnoreCase("ounce"))
				dimensions.setWeightClass(WeightClass.Ounce);*/

		dimensions.setWeightClass(WeightClass.valueOf(weightClass));
		dimensions.setWeight(weight);

		product.setProductDimensions(dimensions);

		product.setProductLongDesc(longDesc);
		product.setProductShortDesc(shortDesc);
		product.setProductPrice(new BigDecimal(price));
		product.setProductName(productName);

		/* Handle Images */
		String []additionalImagesTextItems = additionalImagesText.split("::");

		if (additionalImagesTextItems.length > 0) 
		{		
			Set<Image> additionalImages = new HashSet<Image>();

			for (int i = 0;i<additionalImagesTextItems.length;i++) {
				if (!additionalImagesTextItems[i].trim().isEmpty()) {
					Image image = new Image();
					image.setImageFullSizeUrl(additionalImagesTextItems[i]);
					additionalImages.add(image);
				}
			}
			product.setAdditionalImages(additionalImages);
		}
		
		/* Handle the attributes */
		if (!attributes.isEmpty()){
			Set<Attributes> productAttributes = new HashSet<Attributes>();
			String[]attributeList = attributes.split("::");
			for (int i =0;i<attributeList.length;i++){
				String []attributeValue = attributeList[i].split("-->");
				Attributes attribute = new Attributes();
				attribute.setName(attributeValue[0]);
				attribute.setValue(attributeValue[1]);
				productAttributes.add(attribute);
			}
			product.setAttributes(productAttributes);
		}
		
		product.setFeaturedProduct(featuredProduct);

		String result = this.eCommService.addProductRecord(product);
		Set<String> returnString = new HashSet<String>();
		returnString.add(result);
		return returnString;
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
