package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TicketDao;
import information.Ticket;

/**
 * Servlet implementation class Queryticket
 */
@WebServlet("/Queryticket")
public class Queryticket extends HttpServlet {
	private String action;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Queryticket() {
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
				List<Ticket> list=queryAll();
				request.setAttribute("ticketlist", list);
				request.getRequestDispatcher("QueryTicket.jsp").forward(request, response);
			}
			if (action.equals("show")) {
				String startcity=request.getParameter("ticket_start");
				String arrivecity=request.getParameter("ticket_arrive");
				List<Ticket> tickets=query(startcity, arrivecity);
				request.setAttribute("ticketlist", tickets);
				request.getRequestDispatcher("QueryTicket.jsp").forward(request, response);
			}
		}
	}
	public List<Ticket> queryAll(){
		TicketDao dao=new TicketDao();
		List<Ticket> tickets=dao.queryAll();
		return tickets;
	}
	public List<Ticket> query(String startcity,String arrivecity){
		TicketDao dao=new TicketDao();
		List<Ticket> tickets=dao.query(startcity, arrivecity);
		return tickets;
	}

}
