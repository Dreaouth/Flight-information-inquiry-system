package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import information.AirplaneMode;
import util.DBHelper;

public class AirplaneDao {
	public boolean addAirplane(AirplaneMode airplaneMode){
		try {
			Connection conn=DBHelper.getConnection();
			String sql="insert into AirplaneMode(id,name) "+
			"values(?,?);";
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ptmt.setInt(1, airplaneMode.getId());
			ptmt.setString(2, airplaneMode.getName());
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
	public boolean deleteCity(String information){
		try {
			Connection conn=DBHelper.getConnection();
			String sql="delete from AirplaneMode where name=?";
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ptmt.setString(1, information);
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
	public List<AirplaneMode> queryAll(){
		try {
			Connection conn=DBHelper.getConnection();
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery("select * from AirplaneMode;");
			List<AirplaneMode> airplaneModes=new ArrayList<>();
			AirplaneMode airplaneMode=null;
			while (rs.next()) {
				airplaneMode=new AirplaneMode();
				airplaneMode.setId(rs.getInt("id"));
				airplaneMode.setName(rs.getString("name"));
				airplaneModes.add(airplaneMode);
			}
			return airplaneModes;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	public List<AirplaneMode> query(String queryItem){
		try {
			Connection conn=DBHelper.getConnection();
			Statement stmt=conn.createStatement();
			String sql="select * from AirplaneMode where name ='"+queryItem+"';";
			ResultSet rs=stmt.executeQuery(sql);
			List<AirplaneMode> airplaneModes=new ArrayList<>();
			AirplaneMode airplaneMode=null;
			while (rs.next()) {
				airplaneMode=new AirplaneMode();
				airplaneMode.setId(rs.getInt("id"));
				airplaneMode.setName(rs.getString("name"));
				airplaneModes.add(airplaneMode);
			}
			return airplaneModes;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	public static void main(String[] args) {
		AirplaneDao dao=new AirplaneDao();
		List<AirplaneMode> airplaneModes=dao.query("737");
		System.out.println(airplaneModes.size());
	}
}
