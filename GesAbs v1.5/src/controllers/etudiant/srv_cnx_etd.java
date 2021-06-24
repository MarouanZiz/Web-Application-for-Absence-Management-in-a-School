package controllers.etudiant;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.etudiantDao.EtudiantDao;
import models.Etudiant;


/**
 * Servlet implementation class cnx_etd
 */
@WebServlet(
		name="cnx",
		urlPatterns= {"/cnxEtd","/cnxetd"}
		
		)
public class srv_cnx_etd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public srv_cnx_etd() {
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
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String login = request.getParameter("login");
		String psw = request.getParameter("psw");
		EtudiantDao e = new EtudiantDao();
		Etudiant et = e.getEtudiant(login, psw);
		String msg = null;
		if(login.trim().equals("") || login == null) {
			 msg = "les chemps sont vides !!";
				request.setAttribute("msg", msg);
				this.getServletContext().getRequestDispatcher("/cnx_etd.jsp").forward(request, response);
				
		}else {
			if(et != null) {
				request.getSession().setAttribute("etudiant", et);
				response.sendRedirect("Etudiant/espaceEtd.jsp");
			}else {
				 msg = "Le mot de passe ou login entré est incorrect";
				request.setAttribute("msg", msg);
				this.getServletContext().getRequestDispatcher("/cnx_etd.jsp").forward(request, response);
				
				
			}
		}
		
		
	}

}
