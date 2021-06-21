package controllers.admin.GestEtudiants;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.etudiantDao.EtudiantDao;

/**
 * Servlet implementation class supEtudiant
 */
@WebServlet("/supEtudiant")
public class supEtudiant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public supEtudiant() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String cne = request.getParameter("cne");
		String cin = request.getParameter("cin");
		EtudiantDao et = new EtudiantDao();
		String msg;
		if(et.delEtd(cne, cin)) {
			msg  = "l'étudiant est supprimé";
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect("Admin/gEtudiants/listerEtuds.jsp");
		}else {
			msg  = "error de suppression !";
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect("Admin/gEtudiants/listerEtuds.jsp");
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
