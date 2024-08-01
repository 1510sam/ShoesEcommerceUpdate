package com.DAO;

import java.util.List;

import com.entity.Brand;

public interface BrandDAO {
	public boolean addBrand(Brand b);
	public List<Brand> getAllBrand();
	public Brand getBrandById(int id);
	public boolean editBrand(Brand b);
}
