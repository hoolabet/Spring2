package org.spring2.dbTest;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class DBCPTest {
	@Autowired
	private DataSource dataSource;
	
	@Test
	public void testConnection() throws Exception{
		try(Connection con = dataSource.getConnection()){
			System.out.println("성공");
		}catch(Exception e){
			System.out.println("실패");
			e.printStackTrace();
		}
	}
}
