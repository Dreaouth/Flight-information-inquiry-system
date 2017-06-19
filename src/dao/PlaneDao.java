package dao;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import information.Plane;
import util.DBHelper;

public class PlaneDao {
    public static String getException(Throwable e){ 
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw, true);
        e.printStackTrace(pw);
        pw.flush();
        sw.flush();
        String excption=sw.toString().split("at")[0];
        excption=excption.split(":")[1];
        return excption;
}
	public String addPlane(Plane plane){
		String judge="ok";
		try {
			Connection conn=DBHelper.getConnection();
			String sql="insert into plane(startcity,lastcity,company,airlinecode,"
					+ "startDrome,arriveDrome,starttime,arrivetime,mode,week) values"
					+ "(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ptmt.setString(1, plane.getStartCity());
			ptmt.setString(2, plane.getLastCity());
			ptmt.setString(3, plane.getCompany());
			ptmt.setString(4, plane.getArilineCode());
			ptmt.setString(5, plane.getStartDrome());
			ptmt.setString(6, plane.getArriveDrome());
			ptmt.setString(7, plane.getStartTime());
			ptmt.setString(8, plane.getArriveTime());
			ptmt.setString(9, plane.getMode());
			ptmt.setString(10,plane.getWeek());
			ptmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			judge=getException(e);
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			judge=getException(e);
			e.printStackTrace();
		}
		return judge;
	}
	
	public boolean deletePlane(int id){
		try {
			Connection conn=DBHelper.getConnection();
			String sql="delete from plane where id='"+id+"';";
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public String updatePlane(Plane plane){
		String judge="ok";
		try {
			Connection conn=DBHelper.getConnection();
			String sql="update plane set startcity=?,lastcity=?,company=?,airlinecode=?,"
					+ "startDrome=?,arriveDrome=?,starttime=?,arrivetime=?,mode=?,week=? where id=?";
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ptmt.setString(1, plane.getStartCity());
			ptmt.setString(2, plane.getLastCity());
			ptmt.setString(3, plane.getCompany());
			ptmt.setString(4, plane.getArilineCode());
			ptmt.setString(5, plane.getStartDrome());
			ptmt.setString(6, plane.getArriveDrome());
			ptmt.setString(7, plane.getStartTime());
			ptmt.setString(8, plane.getArriveTime());
			ptmt.setString(9, plane.getMode());
			ptmt.setString(10,plane.getWeek());
			ptmt.setInt(11, plane.getId());
			ptmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			judge=getException(e);
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			judge=getException(e);
			e.printStackTrace();
		}
		return judge;
	}
	public List<Plane> queryAll(){
		try {
			Connection conn=DBHelper.getConnection();
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery("select * from plane;");
			List<Plane> planes=new ArrayList<>();
			Plane plane=null;
			while (rs.next()) {
				plane=new Plane();
				plane.setId(rs.getInt("id"));
				plane.setStartCity(rs.getString("startCity"));
				plane.setLastCity(rs.getString("lastCity"));
				plane.setCompany(rs.getString("company"));
				plane.setArilineCode(rs.getString("AirlineCode"));
				plane.setStartDrome(rs.getString("StartDrome"));
				plane.setArriveDrome(rs.getString("ArriveDrome"));
				plane.setStartTime(rs.getString("StartTime"));
				plane.setArriveTime(rs.getString("ArriveTime"));
				plane.setMode(rs.getString("Mode"));
				plane.setArilineStop(rs.getString("AirlineStop"));
				plane.setWeek(rs.getString("Week"));
				planes.add(plane);
			}
			return planes;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	public List<Plane> querybyId(String startcity,String arrivecity){
		try {
			Connection conn=DBHelper.getConnection();
			Statement stmt=conn.createStatement();
			String sql="select * from plane where startcity ='"
			+startcity+"' and lastcity='"+arrivecity+"';";
			ResultSet rs=stmt.executeQuery(sql);
			List<Plane> planes=new ArrayList<>();
			Plane plane=null;
			while (rs.next()) {
				plane=new Plane();
				plane.setId(rs.getInt("id"));
				plane.setStartCity(rs.getString("startCity"));
				plane.setLastCity(rs.getString("lastCity"));
				plane.setCompany(rs.getString("company"));
				plane.setArilineCode(rs.getString("AirlineCode"));
				plane.setStartDrome(rs.getString("StartDrome"));
				plane.setArriveDrome(rs.getString("ArriveDrome"));
				plane.setStartTime(rs.getString("StartTime"));
				plane.setArriveTime(rs.getString("ArriveTime"));
				plane.setMode(rs.getString("Mode"));
				plane.setArilineStop(rs.getString("AirlineStop"));
				plane.setWeek(rs.getString("Week"));
				planes.add(plane);
			}
			return planes;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	public static void main(String[] args) {
		PlaneDao dao=new PlaneDao();
		List<Plane> planes=dao.queryAll();
		System.out.println(planes.size());
		System.out.println(planes.get(2).getStartTime());
	}
}
