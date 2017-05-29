package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import information.Users;
import util.DBHelper;

//用户的业务逻辑层
public class UserDao {
	public boolean addUsers(Users users){
		try {
			Connection conn=DBHelper.getConnection();
			String sql="insert into users "+
			"values(?,?);";
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ptmt.setString(1, users.getUsername());
			ptmt.setString(2, users.getPassword());
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
	public boolean delUsers(String username) {
		try {
			Connection conn=DBHelper.getConnection();
			String sql="delete from users where username=? ";
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ptmt.setString(1, username);
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
	public List<Users> queryAll(){
		try {
			Connection conn=DBHelper.getConnection();
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery("select * from users;");
			List<Users> us=new ArrayList<>();
			Users user=null;
			while (rs.next()) {
				user=new Users();
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				us.add(user);
			}
			return us;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("SQL语句出现问题");
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	public static void main(String[] args) {
		UserDao dao=new UserDao();
//		List<Users> users=dao.queryAll();
		dao.delUsers("a1");
	}
}
