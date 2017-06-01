package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import information.Plane;
import util.DBHelper;

public class PlaneDao {
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
