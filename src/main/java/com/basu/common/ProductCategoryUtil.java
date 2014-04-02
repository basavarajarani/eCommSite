package com.basu.common;

import java.util.List;

import org.hibernate.Hibernate;

import com.basu.response.SideTreeNode;
import com.basu.schemas.ProductCategory;

public class ProductCategoryUtil {

	public static void allProductCategoryBuildTree(
			List<ProductCategory> subCategories, List<String> productCategoryListToJson, String productCategoryTree, boolean includePcId) {
		// TODO Auto-generated method stub
		
		productCategoryListToJson.add(productCategoryTree);
		
		if (subCategories == null || subCategories.size() == 0)
		{
			return;
		}
		for (int i =0;i<subCategories.size();i++)
		{
			ProductCategory productCategory = subCategories.get(i);
			/*Hibernate.initialize(productCategory.getSubCategories());*/
			if (includePcId)
				allProductCategoryBuildTree(productCategory.getSubCategories(),
						productCategoryListToJson,productCategoryTree+"->"+productCategory.getCategoryName()+"::"+productCategory.getHjid(),includePcId);
			else
				allProductCategoryBuildTree(productCategory.getSubCategories(),
						productCategoryListToJson,productCategoryTree+"->"+productCategory.getCategoryName(),includePcId);
		}
		return;
	}
	
	public static String singleProductCategoryBuildTreeBackwards(ProductCategory productCategory) {
		
		String name = productCategory.getCategoryName();
		String parentTree = "";
		
		if (productCategory.getParentCategory()!=null)
		{
			parentTree = singleProductCategoryBuildTreeBackwards(productCategory.getParentCategory());
		}
		if (parentTree.isEmpty())
			return name;
		else
			return parentTree+"->"+name;
	
	}

	public static void allProductCategoryBuildSideTree(ProductCategory pc,
			List<SideTreeNode> sideTreeNodeList) {
		
		int pcId = pc.getHjid().intValue();
		
		if (pc.getSubCategories() != null && pc.getSubCategories().size()>0){
			List<ProductCategory> subCategories = pc.getSubCategories();
			for (int i = 0 ;i<subCategories.size();i++){
				ProductCategory subCategory = subCategories.get(i);
				SideTreeNode sideTreeNode = new SideTreeNode();
				sideTreeNode.setId(subCategory.getHjid().intValue());
				sideTreeNode.setpId(pcId);
				sideTreeNode.setName(subCategory.getCategoryName());
				sideTreeNodeList.add(sideTreeNode);
				
				allProductCategoryBuildSideTree(subCategory,sideTreeNodeList);
			}
		}
			
		// TODO Auto-generated method stub
		
	}

}
