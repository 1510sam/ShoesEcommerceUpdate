package com.entity;

public class Shoes {
	private int shoesId;
	private String shoesName;
	private String shoesPrice;
	private String shoesBrand;
	private String shoesCategory;
	private String shoesStatus;
	private String shoesPhoto;
	private String email;
	
	
	public Shoes() {
		// TODO Auto-generated constructor stub
	}

	public Shoes(String shoesName, String shoesPrice, String shoesBrand, String shoesCategory, String shoesStatus,
			String shoesPhoto, String email) {
		super();
		this.shoesName = shoesName;
		this.shoesPrice = shoesPrice;
		this.shoesBrand = shoesBrand;
		this.shoesCategory = shoesCategory;
		this.shoesStatus = shoesStatus;
		this.shoesPhoto = shoesPhoto;
		this.email = email;
	}

	public int getShoesId() {
		return shoesId;
	}

	public void setShoesId(int shoesId) {
		this.shoesId = shoesId;
	}

	public String getShoesName() {
		return shoesName;
	}
	public void setShoesName(String shoesName) {
		this.shoesName = shoesName;
	}
	public String getShoesPrice() {
		return shoesPrice;
	}
	public void setShoesPrice(String shoesPrice) {
		this.shoesPrice = shoesPrice;
	}
	
	public String getShoesBrand() {
		return shoesBrand;
	}

	public void setShoesBrand(String shoesBrand) {
		this.shoesBrand = shoesBrand;
	}

	public String getShoesCategory() {
		return shoesCategory;
	}
	public void setShoesCategory(String shoesCategory) {
		this.shoesCategory = shoesCategory;
	}
	public String getShoesStatus() {
		return shoesStatus;
	}
	public void setShoesStatus(String shoesStatus) {
		this.shoesStatus = shoesStatus;
	}
	public String getShoesPhoto() {
		return shoesPhoto;
	}
	public void setShoesPhoto(String shoesPhoto) {
		this.shoesPhoto = shoesPhoto;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
