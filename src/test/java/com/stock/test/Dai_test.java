package com.stock.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class) // 整合
@ContextConfiguration(locations = { "classpath*:spring-mybatis.xml", "classpath*:spring-mvc.xml" })

public class Dai_test {


	// 测试已通过
	@Test
	public void test() {
		System.out.println("this is a test made by sandaoliu ");
	}

	// 测试服务类，已通过
	@Test
	public void tesrUser() {
		
	}

}
