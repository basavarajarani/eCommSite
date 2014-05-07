
package com.basu.schemas;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderColumn;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

@Entity(name = "ProductCategory")
@Table(name = "PRODUCTCATEGORY")
@Inheritance(strategy = InheritanceType.JOINED)
public class ProductCategory
    implements Serializable
{


    protected String categoryName;
    protected List<ProductCategory> subCategories;
    protected ProductCategory parentCategory;
    protected Long hjid;
    protected String categoryHierarchy;
    
    public String getCategoryHierarchy() {
		return categoryHierarchy;
	}

	public void setCategoryHierarchy(String categoryHierarchy) {
		this.categoryHierarchy = categoryHierarchy;
	}

	public ProductCategory(){}

    @Basic
    @Column(name = "CATEGORYNAME", length = 255)
    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String value) {
        this.categoryName = value;
    }

    @Transient
    public boolean isSetCategoryName() {
        return (this.categoryName!= null);
    }

    @OneToMany(targetEntity = ProductCategory.class, cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "SUBCATEGORIES_PRODUCTCATEGOR_0")
    @OrderColumn(name="PRODUCTCATEGORIES_SUBCATEGORIES")
    public List<ProductCategory> getSubCategories() {
        if (subCategories == null) {
            subCategories = new ArrayList<ProductCategory>();
        }
        return this.subCategories;
    }

    public void setSubCategories(List<ProductCategory> subCategories) {
        this.subCategories = subCategories;
    }

    @Transient
    public boolean isSetSubCategories() {
        return ((this.subCategories!= null)&&(!this.subCategories.isEmpty()));
    }

    public void unsetSubCategories() {
        this.subCategories = null;
    }

    @ManyToOne(targetEntity = ProductCategory.class)
    @JoinColumn(name = "ProductCategory_ParentCategory")
    public ProductCategory getParentCategory() {
        return parentCategory;
    }

    public void setParentCategory(ProductCategory value) {
        this.parentCategory = value;
    }

    @Transient
    public boolean isSetParentCategory() {
        return (this.parentCategory!= null);
    }

    @Id
    @Column(name = "HJID")
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getHjid() {
        return hjid;
    }

    public void setHjid(Long value) {
        this.hjid = value;
    }

}
