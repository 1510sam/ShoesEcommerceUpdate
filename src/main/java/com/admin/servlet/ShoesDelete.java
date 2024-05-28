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

/**
 * Servlet implementation class ShoesDelete
 */
@WebServlet(name = "ShoesDelete", urlPatterns = { "/delete-shoes" })
public class ShoesDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoesDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			ShoesDAOImpl dao = new ShoesDAOImpl(DBConn.getConnection());
			boolean f = dao.deleteShoes(id);
			HttpSession session = request.getSession();
		
			if(f) {
				session.setAttribute("succMsg", "Delete shoes successfully");
				response.sendRedirect("admin/list_shoes.jsp");
			} else {
				session.setAttribute("errMsg", "Something wrong! Please try again");
				response.sendRedirect("admin/list_shoes.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
