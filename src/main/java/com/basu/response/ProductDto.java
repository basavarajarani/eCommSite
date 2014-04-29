package com.basu.response;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;




public class ProductDto implements Serializable{
	
	private Long id;
	private String name;
	private String category;
	private BigDecimal price;
	private BigDecimal weight;
	private String shortDesc;
	private String longDesc;
	private Date updatedate;
	private BigInteger stock;
	private String productimage;
	private String thumbnails;
	private String additionalimages;
	private String weightclass;

	private String lengthclass;
	private String length;
	private String height;
	private String width;
	
	
	
	
	
	
	public String getWeightclass() {
		return weightclass;
	}
	public void setWeightclass(String weightclass) {
		this.weightclass = weightclass;
	}
	public String getLengthclass() {
		return lengthclass;
	}
	public void setLengthclass(String lengthclass) {
		this.lengthclass = lengthclass;
	}
	public String getLength() {
		return length;
	}
	public void setLength(String length) {
		this.length = length;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWidth() {
		return width;
	}
	public void setWidth(String width) {
		this.width = width;
	}
	public String getAdditionalimages() {
		return additionalimages;
	}
	public void setAdditionalimages(String additionalimages) {
		this.additionalimages = additionalimages;
	}
	public String getProductimage() {
		return productimage;
	}
	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public BigDecimal getWeight() {
		return weight;
	}
	public void setWeight(BigDecimal weight) {
		this.weight = weight;
	}
	public String getShortDesc() {
		return shortDesc;
	}
	public void setShortDesc(String shortDesc) {
		this.shortDesc = shortDesc;
	}
	public String getLongDesc() {
		return longDesc;
	}
	public void setLongDesc(String longDesc) {
		this.longDesc = longDesc;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public BigInteger getStock() {
		return stock;
	}
	public void setStock(BigInteger stock) {
		this.stock = stock;
	}

	public String getThumbnails() {
		return thumbnails;
	}
	public void setThumbnails(String thumbnails) {
		this.thumbnails = thumbnails;
	}
}
