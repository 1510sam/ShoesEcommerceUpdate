package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.ShoesDAOImpl;
import com.DB.DBConn;
import com.entity.Cart;
import com.entity.Shoes;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet(name = "CartServlet", urlPatterns = { "/cart" })

public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sid = Integer.parseInt(request.getParameter("sid"));
		int uid = Integer.parseInt(request.getParameter("uid"));
		ShoesDAOImpl dao = new ShoesDAOImpl(DBConn.getConnection());
		Shoes s = dao.getShoesById(sid);
		
		Cart c = new Cart();
		c.setShoesId(sid);
		c.setUserId(uid);
		c.setShoesName(s.getShoesName());
		c.setShoesBrand(s.getShoesBrand());
		c.setPrice(Double.parseDouble(s.getShoesPrice()));
		c.setTotalPrice(Double.parseDouble(s.getShoesPrice()));
	
		CartDAOImpl dao2 = new CartDAOImpl(DBConn.getConnection());
		boolean f = dao2.addCart(c);
		HttpSession session = request.getSession();
		if(f) {
			session.setAttribute("addCart", "Shoes added to cart");
			response.sendRedirect("cart.jsp");
			System.out.println("Add cart success");
		} else {
			session.setAttribute("failed", "Shoes failed added to cart");
			response.sendRedirect("cart.jsp");
			System.out.println("Add cart failed");
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
