package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PlaneDao;
import information.Plane;

/**
 * Servlet implementation class UpdatePlane
 */
@WebServlet("/UpdatePlane")
public class UpdatePlane extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String action;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePlane() {
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
				List<Plane> planes=queryAll();
				request.setAttribute("planeList", planes);
				request.getRequestDispatcher("update_plane.jsp").forward(request,response);
			}
			if (action.equals("show")) {
				String select=request.getParameter("sel_city");
				System.out.println(select);
				if (select.equals("100")) {
					
				}
				if (select.equals("0")) {
					String startcity=request.getParameter("sta_start");
					String arrivecity=request.getParameter("sta_arrive");
					List<Plane> planes=queryById(startcity, arrivecity);
					request.setAttribute("planeList", planes);
					request.getRequestDispatcher("update_plane.jsp").forward(request, response);
				}
			}
			if (action.equals("updateplane")) {
				String id=request.getParameter("add_id");
				System.out.println(id);
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
				plane.setId(Integer.parseInt(id));
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
				String judge=updatePlane(plane);
				System.out.println("judge="+judge);
				if (judge.equals("ok")) {
					List<Plane> list=queryAll();
					request.setAttribute("planeList", list);
					request.getRequestDispatcher("update_plane.jsp").forward(request, response);					
				}
				else {
					request.setAttribute("judge",judge);
					request.getRequestDispatcher("update_plane_failure.jsp").forward(request, response);
				}
			}
			if (action.equals("deleteplane")) {
				String id=request.getParameter("sta_id");
				boolean judge=deletePlane(id);
				if (!judge) {
					request.getRequestDispatcher("update_plane_failure.jsp").forward(request, response);
				}
				else {
					System.out.println("³É¹¦É¾³ý");
				}
			}
		}
	}
	public List<Plane> queryAll(){
		PlaneDao dao=new PlaneDao();
		List<Plane> list=dao.queryAll();
		return list;
	}
	public List<Plane> queryById(String startcity,String arrivecity){
		PlaneDao dao=new PlaneDao();
		List<Plane> list=dao.querybyId(startcity, arrivecity);
		return list;
	}
	private String updatePlane(Plane plane){
		PlaneDao dao=new PlaneDao();
		return dao.updatePlane(plane);
	}
	private boolean deletePlane(String id){
		PlaneDao dao=new PlaneDao();
		return dao.deletePlane(id);
	}

}
