package controllers.admin.GestEtudiants;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.absenceDao.AbsenceDao;
import dao.etudiantDao.EtudiantDao;
import dao.filiereDao.FiliereDao;
import dao.niveauDao.NiveauDao;
import models.Absence;
import models.Admin;
import models.Etudiant;
import models.Filiere;
import models.Niveau;

/**
 * Servlet implementation class srv_listeAbs
 */
@WebServlet("/srv_listeAbsEtd")
public class srv_listeAbsEtd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public srv_listeAbsEtd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		try {
			String cne = request.getParameter("cne");
			int idNiv = Integer.parseInt(request.getParameter("niv"));
			
			
			if(cne != null && idNiv != 0 ) {
				AbsenceDao abs = new AbsenceDao();
				ArrayList<Absence> listeAbs = abs.getAbsence(idNiv, cne);
				request.getSession().setAttribute("listeA", listeAbs);
				response.sendRedirect("Admin/gEtudiants/listeAbs.jsp");
			}
		} catch (Exception e) {
			
		}
		
		try {
			int idAbs = Integer.parseInt(request.getParameter("idabs"));
			if(idAbs != 0 ) {
				String etat = request.getParameter("etat");
				System.out.println(etat);
				AbsenceDao abs = new AbsenceDao();
				String msg = null; 
				if(abs.changeJustification(idAbs,etat)){
					msg = "Mis à jour avec succés";
					request.getSession().setAttribute("msg", msg);
					response.sendRedirect("Admin/gEtudiants/listeAbs.jsp");
				}else {
					msg = "error sur la mis à jour!";
					request.getSession().setAttribute("msg", msg);
					response.sendRedirect("Admin/gEtudiants/listeAbs.jsp");
				}
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		String annee = request.getParameter("annee");
		if(annee != null ){
			
			Admin admin = (Admin) request.getSession().getAttribute("admin");
			int idEtab = admin.getIdEtab();
			FiliereDao fdao = new FiliereDao();
			ArrayList<Filiere> f = fdao.getAllFiliereByIdEtab(idEtab);
			request.getSession().setAttribute("listeF", f);
			response.sendRedirect("Admin/gEtudiants/listeAbs.jsp");
		}
		String lister = request.getParameter("filiere");
		
		if(lister != null) {
			int idFililere = Integer.parseInt(request.getParameter("f"));
			NiveauDao ndao = new NiveauDao();
			ArrayList<Niveau> niv = ndao.getNiveauByIdFiliere(idFililere);
			request.getSession().setAttribute("listeN", niv);
			response.sendRedirect("Admin/gEtudiants/listeAbs.jsp");
		}
		
		String sub = request.getParameter("niv");
		if(sub != null) {
			int idNiv = Integer.parseInt(request.getParameter("niv"));
			EtudiantDao et = new EtudiantDao();
			ArrayList<Etudiant> liste = et.getAllByNiv(idNiv);
			request.getSession().setAttribute("listeE", liste);
			response.sendRedirect("Admin/gEtudiants/listeAbs.jsp");
		}
		
		
	}

}
