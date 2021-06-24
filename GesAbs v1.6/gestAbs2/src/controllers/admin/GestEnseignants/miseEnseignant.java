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

import dao.enseignantDao.EnseignantDao;
import models.Admin;
import models.Enseignant;


/**
 * Servlet implementation class miseEnseignant
 */
@WebServlet("/miseEnseignant")
public class miseEnseignant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public miseEnseignant() {
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
		if (cnp != null && cin != null) {
			EnseignantDao ens = new EnseignantDao();
			Enseignant etud = ens.getEnseignantByCnp(cnp, cin);
			request.getSession().setAttribute("enseignant", etud);
			response.sendRedirect("Admin/gEnseignants/modifEnseig.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		String modif = request.getParameter("modifer");
		if (modif.equals("Modifier")){
			String cnp = request.getParameter("cnp");
			String cin = request.getParameter("cin");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String tel = request.getParameter("tel");
			String email = request.getParameter("email");
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
			Enseignant ens = (Enseignant) request.getSession().getAttribute("enseignant");
			Enseignant enseig = new Enseignant(ens.getId(),cnp,cin,nom,prenom,date_nais,null,null,email,sexe,tel,idEtab);
			EnseignantDao up = new EnseignantDao();
			String msg;
			if(up.updateEnseig(enseig)) {
				msg="Mis à jour avec succés";
				request.getSession().setAttribute("msg", msg);
				request.getSession().removeAttribute("enseignant");
				response.sendRedirect("Admin/gEnseignants/listerEnseig.jsp");
			}else {
				msg="échec de Mis à jour";
				request.getSession().setAttribute("msg", msg);
				response.sendRedirect("Admin/gEnseignants/listerEnseig.jsp");
			}
		
	}

}
}