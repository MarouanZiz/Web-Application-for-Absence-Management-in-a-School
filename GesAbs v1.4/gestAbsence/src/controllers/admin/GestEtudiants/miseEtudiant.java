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

import dao.etudiantDao.EtudiantDao;
import models.Admin;
import models.Etudiant;


/**
 * Servlet implementation class miseEtudiant
 */
@WebServlet("/miseEtudiant")
public class miseEtudiant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public miseEtudiant() {
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
		if (cne != null && cin != null) {
			EtudiantDao et = new EtudiantDao();
			Etudiant etud = et.getEtudiantByCne(cne, cin);
			request.getSession().setAttribute("etudiant", etud);
			response.sendRedirect("Admin/gEtudiants/modifEtud.jsp");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String modif = request.getParameter("modif");
		if (modif != null) {
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
			String sexe = request.getParameter("gendre");
			String lnais = request.getParameter("lnais");
			int idNiv = Integer.parseInt(request.getParameter("niv"));
			Etudiant etS = (Etudiant) request.getSession().getAttribute("etudiant");
			Etudiant et = new Etudiant(etS.getCne(),etS.getCin(),nom,prenom,date_nais,null,null,null,sexe,lnais,idEtab,idNiv);
			EtudiantDao up = new EtudiantDao();
			String msg;
			if(up.updateEtd(et)) {
				msg="Mis à jour avec succés";
				request.getSession().setAttribute("msg", msg);
				request.getSession().removeAttribute("etudiant");
				response.sendRedirect("Admin/gEtudiants/listerEtuds.jsp");
			}else {
				msg="échec de Mis à jour";
				request.getSession().setAttribute("msg", msg);
				response.sendRedirect("Admin/gEtudiants/listerEtuds.jsp");
			}
		}
		
	}

}
