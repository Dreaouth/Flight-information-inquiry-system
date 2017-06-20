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
 * Servlet implementation class UpdateTicket
 */
@WebServlet("/UpdateTicket")
public class UpdateTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String action;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTicket() {
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
				request.getRequestDispatcher("update_ticket.jsp").forward(request, response);
			}
			if (action.equals("show")) {
				String startcity=request.getParameter("ticket_start");
				String arrivecity=request.getParameter("ticket_arrive");
				List<Ticket> tickets=query(startcity, arrivecity);
				request.setAttribute("ticketlist", tickets);
				request.getRequestDispatcher("update_ticket.jsp").forward(request, response);
			}
			if (action.equals("updateticket")) {
				String id=request.getParameter("add_id");
				String startCode=request.getParameter("add_startCode");
				String startcityname=request.getParameter("add_startcityname");
				String arriveCode=request.getParameter("add_arriveCode");
				String arriveCityname=request.getParameter("add_arriveCityname");
				String number=request.getParameter("add_number");
				String price=request.getParameter("add_price");
				Ticket ticket=new Ticket();
				ticket.setId(Integer.parseInt(id));
				ticket.setStartCode(startCode);
				ticket.setStartcityname(startcityname);
				ticket.setArriveCode(arriveCode);
				ticket.setArriveCityname(arriveCityname);
				ticket.setNumber(Integer.parseInt(number));
				ticket.setPrice(Integer.parseInt(price));
				boolean judge=updateTicket(ticket);
				if (judge) {
					List<Ticket> list=queryAll();
					request.setAttribute("ticketlist",list);
					request.getRequestDispatcher("update_ticket.jsp").forward(request, response);					
				}
				else {
					request.getRequestDispatcher("update_ticket_failure.jsp").forward(request, response);
				}
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
	public boolean updateTicket(Ticket ticket){
		TicketDao dao=new TicketDao();
		return dao.updateTicket(ticket);
	}
}
