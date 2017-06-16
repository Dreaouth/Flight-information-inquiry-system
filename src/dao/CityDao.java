package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import information.City;
import util.DBHelper;

public class CityDao {
	public boolean addCity(City city){
		try {
			Connection conn=DBHelper.getConnection();
			String sql="insert into city(province,cityname,citycode,dromename) "+
			"values(?,?,?,?);";
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ptmt.setString(1, city.getProvince());
			ptmt.setString(2, city.getCityName());
			ptmt.setString(3, city.getCityCode());
			ptmt.setString(4, city.getDromeName());
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
			String sql="delete from city where cityname=? or citycode=?";
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ptmt.setString(1, information);
			ptmt.setString(2, information);
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
	public List<City> queryAll(){
		try {
			Connection conn=DBHelper.getConnection();
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery("select * from city;");
			List<City> cities=new ArrayList<>();
			City city=null;
			while (rs.next()) {
				city=new City();
				city.setId(rs.getInt("id"));
				city.setCityCode(rs.getString("cityCode"));
				city.setCityName(rs.getString("cityname"));
				city.setProvince(rs.getString("province"));
				city.setDromeName(rs.getString("dromename"));
				cities.add(city);
			}
			return cities;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	public List<City> query(String queryItem){
		try {
			Connection conn=DBHelper.getConnection();
			Statement stmt=conn.createStatement();
			String sql="select * from city where cityname ='"
			+queryItem+"' or citycode='"+queryItem+"' or dromename='"+queryItem+"';";
			ResultSet rs=stmt.executeQuery(sql);
			List<City> cities=new ArrayList<>();
			City city=null;
			while (rs.next()) {
				city=new City();
				city.setCityCode(rs.getString("citycode"));
				city.setCityName(rs.getString("cityname"));
				city.setProvince(rs.getString("province"));
				city.setDromeName(rs.getString("dromename"));
				cities.add(city);
			}
			return cities;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	public static void main(String[] args) {
		CityDao dao=new CityDao();
//		List<City> list=dao.queryAll();
//		System.out.println(list.size());
//		List<City> city=dao.query("BJS");
//		System.out.println(city.size());
//		City city=new City();
//		city.setCityCode("11");
//		city.setId(111);
//		city.setProvince("ssss");
//		dao.addCity(city);
		String city="AAA";
		boolean a=dao.deleteCity(city);
		System.out.println(a);
	}
}
