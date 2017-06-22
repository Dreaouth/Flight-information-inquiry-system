package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CityDao;
import information.City;

/**
 * Servlet implementation class QueryServlet
 */
@WebServlet("/QueryServlet")
public class QueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String action ;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryServlet() {
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
				List<City> list=queryAll();
				request.setAttribute("citylist",list);
				request.getRequestDispatcher("QueryCity.jsp").forward(request, response);
			}
			if (action.equals("show")) {
				String queryItem=request.getParameter("sta_name");
				List<City> list=query(queryItem);
				request.setAttribute("citylist",list);
				request.setAttribute("sta_name",queryItem);
				request.getRequestDispatcher("QueryCity.jsp").forward(request, response);
			}
		}
	}
	public List<City> queryAll(){
		CityDao dao=new CityDao();
		List<City> list=dao.queryAll();
		return list;
	}
	public List<City> query(String qString) {
		CityDao dao=new CityDao();
		List<City> list=dao.query(qString);
		return list;
	}
}
