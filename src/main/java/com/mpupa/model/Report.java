package com.mpupa.model;

import java.io.Serializable;

public class Report implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	
	private String dealDate;
	
	private String dealStatus;
	
	private String cardType;
	
	private String userEmail;
	
	private String platForm;
	
	private String os;
	
	private String confirmNumber;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDealDate() {
		return dealDate;
	}

	public void setDealDate(String dealDate) {
		this.dealDate = dealDate;
	}

	public String getDealStatus() {
		return dealStatus;
	}

	public void setDealStatus(String dealStatus) {
		this.dealStatus = dealStatus;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getPlatForm() {
		return platForm;
	}

	public void setPlatForm(String platForm) {
		this.platForm = platForm;
	}

	public String getOs() {
		return os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	public String getConfirmNumber() {
		return confirmNumber;
	}

	public void setConfirmNumber(String confirmNumber) {
		this.confirmNumber = confirmNumber;
	}

	@Override
	public String toString() {
		return "Report [id=" + id + ", dealDate=" + dealDate + ", dealStatus="
				+ dealStatus + ", cardType=" + cardType + ", userEmail="
				+ userEmail + ", platForm=" + platForm + ", os=" + os
				+ ", confirmNumber=" + confirmNumber + "]";
	}


}
