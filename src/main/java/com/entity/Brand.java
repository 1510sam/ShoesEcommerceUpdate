package com.entity;

public class Brand {
	private int brandId;
	private String brandName;
	private String brandPhoto;
	private String email;

	public Brand() {
	}

	public Brand(String brandName, String brandPhoto, String email) {
		super();
		this.brandName = brandName;
		this.brandPhoto = brandPhoto;
		this.email = email;
	}

	public int getBrandId() {
		return brandId;
	}

	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getBrandPhoto() {
		return brandPhoto;
	}

	public void setBrandPhoto(String brandPhoto) {
		this.brandPhoto = brandPhoto;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
