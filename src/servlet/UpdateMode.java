package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AirplaneDao;
import information.AirplaneMode;

/**
 * Servlet implementation class UpdateMode
 */
@WebServlet("/UpdateMode")
public class UpdateMode extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String action;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMode() {
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
				List<AirplaneMode> list=queryAll();
				request.setAttribute("planenamelist",list);
				request.getRequestDispatcher("update_mode.jsp").forward(request, response);
			}
			if (action.equals("show")) {
				String queryItem=request.getParameter("plane_name");
				List<AirplaneMode> list=query(queryItem);
				request.setAttribute("planenamelist",list);
				request.setAttribute("plane_name",queryItem);
				request.getRequestDispatcher("update_mode.jsp").forward(request, response);
			}
			if (action.equals("updateMode")) {
				String id=request.getParameter("add_mode_id");
				String name=request.getParameter("add_mode_name");
				AirplaneMode mode=new AirplaneMode();
				mode.setId(Integer.parseInt(id));
				mode.setName(name);
				boolean judge=updateMode(mode);
				if (judge) {
					List<AirplaneMode> list=queryAll();
					request.setAttribute("planenamelist", list);
					request.getRequestDispatcher("update_mode.jsp").forward(request, response);					
				}
				else {
					request.getRequestDispatcher("update_mode_failure.jsp").forward(request, response);
				}
			}
			if (action.equals("deleteMode")) {
				String id=request.getParameter("sta_id");
				boolean judge=deleteMode(id);
				if (!judge) {
					request.getRequestDispatcher("update_mode_failure.jsp").forward(request, response);
				}
				else {
					System.out.println("É¾³ý³É¹¦");
				}
			}
		}
	}
	public List<AirplaneMode> queryAll(){
		AirplaneDao dao=new AirplaneDao();
		List<AirplaneMode> airplaneModes=dao.queryAll();
		return airplaneModes;
	}
	public List<AirplaneMode> query(String name){
		AirplaneDao dao=new AirplaneDao();
		List<AirplaneMode> airplaneModes=dao.query(name);
		return airplaneModes;
	}
	private boolean updateMode(AirplaneMode mode){
		AirplaneDao dao=new AirplaneDao();
		return dao.updateAirplane(mode);
	}
	private boolean deleteMode(String information){
		AirplaneDao dao=new AirplaneDao();
		return dao.deleteCity(information);
	}

}
