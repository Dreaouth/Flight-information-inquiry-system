package util;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBHelper {
     private static final String driver="com.mysql.jdbc.Driver";   //���ݿ�����
     //�������ݿ��URL��ַ
     private static final String url="jdbc:mysql://localhost:3306/liujun?useUnicode=true&characterEncoding=utf-8&useSSL=false";
     private static final String username="root";   //���ݿ���û���
     private static final String password="123456";       //���ݿ������ 
     
     private static Connection conn=null;
     
     //��̬����鸺���������
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
				System.out.println("���ݿ���������");
			}
			else {
				System.out.println("���ݿ������쳣");
			}
			connection.close();
		}
		catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
}
