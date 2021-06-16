package controllers.enseig.absEtuds;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.absenceDao.AbsenceDao;
import dao.etudiantDao.EtudiantDao;
import models.Absence;
import models.Etudiant;

/**
 * Servlet implementation class srv_ajAbs
 */
@WebServlet("/srv_ajAbs")
public class srv_ajAbs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public srv_ajAbs() {
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
		int idNiv = Integer.parseInt(request.getParameter("niv"));
		if(cne != null && idNiv != 0 ) {
			AbsenceDao abs = new AbsenceDao();
			ArrayList<Absence> listeAbs = abs.getAbsence(idNiv, cne);
			request.getSession().setAttribute("listeAbs", listeAbs);
			response.sendRedirect("Enseignant/absEtuds/ajAbs.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String sub = request.getParameter("subniv");
		if(sub != null) {
			int idNiv = Integer.parseInt(request.getParameter("niv"));
			EtudiantDao et = new EtudiantDao();
			ArrayList<Etudiant> liste = et.getAllByNiv(idNiv);
			request.getSession().setAttribute("listeEtd", liste);
			response.sendRedirect("Enseignant/absEtuds/ajAbs.jsp");
		}
		
	}

}
