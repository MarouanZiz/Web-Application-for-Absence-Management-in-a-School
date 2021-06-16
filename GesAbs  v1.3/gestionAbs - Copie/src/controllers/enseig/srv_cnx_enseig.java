package controllers.enseig;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.enseignantDao.EnseignantDao;
import models.Enseignant;


/**
 * Servlet implementation class srv_cnx_enseig
 */
@WebServlet("/cnxEnseig")
public class srv_cnx_enseig extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public srv_cnx_enseig() {
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
		EnseignantDao e = new EnseignantDao();
		Enseignant ens = e.getEnseignant(login, psw);
		String msg = null;
		if(login.trim().equals("") || login == null) {
			 msg = "les chemps sont vides !!";
				request.setAttribute("msg", msg);
				this.getServletContext().getRequestDispatcher("/cnx_enseig.jsp").forward(request, response);
				
		}else {
			if(ens != null) {
				request.getSession().setAttribute("enseignant", ens);
				response.sendRedirect("/gestionAbs/Enseignant/espaceEnseig.jsp");
			}else {
				 msg = "Le mot de passe ou login entré est incorrect";
				request.setAttribute("msg", msg);
				this.getServletContext().getRequestDispatcher("/cnx_enseig.jsp").forward(request, response);
				
				
			}
		}
		
	}

}
