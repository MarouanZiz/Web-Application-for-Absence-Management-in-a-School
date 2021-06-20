package controllers.admin.GestEtudiants;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EtablissementDao.EtablissementDao;
import dao.etudiantDao.EtudiantDao;
import models.Admin;
import models.Etablissement;
import models.Etudiant;
import util.Util;

/**
 * Servlet implementation class ajEtudiant
 */
@WebServlet("/ajEtudiant")
public class ajEtudiant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ajEtudiant() {
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
		
		String cne = request.getParameter("cne");
		String cin = request.getParameter("cin");
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String date = request.getParameter("dtn");
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		Date dtn = null;
		java.sql.Date date_nais = null;
	try {
      
		dtn = f.parse(date);
		date_nais = new java.sql.Date(dtn.getTime());
			
		} catch (ParseException e) {
		
	}
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		int idEtab = admin.getIdEtab();
		EtablissementDao etab = new EtablissementDao();
		Etablissement etb = etab.getEtabliById(idEtab);
		String ville = etb.getVille();
		String login = cne+"@"+ville;
		String psw = Util.generatePsw(15);
		String sexe = request.getParameter("gendre");
		String lnais = request.getParameter("lnais");
		int idNiv = Integer.parseInt(request.getParameter("niv"));
			
		Etudiant et = new Etudiant(cne,cin,nom,prenom,date_nais,login,psw,null,sexe,lnais,idEtab,idNiv);
		EtudiantDao ad = new EtudiantDao();
		String msg;
		if(ad.addEtudiant(et).equals("yes")) {
			msg="enregistré";
			request.getSession().setAttribute("message", msg);
			response.sendRedirect("Admin/gEtudiants/formAjout.jsp");
		}else if(ad.addEtudiant(et).equals("no"))  {
			msg="étudiant est déjà existe ! ";
			request.getSession().setAttribute("message", msg);
			response.sendRedirect("Admin/gEtudiants/formAjout.jsp");
		}else {
			msg="error sur l'ajout ";
			request.getSession().setAttribute("message", msg);
			response.sendRedirect("Admin/gEtudiants/formAjout.jsp");
		
		}
	}

}
