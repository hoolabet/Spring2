package org.spring2.dbTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.spring2.mapper.TestMapper2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class TestMapperTest2 {
	@Autowired
	private TestMapper2 testMapper;
	
	@Test
	public void testGetTime() {
		int i = 0;
		while(testMapper.getName().get(i) != null) {
			System.out.println(testMapper.getName().get(i));
			i++;
		}
	}
}