package com.hot.shop.farmENT.model.vo;

public class FarmENTBidProductCount {

	private String productName;
	private int prodictCount;
	
	
	public FarmENTBidProductCount() {
		super();
	}

	public FarmENTBidProductCount(String productName, int prodictCount) {
		super();
		this.productName = productName;
		this.prodictCount = prodictCount;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProdictCount() {
		return prodictCount;
	}

	public void setProdictCount(int prodictCount) {
		this.prodictCount = prodictCount;
	}

	@Override
	public String toString() {
		return "FarmENTBidProductCount [productName=" + productName + ", prodictCount=" + prodictCount + "]";
	}
	
	
}
