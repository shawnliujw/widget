package com.mpupa.model;

import java.io.Serializable;

public class ProductRetailersModel implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	
	private String productUrl;
	
	private String wasPrice;
	
	private String nowPrice;
	
	private Integer inStock;

	private Integer productId;
	
	private Integer retailerId;
	
	private Integer offerId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProductUrl() {
		return productUrl;
	}

	public void setProductUrl(String productUrl) {
		this.productUrl = productUrl;
	}

	public String getWasPrice() {
		return wasPrice;
	}

	public void setWasPrice(String wasPrice) {
		this.wasPrice = wasPrice;
	}

	public String getNowPrice() {
		return nowPrice;
	}

	public void setNowPrice(String nowPrice) {
		this.nowPrice = nowPrice;
	}
	
	

	public Integer getInStock() {
		return inStock;
	}

	public void setInStock(Integer inStock) {
		this.inStock = inStock;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
