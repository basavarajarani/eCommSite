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
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;
import org.jvnet.jaxb2_commons.lang.Equals;
import org.jvnet.jaxb2_commons.lang.EqualsStrategy;
import org.jvnet.jaxb2_commons.lang.HashCode;
import org.jvnet.jaxb2_commons.lang.HashCodeStrategy;
import org.jvnet.jaxb2_commons.lang.JAXBEqualsStrategy;
import org.jvnet.jaxb2_commons.lang.JAXBHashCodeStrategy;
import org.jvnet.jaxb2_commons.locator.ObjectLocator;
import org.jvnet.jaxb2_commons.locator.util.LocatorUtils;


/**
 * <p>Java class for OrderItem complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="OrderItem">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;all>
 *         &lt;element name="Order" type="{xmlapi_1.0}Order"/>
 *         &lt;element name="OrderItemName" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="OrderItemFinalPrice" type="{http://www.w3.org/2001/XMLSchema}decimal"/>
 *         &lt;element name="OrderQuantity" type="{http://www.w3.org/2001/XMLSchema}integer"/>
 *       &lt;/all>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "OrderItem", propOrder = {

})
@Entity(name = "OrderItem")
@Table(name = "ORDERITEM")
@Inheritance(strategy = InheritanceType.JOINED)
public class OrderItem
    implements Serializable, Equals, HashCode
{

    @XmlElement(name = "Order", required = true)
    protected Order order;
    @XmlElement(name = "OrderItemName", required = true)
    protected String orderItemName;
    @XmlElement(name = "OrderItemFinalPrice", required = true)
    protected BigDecimal orderItemFinalPrice;
    @XmlElement(name = "OrderQuantity", required = true)
    protected BigInteger orderQuantity;
    @XmlAttribute(name = "Hjid")
    protected Long hjid;

    /**
     * Gets the value of the order property.
     * 
     * @return
     *     possible object is
     *     {@link Order }
     *     
     */
    @ManyToOne(targetEntity = Order.class)
    @JoinColumn(name = "OrderItem_Order")
    public Order getOrder() {
        return order;
    }

    /**
     * Sets the value of the order property.
     * 
     * @param value
     *     allowed object is
     *     {@link Order }
     *     
     */
    public void setOrder(Order value) {
        this.order = value;
    }

    @Transient
    public boolean isSetOrder() {
        return (this.order!= null);
    }

    /**
     * Gets the value of the orderItemName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Basic
    @Column(name = "ORDERITEMNAME", length = 255)
    public String getOrderItemName() {
        return orderItemName;
    }

    /**
     * Sets the value of the orderItemName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setOrderItemName(String value) {
        this.orderItemName = value;
    }

    @Transient
    public boolean isSetOrderItemName() {
        return (this.orderItemName!= null);
    }

    /**
     * Gets the value of the orderItemFinalPrice property.
     * 
     * @return
     *     possible object is
     *     {@link BigDecimal }
     *     
     */
    @Basic
    @Column(name = "ORDERITEMFINALPRICE", precision = 20, scale = 10)
    public BigDecimal getOrderItemFinalPrice() {
        return orderItemFinalPrice;
    }

    /**
     * Sets the value of the orderItemFinalPrice property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigDecimal }
     *     
     */
    public void setOrderItemFinalPrice(BigDecimal value) {
        this.orderItemFinalPrice = value;
    }

    @Transient
    public boolean isSetOrderItemFinalPrice() {
        return (this.orderItemFinalPrice!= null);
    }

    /**
     * Gets the value of the orderQuantity property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    @Basic
    @Column(name = "ORDERQUANTITY", precision = 20, scale = 0)
    public BigInteger getOrderQuantity() {
        return orderQuantity;
    }

    /**
     * Sets the value of the orderQuantity property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setOrderQuantity(BigInteger value) {
        this.orderQuantity = value;
    }

    @Transient
    public boolean isSetOrderQuantity() {
        return (this.orderQuantity!= null);
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

    public boolean equals(ObjectLocator thisLocator, ObjectLocator thatLocator, Object object, EqualsStrategy strategy) {
        if (!(object instanceof OrderItem)) {
            return false;
        }
        if (this == object) {
            return true;
        }
        final OrderItem that = ((OrderItem) object);
        {
            Order lhsOrder;
            lhsOrder = this.getOrder();
            Order rhsOrder;
            rhsOrder = that.getOrder();
            if (!strategy.equals(LocatorUtils.property(thisLocator, "order", lhsOrder), LocatorUtils.property(thatLocator, "order", rhsOrder), lhsOrder, rhsOrder)) {
                return false;
            }
        }
        {
            String lhsOrderItemName;
            lhsOrderItemName = this.getOrderItemName();
            String rhsOrderItemName;
            rhsOrderItemName = that.getOrderItemName();
            if (!strategy.equals(LocatorUtils.property(thisLocator, "orderItemName", lhsOrderItemName), LocatorUtils.property(thatLocator, "orderItemName", rhsOrderItemName), lhsOrderItemName, rhsOrderItemName)) {
                return false;
            }
        }
        {
            BigDecimal lhsOrderItemFinalPrice;
            lhsOrderItemFinalPrice = this.getOrderItemFinalPrice();
            BigDecimal rhsOrderItemFinalPrice;
            rhsOrderItemFinalPrice = that.getOrderItemFinalPrice();
            if (!strategy.equals(LocatorUtils.property(thisLocator, "orderItemFinalPrice", lhsOrderItemFinalPrice), LocatorUtils.property(thatLocator, "orderItemFinalPrice", rhsOrderItemFinalPrice), lhsOrderItemFinalPrice, rhsOrderItemFinalPrice)) {
                return false;
            }
        }
        {
            BigInteger lhsOrderQuantity;
            lhsOrderQuantity = this.getOrderQuantity();
            BigInteger rhsOrderQuantity;
            rhsOrderQuantity = that.getOrderQuantity();
            if (!strategy.equals(LocatorUtils.property(thisLocator, "orderQuantity", lhsOrderQuantity), LocatorUtils.property(thatLocator, "orderQuantity", rhsOrderQuantity), lhsOrderQuantity, rhsOrderQuantity)) {
                return false;
            }
        }
        return true;
    }

    public boolean equals(Object object) {
        final EqualsStrategy strategy = JAXBEqualsStrategy.INSTANCE;
        return equals(null, null, object, strategy);
    }

    public int hashCode(ObjectLocator locator, HashCodeStrategy strategy) {
        int currentHashCode = 1;
        {
            Order theOrder;
            theOrder = this.getOrder();
            currentHashCode = strategy.hashCode(LocatorUtils.property(locator, "order", theOrder), currentHashCode, theOrder);
        }
        {
            String theOrderItemName;
            theOrderItemName = this.getOrderItemName();
            currentHashCode = strategy.hashCode(LocatorUtils.property(locator, "orderItemName", theOrderItemName), currentHashCode, theOrderItemName);
        }
        {
            BigDecimal theOrderItemFinalPrice;
            theOrderItemFinalPrice = this.getOrderItemFinalPrice();
            currentHashCode = strategy.hashCode(LocatorUtils.property(locator, "orderItemFinalPrice", theOrderItemFinalPrice), currentHashCode, theOrderItemFinalPrice);
        }
        {
            BigInteger theOrderQuantity;
            theOrderQuantity = this.getOrderQuantity();
            currentHashCode = strategy.hashCode(LocatorUtils.property(locator, "orderQuantity", theOrderQuantity), currentHashCode, theOrderQuantity);
        }
        return currentHashCode;
    }

    public int hashCode() {
        final HashCodeStrategy strategy = JAXBHashCodeStrategy.INSTANCE;
        return this.hashCode(null, strategy);
    }

}