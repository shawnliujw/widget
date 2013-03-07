package com.mpupa.model;

import java.io.Serializable;


public class CptModel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 160319465334869858L;

	/**
	 * 
	 */

	private Integer id;

	private String coupon_email;
	private String save_time;
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCoupon_email() {
		return coupon_email;
	}
	public void setCoupon_email(String coupon_email) {
		this.coupon_email = coupon_email;
	}

	public String getSave_time() {
		return save_time;
	}

	public void setSave_time(String save_time) {
		this.save_time = save_time;
	}
	
}
