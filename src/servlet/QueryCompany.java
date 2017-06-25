package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CompanyDao;
import information.Company;

/**
 * Servlet implementation class QueryCompany
 */
@WebServlet("/QueryCompany")
public class QueryCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String action;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryCompany() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		if (request.getParameter("action")!=null) {
			this.action=request.getParameter("action");
			if (action.equals("showall")) {
				List<Company> list=queryAll();
				request.setAttribute("companylist",list);
				request.getRequestDispatcher("QueryCompany.jsp").forward(request, response);
			}
			if (action.equals("show")) {
				String queryItem=request.getParameter("company_name");
				List<Company> list=query(queryItem);
				request.setAttribute("companylist",list);
				request.setAttribute("company_name",queryItem);
				request.getRequestDispatcher("QueryCompany.jsp").forward(request, response);
			}
		}
	}
	public List<Company> queryAll(){
		CompanyDao dao=new CompanyDao();
		List<Company> list=dao.queryAll();
		return list;
	}
	public List<Company> query(String qString) {
		CompanyDao dao=new CompanyDao();
		List<Company> list=dao.query(qString);
		return list;
	}

}
