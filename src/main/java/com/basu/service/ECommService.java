package com.basu.service;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.WordUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.basu.repository.AuthoritiesRepository;
import com.basu.repository.CountriesRepository;
import com.basu.repository.ProductCategoryRepository;
import com.basu.repository.ProductRepository;
import com.basu.repository.UserRepository;
import com.basu.schemas.Authorities;
import com.basu.schemas.Countries;
import com.basu.schemas.Product;
import com.basu.schemas.ProductCategory;
import com.basu.schemas.User;

@Service
@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class ECommService {
	
	@Autowired
	private CountriesRepository countriesRepository;

	@Autowired
	private ProductCategoryRepository productCategoryRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private AuthoritiesRepository authoritiesRepository;

	@Autowired
	private ProductRepository productRepository;

	public String createProductCategory(ProductCategory productCategory, String categoryHierarchy) {

		String parentCategoryName = categoryHierarchy;

		if (!parentCategoryName.isEmpty())
		{
			ProductCategory parentCategory = null;
			String [] parentCategoryNameParts = parentCategoryName.split("->");
			String topMostParentCategoryName = parentCategoryNameParts[0];
			//ProductCategory parentCategory = productCategoryDao.getProductCategory(parentCategoryName);
			ProductCategory topMostParentProductCategory = productCategoryRepository.find(topMostParentCategoryName);
			if (topMostParentProductCategory == null)
			{
				return "Parent Category "+parentCategoryName +" Cannot be found";
			}
			
			/* Traverse and get the last parent category in the tree */
			if (parentCategoryNameParts.length>1) {
				
					parentCategory = retrieveParentProductCategoryFromTree(topMostParentProductCategory,parentCategoryNameParts,1);
				
			} else {
				parentCategory = topMostParentProductCategory;
			}
			System.out.println("Setting parent Category :"+parentCategory.getCategoryName());
			
			productCategory.setParentCategory(parentCategory);
			if (parentCategory.getSubCategories()==null)
				parentCategory.setSubCategories(new ArrayList<ProductCategory>());
			parentCategory.getSubCategories().add(productCategory);
		}
//		productCategoryDao.addNewProductCategory(productCategory);
		productCategoryRepository.save(productCategory);
		return "Product Category "+productCategory.getCategoryName()+" with parent category "+parentCategoryName +" Successfully Created";
	}

	private ProductCategory retrieveParentProductCategoryFromTree(
			ProductCategory immediateParentProductCategory, String[] parentCategoryNameParts, int parentCategoryNamePartsCount) {

			{
				List<ProductCategory> subCategories = immediateParentProductCategory.getSubCategories();
				
				if (parentCategoryNamePartsCount+1 > parentCategoryNameParts.length )
				{
					System.out.println("Returning immediateParentProductCategory:"+immediateParentProductCategory.getCategoryName());
					return immediateParentProductCategory;
				}
				for (int subCatCount = 0;subCatCount<subCategories.size();subCatCount++){
					ProductCategory subCategory = subCategories.get(subCatCount);
					if (subCategory.getCategoryName().equals(parentCategoryNameParts[parentCategoryNamePartsCount]))
					{
						System.out.println("Invoking for :"+subCategory.getCategoryName()+" partsCount:"+
										parentCategoryNamePartsCount+":length:"+parentCategoryNameParts.length);
						return retrieveParentProductCategoryFromTree(subCategory, parentCategoryNameParts, ++parentCategoryNamePartsCount);
					}
				}
			}
			System.out.println("Coming Here");
			return null;
	}
	
	@Transactional
	public String createNewUserSignup(User user, Authorities authority) throws Exception{

		
		if (this.authoritiesRepository.exists(authority.getUserName()))
			throw new Exception("User already exists");
		
		this.authoritiesRepository.save(authority);
		User newUser = this.userRepository.save(user);

		if (newUser != null)
			return "User created with the id:"+newUser.getHjid();
		else
			return "User creation failed";
	}
	
	@Transactional
	public String addUserFromAdmin(User user) throws Exception {
		if (this.userRepository.findByUserNameLike(user.getUserName())!=null)
				throw new Exception ("User Name already exists");
		
		User newUser = this.userRepository.saveAndFlush(user);
		
		if (newUser != null)
			return "User created with the id:"+newUser.getHjid();
		else
			return "User creation failed";
		
	}

	public List<ProductCategory> getAllTopLevelProductCategories() {
		// TODO Auto-generated method stub
		return productCategoryRepository.findAllTopLevelProductCategories();
	}

	public Page<ProductCategory> getAllProductCategories(Pageable pageRequest) {
		// TODO Auto-generated method stub
		return productCategoryRepository.findAll(pageRequest);
	}

	public Page<ProductCategory> getProductCategoriesLike(String qCategoryName, Pageable pageRequest) {
		// TODO Auto-generated method stub
		return productCategoryRepository.findAllByCategoryNameContainingLike(qCategoryName, pageRequest);
	}
	
	public User getUserByUserName(String userName){
		return(this.userRepository.findByUserNameLike(userName));
	}

	public Page<User> getAllUsers(Pageable pageRequest) {
		// TODO Auto-generated method stub
		return userRepository.findAll(pageRequest);
	}

	public String retrieveAllCountries() {
		// TODO Auto-generated method stub
		List<Countries> countryList = this.countriesRepository.findAll();
		String countrySelectString = "<select>";
		for (int i = 0 ; i<countryList.size();i++)
			countrySelectString += "<option value='"+countryList.get(i).getCountry_name()+"'>"+countryList.get(i).getCountry_name()+"</option>";
		countrySelectString+= "</select>";
		return countrySelectString;
	}

	public Page<Product> getAllProducts(Pageable pageRequest, String sidx, String sord) {
		// TODO Auto-generated method stub
		System.out.println("retrieving all Products from DB");
		
/*		String functionName = "findBy"+WordUtils.initials(sidx)+"OrderBy"+WordUtils.initials(sidx)+WordUtils.capitalize(sord);
		Class productRepositoryClass = this.productRepository.getClass();
		Method method = productRepositoryClass.getMethod(functionName, null);*/
		final PageRequest pageReq = new PageRequest(pageRequest.getPageNumber(),pageRequest.getPageSize(),new Sort(new Order(Direction.valueOf(sord.toUpperCase()),sidx)));
		return this.productRepository.findAll(pageReq);
	}

	public ProductCategory getProductCategoryFromHierarchy(
			String categoryHierarchy) {
		// TODO Auto-generated method stub
		return this.productCategoryRepository.findByCategoryHierarchyLike(categoryHierarchy);

	}

	public String addProductRecord(Product product) {
		
		Product newProduct = this.productRepository.saveAndFlush(product);
		if (newProduct != null)
			return "Product created Successfully with id:"+newProduct.getHjid();
		else
			return "Product creation failed";

	}

	public Page<Product> getAllProductsForACategory(String categoryId, Pageable pageRequest) {
		// TODO Auto-generated method stub
		/* First get the category with the id = categoryId */
		
		ProductCategory productCategory = this.productCategoryRepository.findOne(Long.valueOf(categoryId));
		String categoryHierarchy = productCategory.getCategoryHierarchy();
		
		Page<Product> products = this.productRepository.getAllProductsForACategoryHierarchy(categoryHierarchy, pageRequest);
		return products;
	}

	public Product getProductById(int recid) {
		// TODO Auto-generated method stub
		return this.productRepository.findOne(new Long(recid));
	}

	public Page<Product> getAllProducts(Pageable pageRequest, String sidx,
			String sord, String functionName,String parameterValue) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("Invoking function:"+functionName+ " with param:"+parameterValue);
		Method method = null;
		
		Method[] methods = ProductRepository.class.getMethods();

		for(Method method1 : methods){
		    System.out.println("method = " + method1.getName());
		}
		try {
		Class productRepositoryClass = Class.forName("com.basu.repository.ProductRepository");
		 method = productRepositoryClass.getMethod(functionName, String.class, Pageable.class);
		} catch (Exception e){
			e.printStackTrace();
			throw e;
		}
		final PageRequest pageReq = new PageRequest(pageRequest.getPageNumber(),pageRequest.getPageSize(),new Sort(new Order(Direction.valueOf(sord.toUpperCase()),sidx)));
		System.out.println("Hello");
		Page<Product> pageReturn = null;
		try{
		 pageReturn = (Page<Product>) method.invoke(productRepository,parameterValue,pageReq);
		} catch(Exception e){
			e.printStackTrace();
			throw e;
		}
		System.out.println("number of records:"+pageReturn.getNumberOfElements());
		return pageReturn;
	}

	public Page<Product> getAllFeaturedProducts(Pageable pageRequest) {
		// TODO Auto-generated method stub
		return this.productRepository.findByFeaturedProductTrue(pageRequest);
	}

}
