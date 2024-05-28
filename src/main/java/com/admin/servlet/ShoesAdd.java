package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.ShoesDAOImpl;
import com.DB.DBConn;
import com.entity.Shoes;

/**
 * Servlet implementation class ShoesAdd
 */
@WebServlet(name = "ShoesAdd", urlPatterns = { "/add-shoes" })
@MultipartConfig
public class ShoesAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoesAdd() {
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
			String shoesName = request.getParameter("sName");
			String price = request.getParameter("sPrice");
			String brand = request.getParameter("brand");
			String category = request.getParameter("sCate");
			String status = request.getParameter("sStatus");
			Part part = request.getPart("sImg");
			String fileName = part.getSubmittedFileName();
			Shoes s = new Shoes(shoesName, price, brand, category, status, fileName, "admin@gmail.com");
			//System.out.println(s.getShoesName());
			ShoesDAOImpl dao = new ShoesDAOImpl(DBConn.getConnection());
			HttpSession session = request.getSession();
			boolean f = dao.addShoes(s);
			if(f) {
				String path = getServletContext().getRealPath("") + "shoes";
				File file = new File(path);
				part.write(path + File.separator + fileName);
				
				//System.out.println("User registered successfully");
				session.setAttribute("succMsg", "Add shoes successfully");
				response.sendRedirect("admin/add_shoes.jsp");
			} else {
				//System.out.println("Something wrong! Please try again");
				session.setAttribute("errMsg", "Something wrong! Please try again");
				response.sendRedirect("admin/add_shoes.jsp");
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}
