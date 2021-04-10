package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Profdao;
import model.Prof;

/**
 * Servlet implementation class espacePro
 */
@WebServlet("/ProContr")
public class ProContr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProContr() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/accProf.html").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String psw = request.getParameter("psw");
		Profdao pd = new Profdao();
		
		Prof p = pd.getProf(email, psw);
		String msg = null;
		if( p != null) {
			request.setAttribute("prof",p);
			request.getSession().setAttribute("prof", p);
			this.getServletContext().getRequestDispatcher("/WEB-INF/view/espaceProf.jsp").forward(request, response);
		}else {
			msg = "Email or Password invalid!";
			request.setAttribute("msg", msg);
			this.getServletContext().getRequestDispatcher("/accProf.jsp").forward(request, response);
			
		}
		
	}

}
