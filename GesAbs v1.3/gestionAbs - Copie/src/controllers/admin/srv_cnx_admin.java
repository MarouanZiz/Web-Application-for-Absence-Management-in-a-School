package controllers.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.adminDao.AdminDao;
import models.Admin;

/**
 * Servlet implementation class srv_cnx_admin
 */
@WebServlet("/cnxAdmin")
public class srv_cnx_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public srv_cnx_admin() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		String login = request.getParameter("login");
		String psw = request.getParameter("psw");
		AdminDao a = new AdminDao();
		Admin admin = a.getAdmin(login, psw);
		String msg = null;
		if(login.trim().equals("") || login == null) {
			 msg = "les chemps sont vides !!";
				request.setAttribute("msg", msg);
				this.getServletContext().getRequestDispatcher("/cnx_admin.jsp").forward(request, response);
				
		}else {
			if(admin != null) {
				request.getSession().setAttribute("admin", admin);
				response.sendRedirect("/gestionAbs/Admin/espaceAdmin.jsp");
			}else {
				 msg = "Le mot de passe ou login entré est incorrect";
				request.setAttribute("msg", msg);
				this.getServletContext().getRequestDispatcher("/cnx_admin.jsp").forward(request, response);
				
				
			}
		}
	}

}
