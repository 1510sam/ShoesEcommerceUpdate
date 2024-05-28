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
 * Servlet implementation class RegisterServlet
 */
@WebServlet(name = "RegisterServlet", urlPatterns = { "/register" })
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
			String fname = request.getParameter("fName");
			String lname = request.getParameter("lName");
			String tel = request.getParameter("tel");
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			//System.out.println(fname + " " + lname + " " + tel + " " + pass + " ");
			
			// Encrypt password
			String encryptedPass = encryptPassword(pass);
			
			User us = new User();
			us.setFirstName(fname);
			us.setLastName(lname);
			us.setTel(tel);
			us.setEmail(email);
			us.setPassword(encryptedPass);
			
 			HttpSession session = request.getSession();
			
			UserDAOImpl dao = new UserDAOImpl(DBConn.getConnection());
			boolean f = dao.userRegister(us);
			if(f) {
				//System.out.println("User registered successfully");
				session.setAttribute("succMsg", "User registered successfully");
				response.sendRedirect("login.jsp");
			} else {
				//System.out.println("Something wrong! Please try again");
				session.setAttribute("errMsg", "Something wrong! Please try again");
				response.sendRedirect("register.jsp");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
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
