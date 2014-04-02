package com.basu.schemas;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

public class Price implements Serializable {

	private float amount;
	private String currency;

}
