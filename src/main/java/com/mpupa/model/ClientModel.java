package com.mpupa.model;

import java.io.Serializable;

public class ClientModel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	
	private String name;
	
	private String logoUrl;
//	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLogoUrl() {
		return logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}

//	public Set<ProductModel> getProducts() {
//		return products;
//	}
//
//	public void setProducts(Set<ProductModel> products) {
//		this.products = products;
//	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
}
