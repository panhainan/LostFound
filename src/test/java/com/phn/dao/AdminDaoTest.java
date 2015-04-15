/**
 * 
 */
package com.phn.dao;


import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.phn.entity.Admin;

/**
 * @author phn
 * 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class AdminDaoTest {
	@Autowired
	private AdminDao adminDao;
    @BeforeClass  
    public static void beforeClass()  
    {     
        System.out.println("Junit for Dao Test begin ：----------------------------");
    }  
	
	@Test
	public void addAdminTest(){
		Admin a = new Admin();
		a.setAdminname("phn");
		a.setAdminpassword("123456");
		this.adminDao.addAdmin(a);
		System.out.println("添加管理员成功!");
	}
	
    @AfterClass  
    public static void afterClass()  
    {  
    	System.out.println("Junit for Dao Test end !--------------------------------");
    } 
	
}
