package com.mpupa.model;

import java.io.Serializable;

public class CategoryModel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	
	private String name;
	
	
	private String imageUrl;
	
	private boolean defaultSelected;
	
	private String secondName;
	
	private String thirdName;
	
	
	private Integer brandId;
	

	public Integer getBrandId() {
		return brandId;
	}

	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		if(name!=null&&name.indexOf("~") != -1) {
			name = name.replace("~", "'");
			}
		return name;
	}

	public void setName(String name) {
		if(name!=null&&name.indexOf("'") != -1) {
			name = name.replace("'", "~");
		}
		this.name = name;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}




	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}


	public boolean isDefaultSelected() {
		return defaultSelected;
	}

	public void setDefaultSelected(boolean defaultSelected) {
		this.defaultSelected = defaultSelected;
	}

	public String getSecondName() {
		
		if(secondName!=null&&secondName.indexOf("~") != -1) {
			secondName = secondName.replace("~", "'");
		}
		
		return secondName;
	}

	public void setSecondName(String secondName) {
		
		if(secondName!=null&&secondName.indexOf("'") != -1) {
			secondName = secondName.replace("'", "~");
		}
		
		this.secondName = secondName;
	}

	public String getThirdName() {
		return thirdName;
	}

	public void setThirdName(String thirdName) {
		this.thirdName = thirdName;
	}

	
	
}
