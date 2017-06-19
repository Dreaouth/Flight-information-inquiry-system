package servlet;

import java.io.IOException;

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
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String action;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
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
			if (action.equals("updatecity")) {
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
					request.getRequestDispatcher("add_airport_failure.jsp").forward(request, response);
				}
			}
			if (action.equals("updateplane")) {
				String startcity=request.getParameter("add_startcity");
				String lastcity=request.getParameter("add_lastcity");
				String company=request.getParameter("add_company");
				String arilinecode=request.getParameter("add_arilineCode");
				String startDrome=request.getParameter("add_startDrome");
				String arriveDrome=request.getParameter("add_arriveDrome");
				String startTime=request.getParameter("add_startTime");
				String arriveTime=request.getParameter("add_arriveTime");
				String stop=request.getParameter("add_stop");
				String mode=request.getParameter("add_mode");
				String[] weekAll=request.getParameterValues("add_week");
				String week="";
				for(String aString:weekAll){
					week=week.concat(aString);
				}
				System.out.println(weekAll.length);
				System.out.println(week);
				Plane plane=new Plane();
				plane.setStartCity(startcity);
				plane.setLastCity(lastcity);
				plane.setCompany(company);
				plane.setArilineCode(arilinecode);
				plane.setStartDrome(startDrome);
				plane.setArriveDrome(arriveDrome);
				plane.setStartTime(startTime);
				plane.setArriveTime(arriveTime);
				plane.setArilineStop(stop);
				plane.setMode(mode);
				plane.setWeek(week);
				String judge=addPlane(plane);
				System.out.println("judge="+judge);
				if (judge.equals("ok")) {
					planes.add(plane);
					request.setAttribute("planeList", planes);
					request.getRequestDispatcher("add_plane.jsp").forward(request, response);					
				}
				else {
					request.setAttribute("judge",judge);
					request.getRequestDispatcher("add_plane_failure.jsp").forward(request, response);
				}
			}
			if (action.equals("updateplanemode")) {
				String id=request.getParameter("add_mode_id");
				String name=request.getParameter("add_mode_name");
				AirplaneMode mode=new AirplaneMode();
				mode.setId(Integer.parseInt(id));
				mode.setName(name);
				boolean judge=addMode(mode);
				if (judge) {
					modes.add(mode);
					request.setAttribute("modeList", modes);
					request.getRequestDispatcher("add_mode.jsp").forward(request, response);					
				}
				else {
					request.getRequestDispatcher("add_mode_failure.jsp").forward(request, response);
				}
			}
			if (action.equals("deletecity")) {
				String id=request.getParameter("add_mode_id");
				String name=request.getParameter("add_mode_name");
				AirplaneMode mode=new AirplaneMode();
				mode.setId(Integer.parseInt(id));
				mode.setName(name);
				boolean judge=addMode(mode);
				if (judge) {
					modes.add(mode);
					request.setAttribute("modeList", modes);
					request.getRequestDispatcher("add_mode.jsp").forward(request, response);					
				}
				else {
					request.getRequestDispatcher("add_mode_failure.jsp").forward(request, response);
				}
			}
			if (action.equals("deleteplane")) {
				String id=request.getParameter("add_mode_id");
				String name=request.getParameter("add_mode_name");
				AirplaneMode mode=new AirplaneMode();
				mode.setId(Integer.parseInt(id));
				mode.setName(name);
				boolean judge=addMode(mode);
				if (judge) {
					modes.add(mode);
					request.setAttribute("modeList", modes);
					request.getRequestDispatcher("add_mode.jsp").forward(request, response);					
				}
				else {
					request.getRequestDispatcher("add_mode_failure.jsp").forward(request, response);
				}
			}
			if (action.equals("deleteplanemode")) {
				String id=request.getParameter("add_mode_id");
				String name=request.getParameter("add_mode_name");
				AirplaneMode mode=new AirplaneMode();
				mode.setId(Integer.parseInt(id));
				mode.setName(name);
				boolean judge=addMode(mode);
				if (judge) {
					modes.add(mode);
					request.setAttribute("modeList", modes);
					request.getRequestDispatcher("add_mode.jsp").forward(request, response);					
				}
				else {
					request.getRequestDispatcher("add_mode_failure.jsp").forward(request, response);
				}
			}
		}
		
	}
	private boolean updateCity(City city){
		CityDao dao=new CityDao();
		return dao.updateCity(city);
	}
	private String updatePlane(Plane plane){
		PlaneDao dao=new PlaneDao();
		return dao.updatePlane(plane);
	}
	private boolean update
	

}
