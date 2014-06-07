package com.basu.schemas;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderColumn;
import javax.persistence.Table;

@Entity(name="SALESORDER")
@Table(name="SALESORDER")
public class SalesOrder implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private long id;
	private User user;
	private Set<OrderItem> orderItems;
	private Address shippingAddress;
	private Address billingAddress;
	private double totalAmount;
	private double taxAmount;
	
	
	@OneToMany(targetEntity=OrderItem.class, fetch=FetchType.EAGER, cascade= CascadeType.ALL)
	@JoinColumn(name="ORDERITEM_SALESORDER_ID")
	@OrderColumn
	public Set<OrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
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
	
	@ManyToOne(targetEntity=User.class, fetch=FetchType.LAZY)
	@JoinColumn(name="SALESORDER_USER_ID")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@OneToOne(targetEntity=Address.class, fetch=FetchType.EAGER, cascade=CascadeType.ALL)
	@JoinColumn(name="SHIPPINGADDRESS_ID")
	public Address getShippingAddress() {
		return shippingAddress;
	}
	public void setShippingAddress(Address shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
	
	@OneToOne(targetEntity=Address.class, fetch=FetchType.EAGER, cascade=CascadeType.ALL)
	@JoinColumn(name="BILLINGADDRESS_ID")
	public Address getBillingAddress() {
		return billingAddress;
	}
	public void setBillingAddress(Address billingAddress) {
		this.billingAddress = billingAddress;
	}
	
	@Basic
	@Column(name="TOTALAMOUNT")
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	
	@Basic
	@Column(name="TAXAMOUNT")
	public double getTaxAmount() {
		return taxAmount;
	}
	public void setTaxAmount(double taxAmount) {
		this.taxAmount = taxAmount;
	}
}
