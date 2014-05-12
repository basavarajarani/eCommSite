package com.basu.response;

public class W2UIFormProductResponse {
	
	private String status;
	
	private Record record;
	
	public W2UIFormProductResponse() {
		record = new Record();
	}
	
	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public Record getRecord() {
		return record;
	}



	public void setRecord(Record record) {
		this.record = record;
	}



	public class Record {
		private String category; 
		private float height; 
		private float length; 
		private String lengthclass; 
		private String longDesc; 
		private float price; 
		private String productname; 
		private String shortDesc; 
		private float weight; 
		private String weightclass; 
		private float width;
		private String mainImage;
		private String additionalImages;
		
		
		
		public String getAdditionalImages() {
			return additionalImages;
		}
		public void setAdditionalImages(String additionalImages) {
			this.additionalImages = additionalImages;
		}
		public String getCategory() {
			return category;
		}
		public void setCategory(String category) {
			this.category = category;
		}
		public float getHeight() {
			return height;
		}
		public void setHeight(float height) {
			this.height = height;
		}
		public float getLength() {
			return length;
		}
		public void setLength(float length) {
			this.length = length;
		}
		public String getLengthclass() {
			return lengthclass;
		}
		public void setLengthclass(String lengthclass) {
			this.lengthclass = lengthclass;
		}
		public String getLongDesc() {
			return longDesc;
		}
		public void setLongDesc(String longDesc) {
			this.longDesc = longDesc;
		}
		public float getPrice() {
			return price;
		}
		public void setPrice(float price) {
			this.price = price;
		}
		public String getProductname() {
			return productname;
		}
		public void setProductname(String productname) {
			this.productname = productname;
		}
		public String getShortDesc() {
			return shortDesc;
		}
		public void setShortDesc(String shortDesc) {
			this.shortDesc = shortDesc;
		}
		public float getWeight() {
			return weight;
		}
		public void setWeight(float weight) {
			this.weight = weight;
		}
		public String getWeightclass() {
			return weightclass;
		}
		public void setWeightclass(String weightclass) {
			this.weightclass = weightclass;
		}
		public float getWidth() {
			return width;
		}
		public void setWidth(float width) {
			this.width = width;
		}
		public String getMainImage() {
			return mainImage;
		}
		public void setMainImage(String mainImage) {
			this.mainImage = mainImage;
		} 
		
		
	}

}
