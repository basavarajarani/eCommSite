package com.basu.controller;

import java.util.HashSet;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.basu.common.JqgridFilter;
import com.basu.common.JqgridObjectMapper;
import com.basu.common.ProductCategoryUtil;
import com.basu.mappers.ProductCategoryMapper;
import com.basu.response.JqgridResponse;
import com.basu.response.ProductCategoryDto;
import com.basu.response.StatusResponse;
import com.basu.schemas.ProductCategory;
import com.basu.service.ECommService;


@Controller
public class ProductCategoryController {

	@Autowired
	public ECommService eCommService;

	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="createProductCategory", method=RequestMethod.GET)
	public ModelAndView getCreateProductCategoryForm()
	{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("AdminView");
		modelAndView.addObject("module","ProductCategory");
		modelAndView.addObject("productCategory",new ProductCategory());
		return modelAndView;
	}



	/*	@RequestMapping(value="get_productCategory_list", method = RequestMethod.GET)
	public @ResponseBody Set<String> getProductCategoryList()
	{
		System.out.println("Entering get_productCategory_list");
		Set<ProductCategory> prodCatList =  this.eCommService.getProductCategoryDao().getUniqueProductCategories();
		Set<String> prodCatStringList = new HashSet<String>();
		for (int i =0;i<prodCatList.size();i++)
		{
				prodCatStringList.add(prodCatList.get(i).getCategoryName());
		}
		System.out.println("Returning:"+prodCatStringList);
		return prodCatStringList;
	}*/

	@RequestMapping(value="get_productCategory_list", method = RequestMethod.GET)
	public @ResponseBody Set<String> getProductCategoryList()
	{
		Set<String> productCategoryListToJson = new HashSet<String>();
		System.out.println("Entering get_productCategory_list");
		//		Set<ProductCategory> prodCatList =  this.eCommService.getProductCategoryDao().getUniqueProductCategories();
		Set<ProductCategory> productCategoryListFromDb = this.eCommService.getAllTopLevelProductCategories();

		for (ProductCategory productCategory :productCategoryListFromDb)
		{
			ProductCategoryUtil.allProductCategoryBuildTree(productCategory.getSubCategories(), productCategoryListToJson,productCategory.getCategoryName(),false);
		}
		
/*		String output = "<select>";
		for (int i = 0;i<productCategoryListToJson.size();i++)
			output += "<option value='"+productCategoryListToJson.get(i)+"'>"+productCategoryListToJson.get(i)+"</option>";
		//	if (productCategoryListToJson.size()==0)
		output += "<option value=''>"*/
		productCategoryListToJson.add("");
		System.out.println(productCategoryListToJson);
		return productCategoryListToJson;
	}
	
	@RequestMapping(value="get_productCategory_listmap", method=RequestMethod.GET)
	public @ResponseBody Map<String, Set<String>> get_productCategory_listmap()
	{
		Set<String> productCategoryListToJson = getProductCategoryList();
		Map<String, Set<String>> productCategoryListMapToJson = new Hashtable<String, Set<String>>();
		productCategoryListMapToJson.put("items", productCategoryListToJson);
		return productCategoryListMapToJson;
	}


	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="createProductCategory",method=RequestMethod.POST)
	public @ResponseBody StatusResponse createProductCategory (
			@RequestParam(value="categoryname") String categoryName,
			@RequestParam(value="categoryhierarchy") String categoryHierarchy) {
		System.out.println("Invoking createProductCategory with categoryName:"+categoryName+" and categoryHierarchy:"+categoryHierarchy);
		ProductCategory productCategory = new ProductCategory();
		if (categoryHierarchy.isEmpty())
			productCategory.setCategoryHierarchy(categoryName);
		else
			productCategory.setCategoryHierarchy(categoryHierarchy+"->"+categoryName);
		productCategory.setCategoryName(categoryName);
		String result = this.eCommService.createProductCategory(productCategory,categoryHierarchy);
		/*TBD : Correct the error messaging */
		return new StatusResponse(true,result);
	}




	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value ="addProductCategory", method = RequestMethod.POST)
	@ResponseBody
	public String addProductCategory(@ModelAttribute("productCategory") ProductCategory productCategory, ModelMap model){
		System.out.println(productCategory.getCategoryName()+" "+productCategory.getParentCategory().getCategoryName());
		if (productCategory.getParentCategory().getCategoryName().isEmpty())
			productCategory.setParentCategory(null);
		return(this.eCommService.createProductCategory(productCategory,productCategory.getParentCategory().getCategoryName()));
	}

	


	@Secured("ROLE_ADMIN")
	@RequestMapping(value="productcategoryrecords", produces="application/json")
	public @ResponseBody JqgridResponse<ProductCategoryDto> getProductCategoryRecords(
			@RequestParam("_search") Boolean search,
			@RequestParam(value="filters", required=false) String filters,
			@RequestParam(value="page", required=false) Integer page,
			@RequestParam(value="rows", required=false) Integer rows,
			@RequestParam(value="sidx", required=false) String sidx,
			@RequestParam(value="sord", required=false) String sord)
			{

		System.out.println("Invoking getProductCategoryRecords with parameters filters:"+filters+" page:"+page.intValue()+
				" rows:"+rows.intValue()+" sidx:"+sidx+" sord:"+sord +" _search:"+search);
		Pageable pageRequest = new PageRequest(page-1, rows);

		if (search==true) {
			return getFilteredRecords(filters, pageRequest);
		}

		Page<ProductCategory> productCategories = this.eCommService.getAllProductCategories(pageRequest);;
		Set<ProductCategoryDto> productCategoryDtoList = ProductCategoryMapper.map(productCategories);
		JqgridResponse<ProductCategoryDto> jqGridResponse = new JqgridResponse<ProductCategoryDto>();
		jqGridResponse.setRows(productCategoryDtoList);
		jqGridResponse.setRecords(Long.valueOf(productCategories.getTotalElements()).toString());
		jqGridResponse.setTotal(Integer.valueOf(productCategories.getTotalPages()).toString());
		jqGridResponse.setPage(Integer.valueOf(productCategories.getNumber()+1).toString());
		return jqGridResponse;

			}

	private JqgridResponse<ProductCategoryDto> getFilteredRecords(
			String filters, Pageable pageRequest) {
		// TODO Auto-generated method stub

		String qCategoryName = null;

		JqgridFilter jqgridFilter = JqgridObjectMapper.map(filters);
		for (JqgridFilter.Rule rule: jqgridFilter.getRules()) {
			if (rule.getField().equals("categoryname"))
				qCategoryName = rule.getData();
		}

		Page<ProductCategory> productCategories = null;
		if (qCategoryName != null)
		{
			productCategories = this.eCommService.getProductCategoriesLike(qCategoryName,pageRequest);
		}


		Set<ProductCategoryDto> productCategoryDtoList = ProductCategoryMapper.map(productCategories);
		JqgridResponse<ProductCategoryDto> jqGridResponse = new JqgridResponse<ProductCategoryDto>();
		jqGridResponse.setRows(productCategoryDtoList);
		jqGridResponse.setRecords(Long.valueOf(productCategories.getTotalElements()).toString());
		jqGridResponse.setTotal(Integer.valueOf(productCategories.getTotalPages()).toString());
		jqGridResponse.setPage(Integer.valueOf(productCategories.getNumber()+1).toString());
		return jqGridResponse;
	}

}
