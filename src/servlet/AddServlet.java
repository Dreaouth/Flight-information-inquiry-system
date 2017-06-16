package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CityDao;
import dao.PlaneDao;
import information.AirplaneMode;
import information.City;
import information.Plane;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String action;
	List<City> cities=new ArrayList<>();
	List<Plane> planes=new ArrayList<>();
	List<AirplaneMode> modes=new ArrayList<>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddServlet() {
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
			if (action.equals("addcity")) {
				String citycode=request.getParameter("add_citycode");
				String cityname=request.getParameter("add_cityname");
				String province=request.getParameter("add_province");
				String drome=request.getParameter("add_drome");
				City city=new City();
				city.setCityCode(citycode);
				city.setCityName(cityname);
				city.setProvince(province);
				city.setDromeName(drome);
				boolean judge=addCity(city);
				if (judge) {
					cities.add(city);
					request.setAttribute("citylist", cities);
					request.getRequestDispatcher("add_airport.jsp").forward(request, response);					
				}
				else {
					request.getRequestDispatcher("add_airport_in.jsp").forward(request, response);
				}
			}
			if (action.equals("addplane")) {
				String startcity=request.getParameter("add_startcity");
				String lastcity=request.getParameter("add_lastcity");
				String company=request.getParameter("add_company");
				String arilinecode=request.getParameter("add_arilineCode");
				String startDrome=request.getParameter("add_startDrome");
				String arriveDrome=request.getParameter("add_startDrome");
				String startTime=request.getParameter("add_startTime");
				String arriveTime=request.getParameter("add_arriveTime");
				String mode=request.getParameter("add_mode");
				String week=request.getParameter("add_week");
//				List<Company> list=query(queryItem);
//				request.setAttribute("companylist",list);
//				request.setAttribute("company_name",queryItem);
//				request.getRequestDispatcher("QueryCompany.jsp").forward(request, response);
			}
			if (action.equals("addplanemode")) {
//				String queryItem=request.getParameter("company_name");
//				List<Company> list=query(queryItem);
//				request.setAttribute("companylist",list);
//				request.setAttribute("company_name",queryItem);
//				request.getRequestDispatcher("QueryCompany.jsp").forward(request, response);
			}
		}
	}
	private boolean addCity(City city){
		CityDao dao=new CityDao();
		return dao.addCity(city);
	}
	private boolean addPlane(Plane plane){
		PlaneDao dao=new PlaneDao();
		return dao.addPlane(plane);
	}
}
