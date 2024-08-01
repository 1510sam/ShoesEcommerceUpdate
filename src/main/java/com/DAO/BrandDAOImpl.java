package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Brand;

public class BrandDAOImpl implements BrandDAO{
	private Connection conn;
	

	public BrandDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBrand(Brand b) {
		boolean f = false;
		try {
			String sql = "insert into brands(brandsName, brandsPhoto, email) values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBrandName());
			ps.setString(2, b.getBrandPhoto());
			ps.setString(3, b.getEmail());
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

//	@Override
	public List<Brand> getAllBrand() {
		List<Brand> list = new ArrayList<Brand>();
		Brand b = null;
		try {
			String sql = "select *from brands";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b = new Brand();
				b.setBrandId(rs.getInt(1));
				b.setBrandName(rs.getString(2));
				b.setBrandPhoto(rs.getString(3));
				b.setEmail(rs.getString(4));
				list.add(b);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}
//
//	@Override
//	public boolean deleteBrand(int id) {
//		boolean f = false;
//		try {
//			String sql = "delete from brand where id = ?";
//			PreparedStatement ps = conn.prepareStatement(sql);
//			ps.setInt(1, id);
//			int i = ps.executeUpdate();
//			if(i==1) {
//				f=true;
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//		return f;
//	}

	@Override
	public Brand getBrandById(int id) {
		Brand b = null;
		try {
			String sql = "select *from brands where brandsId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b = new Brand();
				b.setBrandId(rs.getInt(1));
				b.setBrandName(rs.getString(2));
				b.setBrandPhoto(rs.getString(3));
				b.setEmail(rs.getString(4));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public boolean editBrand(Brand b) {
		boolean f = false;
		try {
			String sql = "update brands set brandsName = ? where brandsId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBrandName());
			ps.setInt(2, b.getBrandId());
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

}
