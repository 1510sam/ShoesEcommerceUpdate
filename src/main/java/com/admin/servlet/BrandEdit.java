package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
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
 * Servlet implementation class BrandEdit
 */
@WebServlet(name = "BrandEdit", urlPatterns = { "/edit-brand" })
public class BrandEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BrandEdit() {
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
			  // Get brand details from request
			  int brandId = Integer.parseInt(request.getParameter("brandId")); // Assuming brandId exists in the request
			  String brandName = request.getParameter("bName");
			  Part brandImagePart = request.getPart("bImg");
			  String newFileName = brandImagePart.getSubmittedFileName();

			  // Check if a new image is uploaded
			  if (!newFileName.isEmpty()) {
			    // Create Brand object with updated details
			    Brand updatedBrand = new Brand(brandName, newFileName, "admin@gmail.com");

			    // Update brand information in database
			    BrandDAOImpl dao = new BrandDAOImpl(DBConn.getConnection());
			    boolean updated = dao.editBrand(updatedBrand);

			    if (updated) {
			      String path = getServletContext().getRealPath("") + "brand";
			      File brandImagesDir = new File(path);

			      // Check if brand image directory exists, create it if not
			      if (!brandImagesDir.exists()) {
			        brandImagesDir.mkdirs();
			      }

			      // Write uploaded image to the directory
			      brandImagePart.write(path + File.separator + newFileName);

			      // Update successful message
			      HttpSession session = request.getSession();
			      session.setAttribute("succMsg", "Brand updated successfully");
			      response.sendRedirect("admin/brandManagement.jsp"); // Redirect to brand management page
			    } else {
			      // Update failed message
			      HttpSession session = request.getSession();
			      session.setAttribute("errMsg", "Failed to update brand. Please try again");
			      response.sendRedirect("admin/editBrand.jsp?brandId=" + brandId); // Redirect back to edit page with brandId
			    }
			  } else {
			    // No new image uploaded, update only brand name
			    Brand updatedBrand = new Brand(brandName, null, "admin@gmail.com"); // Set image filename to null
			    BrandDAOImpl dao = new BrandDAOImpl(DBConn.getConnection());
			    boolean updated = dao.editBrand(updatedBrand);

			    if (updated) {
			      // Update successful message
			      HttpSession session = request.getSession();
			      session.setAttribute("succMsg", "Brand name updated successfully");
			      response.sendRedirect("admin/brandManagement.jsp"); // Redirect to brand management page
			    } else {
			      // Update failed message
			      HttpSession session = request.getSession();
			      session.setAttribute("errMsg", "Failed to update brand name. Please try again");
			      response.sendRedirect("admin/editBrand.jsp?brandId=" + brandId); // Redirect back to edit page with brandId
			    }
			  }
			} catch (Exception e) {
			  e.printStackTrace();
			  // Handle exception appropriately, log error, display user-friendly message
			}

	}

}
