package com.mpupa.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


public class SearchProductModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//目录名称
	private String sortName;
	
	//是否有子目录
	private boolean flag = false;
	
	//该目录对应商品的公共图片,如果该目录不是最高层级目录，该值为空
	private String catalogImage;
	
	//子目录对象,如果没有子目录，该值为空
	private Set<SearchProductModel> childNodes;
	
	//该目录下包含的商品
	//如果该目录还有子目录，那么该值为空
	private Set<ProductModel> productModels;
	
	private List<ProductModel> productList;

	public String getSortName() {
		return sortName;
	}

	public void setSortName(String sortName) {
		this.sortName = sortName;
	}



	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public Set<SearchProductModel> getChildNodes() {
		if(null == childNodes) childNodes = new HashSet<SearchProductModel>();
		return childNodes;
	}

	public void setChildNodes(Set<SearchProductModel> childNodes) {
		this.childNodes = childNodes;
	}



	public String getCatalogImage() {
		return catalogImage;
	}

	public void setCatalogImage(String catalogImage) {
		this.catalogImage = catalogImage;
	}

	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		SearchProductModel searchProductModel = (SearchProductModel) obj;
		
		return this.sortName.equalsIgnoreCase(searchProductModel.getSortName());
	}

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return 11111;
	}

	public Set<ProductModel> getProductModels() {
		if(null == productModels) {
			productModels = new HashSet<ProductModel>();
		}
		return productModels;
	}

	public void setProductModels(Set<ProductModel> productModels) {
		this.productModels = productModels;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	/**
	 * 对自身的 子集进行排序，按照 ProductModel 的productBreakDown4 排序
	 *
	 * @author shawn
	 * @date 2013 2013-2-1 下午11:09:25
	 */
	public static SearchProductModel sort(SearchProductModel searchProductModel) {
		
		Set<ProductModel> set = searchProductModel.getProductModels();
		
		if(null != set) {
			List<ProductModel> list = searchProductModel.getProductList();
			for (ProductModel productModel : set) {
				list.add(productModel);
			}
			Collections.sort(list);
			searchProductModel.setProductList(list);
		} 
		
		return searchProductModel;
	}

	public List<ProductModel> getProductList() {
		
		if(null == productList) {
			productList = new ArrayList<ProductModel>();
		}
		
		return productList;
	}

	public void setProductList(List<ProductModel> productList) {
		this.productList = productList;
	}
	
	
}
