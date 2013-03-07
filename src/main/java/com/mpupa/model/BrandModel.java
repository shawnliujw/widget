package com.mpupa.model;

import java.io.Serializable;

public class BrandModel implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	
	private String name;
	
	private String logoUrl;
	
	private String strap;
	
	private String description;
	
	private String folder;
	
	private Integer clientId;
	
	private Integer templateId;
	
	private String gaNumber;
	
	
	
	public Integer getClientId() {
		return clientId;
	}

	public void setClientId(Integer clientId) {
		this.clientId = clientId;
	}

	public Integer getTemplateId() {
		return templateId;
	}

	public void setTemplateId(Integer templateId) {
		this.templateId = templateId;
	}

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

	public String getStrap() {
		return strap;
	}

	public void setStrap(String strap) {
		this.strap = strap;
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


	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


	public String getFolder() {
		return folder;
	}

	public void setFolder(String folder) {
		this.folder = folder;
	}

	public String getGaNumber() {
		return gaNumber;
	}

	public void setGaNumber(String gaNumber) {
		this.gaNumber = gaNumber;
	}
	
	
}
