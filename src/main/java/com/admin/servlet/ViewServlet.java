package com.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.core.StandardHost;

import com.DAO.ShoesDAO;
import com.DAO.ShoesDAOImpl;
import com.DB.DBConn;
import com.entity.Shoes;


/**
 * Servlet implementation class ViewServlet
 */
@WebServlet(name = "ViewServlet", urlPatterns = { "/view" })
public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");  
        PrintWriter out=response.getWriter(); 
        out.println("<link\r\n"
        		+ "	href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css\"\r\n"
        		+ "	rel=\"stylesheet\">");
          
        String spageid=request.getParameter("page");  
        int pageid=Integer.parseInt(spageid);  
        int total=5;  
        if(pageid==1){}  
        else{  
        	pageid=pageid-1;  
        	pageid=pageid*total+1;  
        } 
        ShoesDAOImpl dao = new ShoesDAOImpl(DBConn.getConnection());
        List<Shoes> list = dao.getShoesAdmin(pageid, total);
        out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"view?page=1\">1</a></li> ");  
        out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"view?page=2\">2</a></li> ");
        out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"view?page=3\">3</a></li> ");
        out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
