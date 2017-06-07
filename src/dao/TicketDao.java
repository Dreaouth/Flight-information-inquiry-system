package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import information.Ticket;
import util.DBHelper;

public class TicketDao {
	public List<Ticket> queryAll(){
		try {
			Connection conn=DBHelper.getConnection();
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery("select * from Ticket;");
			List<Ticket> tickets=new ArrayList<>();
			Ticket ticket=null;
			while (rs.next()) {
				ticket=new Ticket();
				ticket.setId(rs.getInt("id"));
				ticket.setStartCode(rs.getString("startcode"));
				ticket.setStartcityname(rs.getString("startcityname"));
				ticket.setArriveCode(rs.getString("arrivecode"));
				ticket.setArriveCityname(rs.getString("arrivecityname"));
				ticket.setNumber(rs.getInt("number"));
				ticket.setPrice(rs.getInt("price"));
				tickets.add(ticket);
			}
			return tickets;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	public List<Ticket> query(String startcity,String arrivecity){
		try {
			Connection conn=DBHelper.getConnection();
			Statement stmt=conn.createStatement();
			String sql="select * from Ticket where startcityname ='"
					+startcity+"' and arrivecityname='"+arrivecity+"';";
			ResultSet rs=stmt.executeQuery(sql);
			List<Ticket> tickets=new ArrayList<>();
			Ticket ticket=null;
			while (rs.next()) {
				ticket=new Ticket();
				ticket.setId(rs.getInt("id"));
				ticket.setStartCode(rs.getString("startcode"));
				ticket.setStartcityname(rs.getString("startcityname"));
				ticket.setArriveCode(rs.getString("arrivecode"));
				ticket.setArriveCityname(rs.getString("arrivecityname"));
				ticket.setNumber(rs.getInt("number"));
				ticket.setPrice(rs.getInt("price"));
				tickets.add(ticket);
			}
			return tickets;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	public static void main(String[] args) {
		TicketDao dao=new TicketDao();
		List<Ticket> tickets=dao.query("π„÷›","≥§…≥");
		System.out.println(tickets.size());
		System.out.println(tickets.get(4).getPrice());
	}
}
