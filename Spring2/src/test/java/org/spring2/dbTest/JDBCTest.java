package org.spring2.dbTest;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCTest {
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/boardExam?serverTimezone=Asia/Seoul";
	String id = "root";
	String pw = "1234";
	
	@Test
	public void testConnection() throws Exception {
		Connection conn = null;
		Class.forName(driver);
		try{
			conn = DriverManager.getConnection(url,id,pw);

			System.out.println("성공");

		}catch(Exception e){
			System.out.println("실패");
			e.printStackTrace();
		}
	}
}
