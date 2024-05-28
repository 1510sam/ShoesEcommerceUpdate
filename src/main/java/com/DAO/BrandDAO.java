package com.DAO;

import java.util.List;

import com.entity.Brand;

public interface BrandDAO {
	public boolean addBrand(Brand b);
	public List<Brand> getAllBrand();
	//public boolean deleteBrand(int id);
}
