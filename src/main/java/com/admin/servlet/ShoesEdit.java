package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ShoesDAOImpl;
import com.DB.DBConn;
import com.entity.Shoes;

/**
 * Servlet implementation class ShoesEdit
 */
@WebServlet(name = "ShoesEdit", urlPatterns = { "/edit-shoes" })
public class ShoesEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoesEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("sId"));
			String shoesName = request.getParameter("sName");
			String price = request.getParameter("sPrice");
			String brand = request.getParameter("sBrand");
			String category = request.getParameter("sCate");
			String status = request.getParameter("sStatus");
			Shoes s = new Shoes();
			s.setShoesId(id);
			s.setShoesName(shoesName);
			s.setShoesPrice(price);
			s.setShoesCategory(brand);
			s.setShoesStatus(status);
			ShoesDAOImpl dao = new ShoesDAOImpl(DBConn.getConnection());
			boolean f = dao.updateShoes(s);
			HttpSession session = request.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Update shoes successfully");
				response.sendRedirect("admin/edit_shoes.jsp");
			} else {
				session.setAttribute("errMsg", "Something wrong! Please try again");
				response.sendRedirect("admin/edit_shoes.jsp");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}
