
package com.basu.schemas;

import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity(name = "ProductCategory")
@Table(name = "PRODUCTCATEGORY")
@Inheritance(strategy = InheritanceType.JOINED)
public class ProductCategory
    implements Serializable
{


    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected String categoryName;
    protected Set<ProductCategory> subCategories;
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
    @JoinColumn(name = "SUBCATEGORY_PARENTPRODUCTCATEGORY_ID")
    public Set<ProductCategory> getSubCategories() {
        if (subCategories == null) {
            subCategories = new HashSet<ProductCategory>();
        }
        return this.subCategories;
    }

    public void setSubCategories(Set<ProductCategory> subCategories) {
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
    @JoinColumn(name = "PRODUCTCATEGORY_PARENTCATEGORY_ID")
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
