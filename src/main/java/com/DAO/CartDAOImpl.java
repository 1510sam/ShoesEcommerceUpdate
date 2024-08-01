package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;
import com.entity.Shoes;

public class CartDAOImpl implements CartDAO{
	private Connection conn;
	
	
	public CartDAOImpl(Connection conn) {
		this.conn = conn;
	}


	@Override
	public boolean addCart(Cart c) {
		boolean f = false;
		try {
			String sql = "insert into cart(shoesId, userId, shoesName, shoesBrand, price, totalPrice) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getShoesId());
			ps.setInt(2, c.getUserId());
			ps.setString(3, c.getShoesName());
			ps.setString(4, c.getShoesBrand());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}


	@Override
	public List<Cart> getShoesByUser(int userId) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		double totalPrice = 0;
		try {
			String sql = "select *from cart where userId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Cart();
				c.setCartId(rs.getInt(1));
				c.setShoesId(rs.getInt(2));
				c.setUserId(rs.getInt(3));
				c.setShoesName(rs.getString(4));
				c.setShoesBrand(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				totalPrice += rs.getDouble(7);
				c.setTotalPrice(totalPrice);
				list.add(c);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
		
	}


	@Override
	public boolean deleteCart(int cid) {
		boolean f = false;
		try {
			String sql = "delete from cart where cartId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cid);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

}
