package com.basu.schemas;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="PRODUCTDIMENSIONS")
public class ProductDimensions implements Serializable {
	
	protected int id;

	public enum LengthClass {
		Centemeter,
		Milimeter,
		Inch
	};
	
	public enum WeightClass {
		Kilogram,
		Gram,
		Pound,
		Ounce
	};
	
	protected float weight;
	
	@Enumerated(EnumType.STRING)
	protected WeightClass weightClass;
	
	protected float length;
	protected float width;
	protected float height;
	
	@Enumerated(EnumType.STRING)
	protected LengthClass lengthClass;

	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Basic
	@Column(name="WEIGHT")
	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	
	@Basic
	@Column(name="WEIGHTCLASS")
	public WeightClass getWeightClass() {
		return weightClass;
	}

	public void setWeightClass(WeightClass weightClass) {
		this.weightClass = weightClass;
	}

	@Basic
	@Column(name="LENGTH")
	public float getLength() {
		return length;
	}

	public void setLength(float length) {
		this.length = length;
	}

	@Basic
	@Column(name="WIDTH")
	public float getWidth() {
		return width;
	}

	public void setWidth(float width) {
		this.width = width;
	}

	@Basic
	@Column(name="HEIGHT")
	public float getHeight() {
		return height;
	}

	public void setHeight(float height) {
		this.height = height;
	}

	@Basic
	@Column(name="LENGTHCLASS")
	public LengthClass getLengthClass() {
		return lengthClass;
	}

	public void setLengthClass(LengthClass lengthClass) {
		this.lengthClass = lengthClass;
	}
	
	
}
