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

import com.DAO.BrandDAOImpl;
import com.DB.DBConn;
import com.entity.Brand;

/**
 * Servlet implementation class BrandAdd
 */
@WebServlet(name = "BrandAdd", urlPatterns = { "/add-brand" })
@MultipartConfig
public class BrandAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BrandAdd() {
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
			String brandName = request.getParameter("bName");
			Part part = request.getPart("bImg");
			String fileName = part.getSubmittedFileName();
			Brand b = new Brand(brandName, fileName, "admin@gmail.com");
			//System.out.println(s.getShoesName());
			BrandDAOImpl dao = new BrandDAOImpl(DBConn.getConnection());
			HttpSession session = request.getSession();
			boolean f = dao.addBrand(b);
			if(f) {
				String path = getServletContext().getRealPath("") + "brand";
				File file = new File(path);
				part.write(path + File.separator + fileName);
				
				//System.out.println("User registered successfully");
				session.setAttribute("succMsg", "Add brand successfully");
				response.sendRedirect("admin/addBrand.jsp");
			} else {
				//System.out.println("Something wrong! Please try again");
				session.setAttribute("errMsg", "Something wrong! Please try again");
				response.sendRedirect("admin/addBrand.jsp");
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}
