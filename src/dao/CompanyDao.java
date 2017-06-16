package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import information.Company;
import util.DBHelper;

public class CompanyDao {
	public List<Company> queryAll(){
		try {
			Connection conn=DBHelper.getConnection();
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery("select * from company;");
			List<Company> companies=new ArrayList<>();
			Company company=null;
			while (rs.next()) {
				company=new Company();
				company.setId(rs.getInt("id"));
				company.setName(rs.getString("name"));
				companies.add(company);
			}
			return companies;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	public List<Company> query(String queryItem){
		try {
			Connection conn=DBHelper.getConnection();
			Statement stmt=conn.createStatement();
			String sql="select * from Company where name ='"+queryItem+"';";
			ResultSet rs=stmt.executeQuery(sql);
			List<Company> companies=new ArrayList<>();
			Company company=null;
			while (rs.next()) {
				company=new Company();
				company.setId(rs.getInt("id"));
				company.setName(rs.getString("name"));
				companies.add(company);
			}
			return companies;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	public static void main(String[] args) {
		CompanyDao dao=new CompanyDao();
		List<Company> companies=dao.query("上海航空公司");
		System.out.println(companies.size());
	}
}
