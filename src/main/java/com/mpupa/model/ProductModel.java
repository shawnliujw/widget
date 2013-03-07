package com.mpupa.model;

import java.io.Serializable;
import java.util.Set;

public class ProductModel implements Serializable , Comparable<ProductModel>{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer productId;

	private String sku;
	
	private String ean;
	
	private String productName;
	
	private String productBreakdown1;
	
	private String productBreakdown2;
	
	private String productBreakdown3;
	
	private String productBreakdown4;
	
	private String weightVol;
	
	private Integer packageQuantity;
	
	private String unitWeightVol;
	
	private String imageUrl;
	
	private String description;
	
	private String additionalInfo;
	
	private String ingredients;
	
	private String usageDetail;
	
	private String usage;
	
	private String storageDetail;
	
	private String nutrition;
	
	private String additives;
	
	private String allergyAdvice;
	
	private String lifeStyle;
	
	private String createdTime;
	
	private String updatedTime;
	
	private String publishedTime;
	
	private Boolean valid;
	
	private String productUrl;
	
	private String wasPrice;
	
	private String nowPrice;
	
	private boolean inStock;

	private String otherInfo;
	
	private String offerName;
	
	private Integer offerId;
	
	private Integer brandId;
	private Integer clientId;
	private Integer retailerId;


	public Integer getBrandId() {
		return brandId;
	}

	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}

	public Integer getClientId() {
		return clientId;
	}

	public void setClientId(Integer clientId) {
		this.clientId = clientId;
	}

	public Integer getRetailerId() {
		return retailerId;
	}

	public void setRetailerId(Integer retailerId) {
		this.retailerId = retailerId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public String getEan() {
		return ean;
	}

	public void setEan(String ean) {
		this.ean = ean;
	}

	public String getProductName() {
		String string = "" ;
		if(null != productBreakdown1 && !"".equals(productBreakdown1)) {
			string += productBreakdown1;
			
			if(null != productBreakdown2 && !"".equals(productBreakdown2)) {
				string += " " +productBreakdown2;
			} 
			
			if(packageQuantity != null && packageQuantity > 0) {
				string += " "+packageQuantity + " x " +unitWeightVol;
			} else {
				string += " " + unitWeightVol;
			}
			
		} else {
			string = productName;
		}
		
		return string;

	}
	
	public String getProductName4Specialk() {
		String string = "" ;
		if(null != productBreakdown2 && !"".equals(productBreakdown2)) {
			string += productBreakdown2;
			
			if(null != productBreakdown1 && !"".equals(productBreakdown1)) {
				string += " " +productBreakdown1;
			} 
			
			if(packageQuantity != null && packageQuantity > 0) {
				string += " "+packageQuantity + " x " +unitWeightVol;
			} else {
				string += " " + unitWeightVol;
			}
			
		} else {
			string = productName;
		}
		
		return string;

	}

	public void setProductName(String productName) {
		this.productName = productName;
	}



	public String getProductBreakdown1() {
		return productBreakdown1;
	}

	public void setProductBreakdown1(String productBreakdown1) {
		this.productBreakdown1 = productBreakdown1;
	}

	public String getProductBreakdown2() {
		return productBreakdown2;
	}

	public void setProductBreakdown2(String productBreakdown2) {
		this.productBreakdown2 = productBreakdown2;
	}

	public String getProductBreakdown3() {
		return productBreakdown3;
	}

	public void setProductBreakdown3(String productBreakdown3) {
		this.productBreakdown3 = productBreakdown3;
	}

	public String getProductBreakdown4() {
		return productBreakdown4;
	}

	public void setProductBreakdown4(String productBreakdown4) {
		this.productBreakdown4 = productBreakdown4;
	}

	public String getWeightVol() {
		return weightVol;
	}

	public void setWeightVol(String weightVol) {
		this.weightVol = weightVol;
	}


	public Integer getPackageQuantity() {
		return packageQuantity;
	}

	public void setPackageQuantity(Integer packageQuantity) {
		this.packageQuantity = packageQuantity;
	}

	public String getUnitWeightVol() {
		return unitWeightVol;
	}

	public void setUnitWeightVol(String unitWeightVol) {
		this.unitWeightVol = unitWeightVol;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAdditionalInfo() {
		return additionalInfo;
	}

	public void setAdditionalInfo(String additionalInfo) {
		this.additionalInfo = additionalInfo;
	}

	public String getIngredients() {
		return ingredients;
	}

	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}


	public String getNutrition() {
		return nutrition;
	}

	public void setNutrition(String nutrition) {
		this.nutrition = nutrition;
	}

	public String getAdditives() {
		return additives;
	}

	public void setAdditives(String additives) {
		this.additives = additives;
	}

	public String getAllergyAdvice() {
		return allergyAdvice;
	}

	public void setAllergyAdvice(String allergyAdvice) {
		this.allergyAdvice = allergyAdvice;
	}

	public String getLifeStyle() {
		return lifeStyle;
	}

	public void setLifeStyle(String lifeStyle) {
		this.lifeStyle = lifeStyle;
	}

	public String getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(String createdTime) {
		this.createdTime = createdTime;
	}

	public String getUpdatedTime() {
		return updatedTime;
	}

	public void setUpdatedTime(String updatedTime) {
		this.updatedTime = updatedTime;
	}

	public String getPublishedTime() {
		return publishedTime;
	}

	public void setPublishedTime(String publishedTime) {
		this.publishedTime = publishedTime;
	}

	public Boolean getValid() {
		return valid;
	}

	public void setValid(Boolean valid) {
		this.valid = valid;
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

	
	
	public boolean isInStock() {
		return inStock;
	}

	public void setInStock(boolean inStock) {
		this.inStock = inStock;
	}

	public String getOtherInfo() {
		return otherInfo;
	}

	public void setOtherInfo(String otherInfo) {
		this.otherInfo = otherInfo;
	}

	public String getOfferName() {
		return offerName;
	}

	public void setOfferName(String offerName) {
		this.offerName = offerName;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public String getUsageDetail() {
		return usageDetail;
	}

	public void setUsageDetail(String usageDetail) {
		this.usageDetail = usageDetail;
	}

	public String getStorageDetail() {
		return storageDetail;
	}

	public void setStorageDetail(String storageDetail) {
		this.storageDetail = storageDetail;
	}

	public Integer getOfferId() {
		return offerId;
	}

	public void setOfferId(Integer offerId) {
		this.offerId = offerId;
	}

	public String getUsage() {
		return this.usageDetail;
	}

	@Override
	public int compareTo(ProductModel arg0) {
		// TODO Auto-generated method stub
		
		String str1 = this.getProductBreakdown4();
		String str2 = arg0.getProductBreakdown4();
		int result = 0;
		int int1,int2;
		try {
			int1 = Integer.parseInt(str1);
		} catch (Exception e) {
			// TODO: handle exception
			int1 = 0;
		}
		try {
			int2 = Integer.parseInt(str2);
		} catch (Exception e) {
			// TODO: handle exception
			int2 = 0;
		}
		
		if(int1 > int2) {
			result = -1;  
		} else if(int1 < int2) {
			result = 1;
		}
		
		return result;
	}


	
	
}
