package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import information.Users;

/**
 * Servlet implementation class ReigsterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		String username,password,againPassword;
		username=request.getParameter("username");
		password=request.getParameter("password");
		againPassword=request.getParameter("password2");
		if (password.equals(againPassword)) {
			Users users=new Users();
			users.setUsername(username);
			users.setPassword(password);
			UserDao dao=new UserDao();
			if (dao.addUsersfromregister(users)) {
				request.getRequestDispatcher("registerok.jsp").forward(request, response);
			}
			else{
				request.getRequestDispatcher("register_failure2.jsp").forward(request, response);
			}
		}
		else {
			request.getRequestDispatcher("register_failure.jsp").forward(request, response);
		}
	}
}
