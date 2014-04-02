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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "USER")
@Inheritance(strategy = InheritanceType.JOINED)
public class User
    implements Serializable
{


    protected String userEmail;
    protected String userName;
    protected String userPassword;
    protected String userFirstName;
    protected String userLastName;
    protected String userAddress;
    protected String userAddress2;
    protected String userCity;
    protected String userState;
    protected String userCountry;
    protected String userZip;
    protected String userPhone;
    protected String userFax;
    protected boolean enabled;
    protected boolean userEmailVerified;
    protected String userVerificationCode;
    protected List<Order> orderList;
    protected Long hjid;
    protected Authorities authority;
 
    
    @OneToOne(fetch=FetchType.EAGER, cascade= CascadeType.ALL)
    @JoinColumn( name="authority_id")
	public Authorities getAuthority() {
		return authority;
	}

	public void setAuthority(Authorities authority) {
		this.authority = authority;
	}

	@Basic
    @Column (name = "ENABLED")
    public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	/**
     * Gets the value of the userEmail property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Basic
    @Column(name = "USEREMAIL", length = 255)
    public String getUserEmail() {
        return userEmail;
    }
    
    @Basic
    @Column(name = "USERNAME", length = 255)
    public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
     * Sets the value of the userEmail property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUserEmail(String value) {
        this.userEmail = value;
    }

    @Transient
    public boolean isSetUserEmail() {
        return (this.userEmail!= null);
    }

    /**
     * Gets the value of the userPassword property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Basic
    @Column(name = "USERPASSWORD", length = 255)
    public String getUserPassword() {
        return userPassword;
    }

    /**
     * Sets the value of the userPassword property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUserPassword(String value) {
        this.userPassword = value;
    }

    @Transient
    public boolean isSetUserPassword() {
        return (this.userPassword!= null);
    }

    /**
     * Gets the value of the userFirstName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Basic
    @Column(name = "USERFIRSTNAME", length = 255)
    public String getUserFirstName() {
        return userFirstName;
    }

    /**
     * Sets the value of the userFirstName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUserFirstName(String value) {
        this.userFirstName = value;
    }

    @Transient
    public boolean isSetUserFirstName() {
        return (this.userFirstName!= null);
    }

    /**
     * Gets the value of the userLastName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Basic
    @Column(name = "USERLASTNAME", length = 255)
    public String getUserLastName() {
        return userLastName;
    }

    /**
     * Sets the value of the userLastName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUserLastName(String value) {
        this.userLastName = value;
    }

    @Transient
    public boolean isSetUserLastName() {
        return (this.userLastName!= null);
    }

    /**
     * Gets the value of the userAddress property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Basic
    @Column(name = "USERADDRESS", length = 255)
    public String getUserAddress() {
        return userAddress;
    }

    /**
     * Sets the value of the userAddress property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUserAddress(String value) {
        this.userAddress = value;
    }

    @Transient
    public boolean isSetUserAddress() {
        return (this.userAddress!= null);
    }

    /**
     * Gets the value of the userAddress2 property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Basic
    @Column(name = "USERADDRESS2", length = 255)
    public String getUserAddress2() {
        return userAddress2;
    }

    /**
     * Sets the value of the userAddress2 property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUserAddress2(String value) {
        this.userAddress2 = value;
    }

    @Transient
    public boolean isSetUserAddress2() {
        return (this.userAddress2 != null);
    }

    /**
     * Gets the value of the userCity property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Basic
    @Column(name = "USERCITY", length = 255)
    public String getUserCity() {
        return userCity;
    }

    /**
     * Sets the value of the userCity property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUserCity(String value) {
        this.userCity = value;
    }

    @Transient
    public boolean isSetUserCity() {
        return (this.userCity!= null);
    }

    /**
     * Gets the value of the userState property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Basic
    @Column(name = "USERSTATE", length = 255)
    public String getUserState() {
        return userState;
    }

    /**
     * Sets the value of the userState property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUserState(String value) {
        this.userState = value;
    }

    @Transient
    public boolean isSetUserState() {
        return (this.userState!= null);
    }

    /**
     * Gets the value of the userCountry property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Basic
    @Column(name = "USERCOUNTRY", length = 255)
    public String getUserCountry() {
        return userCountry;
    }

    /**
     * Sets the value of the userCountry property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUserCountry(String value) {
        this.userCountry = value;
    }

    @Transient
    public boolean isSetUserCountry() {
        return (this.userCountry!= null);
    }

    /**
     * Gets the value of the userZip property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Basic
    @Column(name = "USERZIP", length = 255)
    public String getUserZip() {
        return userZip;
    }

    /**
     * Sets the value of the userZip property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUserZip(String value) {
        this.userZip = value;
    }

    @Transient
    public boolean isSetUserZip() {
        return (this.userZip!= null);
    }

    /**
     * Gets the value of the userPhone property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Basic
    @Column(name = "USERPHONE", length = 255)
    public String getUserPhone() {
        return userPhone;
    }

    /**
     * Sets the value of the userPhone property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUserPhone(String value) {
        this.userPhone = value;
    }

    @Transient
    public boolean isSetUserPhone() {
        return (this.userPhone!= null);
    }

    /**
     * Gets the value of the userFax property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Basic
    @Column(name = "USERFAX", length = 255)
    public String getUserFax() {
        return userFax;
    }

    /**
     * Sets the value of the userFax property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUserFax(String value) {
        this.userFax = value;
    }

    @Transient
    public boolean isSetUserFax() {
        return (this.userFax!= null);
    }

    /**
     * Gets the value of the userEmailVerified property.
     * 
     */
    @Basic
    @Column(name = "USEREMAILVERIFIED")
    public boolean isUserEmailVerified() {
        return userEmailVerified;
    }

    /**
     * Sets the value of the userEmailVerified property.
     * 
     */
    public void setUserEmailVerified(boolean value) {
        this.userEmailVerified = value;
    }

    @Transient
    public boolean isSetUserEmailVerified() {
        return true;
    }

    /**
     * Gets the value of the userVerificationCode property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Basic
    @Column(name = "USERVERIFICATIONCODE", length = 255)
    public String getUserVerificationCode() {
        return userVerificationCode;
    }

    /**
     * Sets the value of the userVerificationCode property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUserVerificationCode(String value) {
        this.userVerificationCode = value;
    }

    @Transient
    public boolean isSetUserVerificationCode() {
        return (this.userVerificationCode!= null);
    }

    /**
     * Gets the value of the orderList property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the orderList property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getOrderList().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link Order }
     * 
     * 
     */
    @OneToMany(targetEntity = Order.class, cascade = {
        CascadeType.ALL
    })
    @JoinColumn(name = "ORDERLIST_USER__HJID")
    @OrderColumn(name = "ORDERLIST_HJORDER")
    public List<Order> getOrderList() {
        if (orderList == null) {
            orderList = new ArrayList<Order>();
        }
        return this.orderList;
    }

    /**
     * 
     * 
     */
    public void setOrderList(List<Order> orderList) {
        this.orderList = orderList;
    }

    @Transient
    public boolean isSetOrderList() {
        return ((this.orderList!= null)&&(!this.orderList.isEmpty()));
    }

    public void unsetOrderList() {
        this.orderList = null;
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
}
