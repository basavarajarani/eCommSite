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
