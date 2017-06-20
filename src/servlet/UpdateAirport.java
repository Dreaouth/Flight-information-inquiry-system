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
 * Servlet implementation class UpdateAirport
 */
@WebServlet("/UpdateAirport")
public class UpdateAirport extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String action;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAirport() {
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
				request.getRequestDispatcher("update_airport.jsp").forward(request, response);	
			}
			if (action.equals("show")) {
				String queryItem=request.getParameter("sta_name");
				List<City> list=query(queryItem);
				request.setAttribute("citylist",list);
				request.setAttribute("sta_name",queryItem);
				request.getRequestDispatcher("update_airport.jsp").forward(request, response);	
			}
			if (action.equals("updatecity")) {
				String citycode=request.getParameter("add_citycode");
				String cityname=request.getParameter("add_cityname");
				String province=request.getParameter("add_province");
				String drome=request.getParameter("add_drome");
				System.out.println(drome);
				City city=new City();
				city.setCityCode(citycode);
				city.setCityName(cityname);
				city.setProvince(province);
				city.setDromeName(drome);
				boolean judge=updateCity(city);
				if (judge) {
					List<City> list=queryAll();
					request.setAttribute("citylist",list);
					request.getRequestDispatcher("update_airport.jsp").forward(request, response);					
				}
				else {
					request.getRequestDispatcher("update_airport_failure.jsp").forward(request, response);
				}
			}
			if (action.equals("deleteCity")) {
				String id=request.getParameter("sta_id");
				boolean judge=deleteCity(id);
				if (!judge) {
					request.getRequestDispatcher("update_airport_failure.jsp").forward(request, response);
				}
				else {
					System.out.println("³É¹¦É¾³ý");
				}
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
	private boolean updateCity(City city){
		CityDao dao=new CityDao();
		return dao.updateCity(city);
	}
	private boolean deleteCity(String citycode){
		CityDao dao=new CityDao();
		return dao.deleteCity(citycode);
	}

}
