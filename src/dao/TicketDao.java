package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import information.Ticket;
import util.DBHelper;

public class TicketDao {
	public boolean updateTicket(Ticket ticket){
		try {
			Connection conn=DBHelper.getConnection();
			String sql="update ticket set startcode=?,startcityname=?,arrivecode=?,arrivecityname=?"
					+ ",number=?,price=? where id=?";
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ptmt.setString(1, ticket.getStartCode());
			ptmt.setString(2, ticket.getStartcityname());
			ptmt.setString(3, ticket.getArriveCode());
			ptmt.setString(4, ticket.getArriveCityname());
			ptmt.setInt(5, ticket.getNumber());
			ptmt.setInt(6, ticket.getPrice());
			ptmt.setInt(7, ticket.getId());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
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
