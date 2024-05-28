package com.DAO;

import java.util.List;

import com.entity.Shoes;
import com.entity.User;

public interface ShoesDAO {
	public boolean addShoes(Shoes s);
	public List<Shoes> getAllShoes();
	public List<Shoes> getShoesAdmin(int start,int total);
	public Shoes getShoesById(int id);
	public boolean updateShoes(Shoes s);
	public boolean deleteShoes(int id);
	public List<Shoes> getFeaturedShoes();
	public List<Shoes> getRecentShoes();
	public List<Shoes> getAllRecentShoes();
	public List<Shoes> getAllFeaturedShoes();
	public List<Shoes> getAllNewShoes();
}
