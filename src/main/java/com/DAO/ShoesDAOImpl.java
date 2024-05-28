package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Shoes;

public class ShoesDAOImpl implements ShoesDAO {
	private Connection conn;
	private int noOfRecords;

	public ShoesDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addShoes(Shoes s) {
		boolean f = false;
		try {
			String sql = "insert into shoes(shoesName, shoesPrice, shoesBrand, shoesCategory, shoesStatus, shoesPhoto, email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, s.getShoesName());
			ps.setString(2, s.getShoesPrice());
			ps.setString(3, s.getShoesBrand());
			ps.setString(4, s.getShoesCategory());
			ps.setString(5, s.getShoesStatus());
			ps.setString(6, s.getShoesPhoto());
			ps.setString(7, s.getEmail());
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
	public List<Shoes> getAllShoes() {
		// TODO Auto-generated method stub
		List<Shoes> list = new ArrayList<Shoes>();
		Shoes s = null;
		try {
			String sql = "select *from shoes";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s = new Shoes();
				s.setShoesId(rs.getInt(1));
				s.setShoesName(rs.getString(2));
				s.setShoesPrice(rs.getString(3));
				s.setShoesBrand(rs.getString(4));
				s.setShoesCategory(rs.getString(5));
				s.setShoesStatus(rs.getString(6));
				s.setShoesPhoto(rs.getString(7));
				s.setEmail(rs.getString(8));
				list.add(s);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Shoes getShoesById(int id) {
		Shoes s = null;
		try {
			String sql = "select *from shoes where shoesId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s = new Shoes();
				s.setShoesId(rs.getInt(1));
				s.setShoesName(rs.getString(2));
				s.setShoesPrice(rs.getString(3));
				s.setShoesBrand(rs.getString(4));
				s.setShoesCategory(rs.getString(5));
				s.setShoesStatus(rs.getString(6));
				s.setShoesPhoto(rs.getString(7));
				s.setEmail(rs.getString(8));

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return s;
	}

	@Override
	public boolean updateShoes(Shoes s) {
		boolean f = false;
		try {
			String sql = "update shoes set shoesName = ?, shoesPrice = ?, shoesBrand ?, shoesCategory = ?, shoesStatus = ? where shoesId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, s.getShoesName());
			ps.setString(2, s.getShoesPrice());
			ps.setString(3, s.getShoesBrand());
			ps.setString(4, s.getShoesCategory());
			ps.setString(5, s.getShoesStatus());
			ps.setInt(5, s.getShoesId());
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
	public boolean deleteShoes(int id) {
		boolean f = false;
		try {
			String sql = "delete from shoes where shoesId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
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
	public List<Shoes> getFeaturedShoes() {
		// TODO Auto-generated method stub
		List<Shoes> list = new ArrayList<Shoes>();
		Shoes s = null;
		try {
			String sql = "select *from shoes where shoesCategory = ? and shoesStatus = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Featured");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				s = new Shoes();
				s.setShoesId(rs.getInt(1));
				s.setShoesName(rs.getString(2));
				s.setShoesPrice(rs.getString(3));
				s.setShoesBrand(rs.getString(4));
				s.setShoesCategory(rs.getString(5));
				s.setShoesStatus(rs.getString(6));
				s.setShoesPhoto(rs.getString(7));
				s.setEmail(rs.getString(8));
				list.add(s);
				i++;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Shoes> getRecentShoes() {
		// TODO Auto-generated method stub
		List<Shoes> list = new ArrayList<Shoes>();
		Shoes s = null;
		try {
			String sql = "select *from shoes where shoesCategory = ? and shoesStatus = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Recent");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				s = new Shoes();
				s.setShoesId(rs.getInt(1));
				s.setShoesName(rs.getString(2));
				s.setShoesPrice(rs.getString(3));
				s.setShoesBrand(rs.getString(4));
				s.setShoesCategory(rs.getString(5));
				s.setShoesStatus(rs.getString(6));
				s.setShoesPhoto(rs.getString(7));
				s.setEmail(rs.getString(8));
				list.add(s);
				i++;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Shoes> getAllRecentShoes() {
		// TODO Auto-generated method stub
		List<Shoes> list = new ArrayList<Shoes>();
		Shoes s = null;
		try {
			String sql = "select *from shoes where shoesCategory = ? and shoesStatus = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Recent");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				s = new Shoes();
				s.setShoesId(rs.getInt(1));
				s.setShoesName(rs.getString(2));
				s.setShoesPrice(rs.getString(3));
				s.setShoesBrand(rs.getString(4));
				s.setShoesCategory(rs.getString(5));
				s.setShoesStatus(rs.getString(6));
				s.setShoesPhoto(rs.getString(7));
				s.setEmail(rs.getString(8));
				list.add(s);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Shoes> getAllFeaturedShoes() {
		List<Shoes> list = new ArrayList<Shoes>();
		Shoes s = null;
		try {
			String sql = "select *from shoes where shoesCategory = ? and shoesStatus = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Featured");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				s = new Shoes();
				s.setShoesId(rs.getInt(1));
				s.setShoesName(rs.getString(2));
				s.setShoesPrice(rs.getString(3));
				s.setShoesBrand(rs.getString(4));
				s.setShoesCategory(rs.getString(5));
				s.setShoesStatus(rs.getString(6));
				s.setShoesPhoto(rs.getString(7));
				s.setEmail(rs.getString(8));
				list.add(s);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Shoes> getShoesAdmin(int start,int total) {
		List<Shoes> list = new ArrayList<Shoes>();
		Shoes s = null;
		try {
			String sql = ("select *from shoes limit "+ (start-1) +","+total);
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s = new Shoes();
				s.setShoesId(rs.getInt(1));
				s.setShoesName(rs.getString(2));
				s.setShoesPrice(rs.getString(3));
				s.setShoesBrand(rs.getString(4));
				s.setShoesCategory(rs.getString(5));
				s.setShoesStatus(rs.getString(6));
				s.setShoesPhoto(rs.getString(7));
				s.setEmail(rs.getString(8));
				list.add(s);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Shoes> getAllNewShoes() {
		List<Shoes> list = new ArrayList<Shoes>();
		Shoes s = null;
		try {
			String sql = "select *from shoes where shoesCategory = ? and shoesStatus = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				s = new Shoes();
				s.setShoesId(rs.getInt(1));
				s.setShoesName(rs.getString(2));
				s.setShoesPrice(rs.getString(3));
				s.setShoesBrand(rs.getString(4));
				s.setShoesCategory(rs.getString(5));
				s.setShoesStatus(rs.getString(6));
				s.setShoesPhoto(rs.getString(7));
				s.setEmail(rs.getString(8));
				list.add(s);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

}
