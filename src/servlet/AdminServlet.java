package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import information.Users;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String action;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		if (request.getParameter("action")!=null) {
			this.action=request.getParameter("action");
			if (action.equals("showall")) {
				List<Users> list=queryAll();
				request.setAttribute("userlist",list);
				request.getRequestDispatcher("admin_list.jsp").forward(request, response);
			}
			if (action.equals("addusers")) {
				String username=request.getParameter("adminname");
				String password=request.getParameter("newpassword");
				String password2=request.getParameter("newpassword2");
				String status=request.getParameter("status");
				if (password.equals(password2)) {
					Users users=new Users();
					users.setUsername(username);
					users.setPassword(password);
					users.setStatus(status);
					if (addUsers(users)) {
						List<Users> list=queryAll();
						request.setAttribute("userlist",list);
						request.getRequestDispatcher("admin_list.jsp").forward(request, response);
					}else {
						request.getRequestDispatcher("add_admin_failure1.jsp").forward(request, response);
					}
				}
				else {
					request.getRequestDispatcher("add_admin_failure2.jsp").forward(request, response);
				}
			}
			if (action.equals("updateusers")) {
				String id=request.getParameter("id");
				String username=request.getParameter("username");
				String password=request.getParameter("password");
				String status=request.getParameter("status");
				Users users=new Users();
				users.setId(Integer.parseInt(id));
				users.setUsername(username);
				users.setPassword(password);
				users.setStatus(status);
				boolean judge=updateUsers(users);
				if (judge) {
					List<Users> list=queryAll();
					request.setAttribute("userlist",list);
					request.getRequestDispatcher("admin_list.jsp").forward(request, response);				
				}
				else {
					request.getRequestDispatcher("update_admin_failure.jsp").forward(request, response);
				}
			}
			if (action.equals("deleteusers")) {
				String id=request.getParameter("sta_id");
				System.out.println(id);
				boolean judge=deleteUsers(Integer.parseInt(id));
				if (!judge) {
					request.getRequestDispatcher("delete_admin_failure.jsp").forward(request, response);
				}
				else {
					System.out.println("³É¹¦É¾³ý");
				}
			}
		}
		
	}
	private List<Users> queryAll(){
		UserDao dao=new UserDao();
		List<Users> list=dao.queryAll();
		return list;
	}
	private boolean addUsers(Users users){
		UserDao dao=new UserDao();
		return dao.addUsersfromadmin(users);
	}
	private boolean deleteUsers(int id){
		UserDao dao=new UserDao();
		return dao.delUsers(id);
	}
	private boolean updateUsers(Users users){
		UserDao dao=new UserDao();
		return dao.updateUsers(users);
	}

}
