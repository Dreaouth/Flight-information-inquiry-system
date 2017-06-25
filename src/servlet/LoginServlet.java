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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String username,password;
		username=request.getParameter("username");
		password=request.getParameter("password");
		Users users=new Users();
		users.setUsername(username);
		users.setPassword(password);
		if (!isQuery(users).equals("false")) {
			users.setStatus(isQuery(users));
			request.setAttribute("users", users);
			request.getRequestDispatcher("welcome.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("login_failure.jsp").forward(request, response);
		}
	}
	private String isQuery(Users users){
		UserDao dao=new UserDao();
		List<Users> list=dao.queryAll();
		for(Users users2:list){
			if (users.getUsername().equals(users2.getUsername())) {
				if (users.getPassword().equals(users2.getPassword())) {
					String status=users2.getStatus();
					return status;
				}
			}
		}
		return "false";
	}
}
