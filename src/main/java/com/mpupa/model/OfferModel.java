package com.mpupa.model;

import java.io.Serializable;


public class OfferModel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

	private String name;
	private String display_name;
	private String offer_formula;

	
	public String getDisplay_name() {
		return display_name;
	}

	public void setDisplay_name(String display_name) {
		this.display_name = display_name;
	}

	public String getOffer_formula() {
		return offer_formula;
	}

	public void setOffer_formula(String offer_formula) {
		this.offer_formula = offer_formula;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
