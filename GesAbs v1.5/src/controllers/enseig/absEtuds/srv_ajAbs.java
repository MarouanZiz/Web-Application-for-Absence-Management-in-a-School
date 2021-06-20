package controllers.enseig.absEtuds;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.absenceDao.AbsenceDao;
import dao.anneeDao.AnneeDao;
import dao.etudiantDao.EtudiantDao;
import dao.seanceDao.SeanceDao;
import models.Absence;
import models.Annee;
import models.Etudiant;
import models.Seance;

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

		
		if(cne != null) {
			EtudiantDao etD = new EtudiantDao();
			Etudiant et = etD.getEtudiantByCn(cne);
			request.getSession().setAttribute("etudiant", et);
			response.sendRedirect("Enseignant/absEtuds/ajAbs.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		String cne = request.getParameter("cne");
		int idNiv = Integer.parseInt(request.getParameter("niv"));
		
		if(cne != null && idNiv !=0) {
			int idMod = Integer.parseInt(request.getParameter("module"));
			String date = request.getParameter("dateabs");
			SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
			Date dabs = null;
			java.sql.Date date_abs = null;
		try {
	      
			dabs = f.parse(date);
			date_abs = new java.sql.Date(dabs.getTime());
				
			} catch (ParseException e) {
			
		}
		
			AnneeDao annee = new AnneeDao();
			Annee an = annee.getActuelAnnee();
			int idAn = an.getIdAnnee();
			String Hdebut = request.getParameter("deb");
			String Hfin = request.getParameter("fin");
			SimpleDateFormat ff = new SimpleDateFormat("hh:mm");
			java.sql.Time heureD = null;
			java.sql.Time heureF = null;
			try {
				heureD = new java.sql.Time(ff.parse(Hdebut).getTime());
				heureF = new java.sql.Time(ff.parse(Hfin).getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			Seance s = new Seance(heureD,heureF,idMod,idAn);
			SeanceDao sea = new SeanceDao();
			boolean SeanceResult = sea.addSeance(s);
			int idSeance = sea.getMaxId();
			
			Absence ab = new Absence(cne,idNiv,idSeance,date_abs,null);
			AbsenceDao absDao = new AbsenceDao();
			boolean AbsenceResult = absDao.addAbsence(ab);
			
			String msg = null;
			if(SeanceResult && AbsenceResult) {
				msg = "Enregisté";
				request.getSession().setAttribute("msg", msg);
				response.sendRedirect("Enseignant/absEtuds/ajAbs.jsp");
			}else {
				msg = "Error d'ajoute ! ";
				request.getSession().setAttribute("msg", msg);
				response.sendRedirect("Enseignant/absEtuds/ajAbs.jsp");
			}
		}
		
		
		
		
	}

}
