package com.mpupa.model;

import java.io.Serializable;
import java.util.Set;

public class RetailerModel implements Serializable ,Comparable<RetailerModel>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	
	private String name;
	
	private String logoUrl;
	
	private String defaultCategory;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		if(name.indexOf("~") != -1) {
			name = name.replace("~", "'");
		}
		return name;
	}

	public void setName(String name) {
		
		if(name.indexOf("'") != -1) {
			name = name.replace("'", "~");
		}
		
		this.name = name;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getLogoUrl() {
		return logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}

	@Override
	public int compareTo(RetailerModel o) {
		// TODO Auto-generated method stub
		int count = 0;
		if(this.getId() > o.getId()) {
			count = 1;
		} else {
			count = -1;
		}
		
		return count;
	}

	public String getDefaultCategory() {
		
		if(defaultCategory.indexOf("~") != -1) {
			defaultCategory = defaultCategory.replace("~", "'");
		}
		
		return defaultCategory;
	}

	public void setDefaultCategory(String defaultCategory) {
		if(defaultCategory.indexOf("'") != -1) {
			defaultCategory = defaultCategory.replace("'", "~");
		}
		
		this.defaultCategory = defaultCategory;
	}
	
	
	
}
