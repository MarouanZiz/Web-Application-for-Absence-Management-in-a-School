package controllers.admin.GestEnseignants;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.enseignantDao.EnseignantDao;


/**
 * Servlet implementation class supEnseignant
 */
@WebServlet("/supEnseignant")
public class supEnseignant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public supEnseignant() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String cnp = request.getParameter("cnp");
		String cin = request.getParameter("cin");
		EnseignantDao ens = new EnseignantDao();
		String msg;
		if(ens.delEnseigant(cnp, cin)) {
			msg  = "l'enseignant est supprimé";
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect("Admin/gEnseignants/listerEnseig.jsp");
		}else {
			msg  = "error de suppression !";
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect("Admin/gEnseignants/listerEnseig.jsp");
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
