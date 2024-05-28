package com.user.servlet;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConn;
import com.entity.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "LoginServlet", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		UserDAOImpl dao = new UserDAOImpl(DBConn.getConnection());
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		//System.out.println(email + " " + pass);
		
		// Encrypt the password
		String encryptedPass = encryptPassword(pass);
		
		if("admin@gmail.com".equals(email) && "admin".equals(pass)) {
			User us = new User();
			us.setLastName("adminlord88");
			session.setAttribute("adminObj", us);
			response.sendRedirect("admin/admin.jsp");
		} else {
			User us = dao.userLogin(email, encryptedPass);
			if(us != null) {
				session.setAttribute("userObj", us);
				response.sendRedirect("user.jsp");
			} else {
				session.setAttribute("errMsg", "Email or Password Invalid");
				response.sendRedirect("login.jsp");
			}

		}

	}
	
	private String encryptPassword(String password) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(password.getBytes());
			byte byteData[] = md.digest();

			//convert the byte to hex format
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			return sb.toString();
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}

}
