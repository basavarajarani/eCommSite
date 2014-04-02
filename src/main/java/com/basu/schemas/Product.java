//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.4 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2014.03.18 at 12:05:13 PM EST 
//


package com.basu.schemas;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
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
import javax.persistence.OneToOne;
import javax.persistence.OrderColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.datatype.XMLGregorianCalendar;
import org.jvnet.hyperjaxb3.xml.bind.annotation.adapters.XMLGregorianCalendarAsDate;
import org.jvnet.hyperjaxb3.xml.bind.annotation.adapters.XmlAdapterUtils;
import org.jvnet.jaxb2_commons.lang.Equals;
import org.jvnet.jaxb2_commons.lang.EqualsStrategy;
import org.jvnet.jaxb2_commons.lang.HashCode;
import org.jvnet.jaxb2_commons.lang.HashCodeStrategy;
import org.jvnet.jaxb2_commons.lang.JAXBEqualsStrategy;
import org.jvnet.jaxb2_commons.lang.JAXBHashCodeStrategy;
import org.jvnet.jaxb2_commons.locator.ObjectLocator;
import org.jvnet.jaxb2_commons.locator.util.LocatorUtils;

@Entity(name = "Product")
@Table(name = "PRODUCT")
@Inheritance(strategy = InheritanceType.JOINED)
public class Product
    implements Serializable
{
    protected String productSKU;
    protected String productName;
    protected BigDecimal productPrice;
    protected BigDecimal productWeight;
    protected String productShortDesc;
    protected String productLongDesc;
    protected XMLGregorianCalendar productUpdateDate;
    protected BigInteger productStock;
    protected ProductCategory productCategory;
    protected Long hjid;
    protected Image mainImage;
    protected List<Image> additionalImages;
    protected ProductDimensions productDimensions;
    
    
    
    @OneToOne(fetch=FetchType.EAGER, cascade=CascadeType.ALL)
    @JoinColumn(name="product_dimension_id")
    public ProductDimensions getProductDimensions() {
		return productDimensions;
	}

	public void setProductDimensions(ProductDimensions productDimensions) {
		this.productDimensions = productDimensions;
	}

	@OneToOne(fetch=FetchType.EAGER, cascade= CascadeType.ALL)
    @JoinColumn(name="image_id")
    public Image getMainImage() {
		return mainImage;
	}

	public void setMainImage(Image mainImage) {
		this.mainImage = mainImage;
	}

    @OneToMany(fetch=FetchType.EAGER, targetEntity = Image.class, cascade = {
        CascadeType.ALL
    })
    @JoinColumn(name = "IMAGELIST_PRODUCT__HJID")
    @OrderColumn(name = "IMAGELIST_HJIMAGE")
	public List<Image> getAdditionalImages() {
		return additionalImages;
	}

	public void setAdditionalImages(List<Image> additionalImages) {
		this.additionalImages = additionalImages;
	}


	/**
     * Gets the value of the productSKU property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Basic
    @Column(name = "PRODUCTSKU", length = 255)
    public String getProductSKU() {
        return productSKU;
    }

    /**
     * Sets the value of the productSKU property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setProductSKU(String value) {
        this.productSKU = value;
    }

    @Transient
    public boolean isSetProductSKU() {
        return (this.productSKU!= null);
    }

    /**
     * Gets the value of the productName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Basic
    @Column(name = "PRODUCTNAME", length = 255)
    public String getProductName() {
        return productName;
    }

    /**
     * Sets the value of the productName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setProductName(String value) {
        this.productName = value;
    }

    @Transient
    public boolean isSetProductName() {
        return (this.productName!= null);
    }

    /**
     * Gets the value of the productPrice property.
     * 
     * @return
     *     possible object is
     *     {@link BigDecimal }
     *     
     */
    @Basic
    @Column(name = "PRODUCTPRICE", precision = 20, scale = 10)
    public BigDecimal getProductPrice() {
        return productPrice;
    }

    /**
     * Sets the value of the productPrice property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigDecimal }
     *     
     */
    public void setProductPrice(BigDecimal value) {
        this.productPrice = value;
    }

    @Transient
    public boolean isSetProductPrice() {
        return (this.productPrice!= null);
    }

    /**
     * Gets the value of the productWeight property.
     * 
     * @return
     *     possible object is
     *     {@link BigDecimal }
     *     
     */
    @Basic
    @Column(name = "PRODUCTWEIGHT", precision = 20, scale = 10)
    public BigDecimal getProductWeight() {
        return productWeight;
    }

    /**
     * Sets the value of the productWeight property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigDecimal }
     *     
     */
    public void setProductWeight(BigDecimal value) {
        this.productWeight = value;
    }

    @Transient
    public boolean isSetProductWeight() {
        return (this.productWeight!= null);
    }

    /**
     * Gets the value of the productShortDesc property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Basic
    @Column(name = "PRODUCTSHORTDESC", length = 255)
    public String getProductShortDesc() {
        return productShortDesc;
    }

    /**
     * Sets the value of the productShortDesc property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setProductShortDesc(String value) {
        this.productShortDesc = value;
    }

    @Transient
    public boolean isSetProductShortDesc() {
        return (this.productShortDesc!= null);
    }

    /**
     * Gets the value of the productLongDesc property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Basic
    @Column(name = "PRODUCTLONGDESC", length = 255)
    public String getProductLongDesc() {
        return productLongDesc;
    }

    /**
     * Sets the value of the productLongDesc property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setProductLongDesc(String value) {
        this.productLongDesc = value;
    }

    @Transient
    public boolean isSetProductLongDesc() {
        return (this.productLongDesc!= null);
    }

    /**
     * Gets the value of the productUpdateDate property.
     * 
     * @return
     *     possible object is
     *     {@link XMLGregorianCalendar }
     *     
     */
    @Transient
    public XMLGregorianCalendar getProductUpdateDate() {
        return productUpdateDate;
    }

    /**
     * Sets the value of the productUpdateDate property.
     * 
     * @param value
     *     allowed object is
     *     {@link XMLGregorianCalendar }
     *     
     */
    public void setProductUpdateDate(XMLGregorianCalendar value) {
        this.productUpdateDate = value;
    }

    @Transient
    public boolean isSetProductUpdateDate() {
        return (this.productUpdateDate!= null);
    }

    /**
     * Gets the value of the productStock property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    @Basic
    @Column(name = "PRODUCTSTOCK", precision = 20, scale = 0)
    public BigInteger getProductStock() {
        return productStock;
    }

    /**
     * Sets the value of the productStock property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setProductStock(BigInteger value) {
        this.productStock = value;
    }

    @Transient
    public boolean isSetProductStock() {
        return (this.productStock!= null);
    }

    /**
     * Gets the value of the productCategory property.
     * 
     * @return
     *     possible object is
     *     {@link ProductCategory }
     *     
     */
    @ManyToOne(targetEntity = ProductCategory.class, cascade = {
        CascadeType.ALL
    })
    @JoinColumn(name = "PRODUCTCATEGORY_PRODUCT_HJID")
    public ProductCategory getProductCategory() {
        return productCategory;
    }

    /**
     * Sets the value of the productCategory property.
     * 
     * @param value
     *     allowed object is
     *     {@link ProductCategory }
     *     
     */
    public void setProductCategory(ProductCategory value) {
        this.productCategory = value;
    }

    @Transient
    public boolean isSetProductCategory() {
        return (this.productCategory!= null);
    }

    /**
     * Gets the value of the hjid property.
     * 
     * @return
     *     possible object is
     *     {@link Long }
     *     
     */
    @Id
    @Column(name = "HJID")
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getHjid() {
        return hjid;
    }

    /**
     * Sets the value of the hjid property.
     * 
     * @param value
     *     allowed object is
     *     {@link Long }
     *     
     */
    public void setHjid(Long value) {
        this.hjid = value;
    }

    @Basic
    @Column(name = "PRODUCTUPDATEDATEITEM")
    @Temporal(TemporalType.DATE)
    public Date getProductUpdateDateItem() {
        return XmlAdapterUtils.unmarshall(XMLGregorianCalendarAsDate.class, this.getProductUpdateDate());
    }

    public void setProductUpdateDateItem(Date target) {
        setProductUpdateDate(XmlAdapterUtils.marshall(XMLGregorianCalendarAsDate.class, target));
    }
}
