package com.basu.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.basu.schemas.ProductCategory;

@Component
public class ProductCategoryDaoImpl implements ProductCategoryDao{

	
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public List<ProductCategory> getUniqueProductCategories() {
		// TODO Auto-generated method stub
		String queryString = "select distinct(prodCat) from ProductCategory prodCat left join fetch prodCat.parentCategory";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		@SuppressWarnings("unchecked")
		List<ProductCategory> prodCatList = (List<ProductCategory>)query.list();
		return prodCatList;
	}

	@Override
	public boolean addNewProductCategory(ProductCategory productCategory) {
		// TODO Auto-generated method stub

		sessionFactory.getCurrentSession().save(productCategory);
		return true;
	}

	@Override
	public ProductCategory getProductCategory(String productCategoryName) {
		// TODO Auto-generated method stub
		String queryString = "select prodCat from ProductCategory prodCat where CategoryName=:categoryNameValue";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		query.setParameter("categoryNameValue", productCategoryName);
		List<ProductCategory> prodCatList = query.list();
		if (prodCatList!=null && prodCatList.size()>0)
			return prodCatList.get(0);
		return null;
	}

}
