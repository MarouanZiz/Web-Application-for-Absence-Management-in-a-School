package controllers.admin.GestEnseignants;

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
import dao.enseignantDao.EnseignantDao;
import dao.enseignerDao.EnseignerDao;
import models.Admin;
import models.Enseignant;
import models.Etablissement;
import util.Util;

/**
 * Servlet implementation class ajEnseignant
 */
@WebServlet("/ajEnseignant")
public class ajEnseignant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ajEnseignant() {
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
		
		String cnp = request.getParameter("cnp");
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
		String login = cnp+"-"+ville;
		String psw = Util.generatePsw(15);
		String sexe = request.getParameter("gendre");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		int module = Integer.parseInt(request.getParameter("module"));
		String[] nivs = request.getParameterValues("niveau");
		int[] niv = new int [nivs.length];
		for(int i=0;i<nivs.length;i++) {
		    niv[i] = Integer.parseInt(nivs[i]);
		    System.out.println(niv[i]);
		}
		
		
		
		Enseignant enseig = new Enseignant(cnp,cin,nom,prenom,date_nais,login,psw,email,sexe,tel,idEtab);
		EnseignantDao ens = new EnseignantDao();
		String msg;
		if(ens.addEnseignant(enseig).equals("yes")) {
			msg="enregistré";
			int idEns = ens.getMaxId();
			EnseignerDao enseigner = new EnseignerDao();
			if (!enseigner.addEnseigner(niv, idEns, module)) {
				msg="error sur l'ajout d'enseigner !  ";
				request.getSession().setAttribute("message", msg);
				response.sendRedirect("Admin/gEnseignants/formAjEnseig.jsp");
			}else {
				request.getSession().setAttribute("message", msg);
				response.sendRedirect("Admin/gEnseignants/formAjEnseig.jsp");
			}
			
			
		}else if(ens.addEnseignant(enseig).equals("no"))  {
			msg="étudiant est déjà existe ! ";
			request.getSession().setAttribute("message", msg);
			response.sendRedirect("Admin/gEnseignants/formAjEnseig.jsp");
		}else {
			msg="error sur l'ajout ";
			request.getSession().setAttribute("message", msg);
			response.sendRedirect("Admin/gEnseignants/formAjEnseig.jsp");
		
		}
	
		
		
	}

}
