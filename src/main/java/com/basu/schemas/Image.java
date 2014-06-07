package com.basu.schemas;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="Image")
@Table(name="IMAGE")
public class Image implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected long id;
	protected String imageName;
	protected String imageThumbnailUrl;
	protected String imageFullSizeUrl;
	
	
	@Basic
	@Column(name="IMAGETHUMBNAILURL")
	public String getImageThumbnailUrl() {
		return imageThumbnailUrl;
	}
	public void setImageThumbnailUrl(String imageThumbnailUrl) {
		this.imageThumbnailUrl = imageThumbnailUrl;
	}
	
	@Basic
	@Column(name="IMAGEFULLSIZEURL")
	public String getImageFullSizeUrl() {
		return imageFullSizeUrl;
	}
	public void setImageFullSizeUrl(String imageFullSizeUrl) {
		this.imageFullSizeUrl = imageFullSizeUrl;
	}
	
	@Id
	@Column(name="ID")
	@GeneratedValue(strategy = GenerationType.AUTO)	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	@Basic
	@Column(name="IMAGENAME")
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
		
}
