package util;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBHelper {
     private static final String driver="com.mysql.jdbc.Driver";   //数据库驱动
     //连接数据库的URL地址
     private static final String url="jdbc:mysql://localhost:3306/liujun?useUnicode=true&characterEncoding=utf-8&useSSL=false";
     private static final String username="root";   //数据库的用户名
     private static final String password="123456";       //数据库的密码 
     
     private static Connection conn=null;
     
     //静态代码块负责加载驱动
     static{
    	 try{
    		 Class.forName(driver);
    	 }
    	 catch (Exception e) {
			// TODO: handle exception
    		 e.printStackTrace();
		}
     }
     public static Connection getConnection() throws Exception {
    	 if (conn==null) {
			conn=DriverManager.getConnection(url,username,password);
			return conn;
		}
    	 return conn;
	}
     public static void main(String[] args) {
		try{
			Connection connection=DBHelper.getConnection();
			if (conn!=null) {
				System.out.println("数据库连接正常");
			}
			else {
				System.out.println("数据库连接异常");
			}
			connection.close();
		}
		catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
}
