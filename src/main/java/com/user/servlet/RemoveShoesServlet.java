package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConn;

/**
 * Servlet implementation class RemoveShoesServlet
 */
@WebServlet(name = "RemoveShoesServlet", urlPatterns = { "/remove_shoes" })
public class RemoveShoesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveShoesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid = Integer.parseInt(request.getParameter("cid"));
		CartDAOImpl dao = new CartDAOImpl(DBConn.getConnection());
		boolean f = dao.deleteCart(cid);
		HttpSession session = request.getSession();
		if(f) {
			session.setAttribute("succMsg", "Shoes removed to cart");
			response.sendRedirect("cart.jsp");
		} else {
			session.setAttribute("failedMsg", "There is an error, try again!");
			response.sendRedirect("cart.jsp");
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
