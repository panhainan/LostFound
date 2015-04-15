/**
 * 
 */
package com.phn.service;

import javax.annotation.Resource;

import org.hibernate.cfg.AnnotationConfiguration;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.phn.entity.Admin;

/**
 * @author phn
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class AdminServiceTest {
	@Resource
	private AdminService adminService;
    @BeforeClass  
    public static void beforeClass()  
    {     
        System.out.println("Junit for Service Test begin ：------------------------------");
    }  
	
	
	public void delAdminTest(){
		Admin a = new Admin();
		a.setId(1);
		this.adminService.deleteAdmin(a);
		System.out.println("删除管理员成功!");
	}
	@Test
	public void validAdminTest(){
		Admin a = new Admin();
		a.setAdminname("123");
		a.setAdminpassword("123");
		this.adminService.validAdmin(a);
		System.out.println("完成验证!");
	}
	
	public void addAdminTest(){
		Admin a = new Admin();
		a.setAdminname("gel");
		a.setAdminpassword("123456");
		this.adminService.addAdmin(a);
		System.out.println("添加管理员成功!");
	}
	
    @AfterClass  
    public static void afterClass()  
    {  
    	System.out.println("Junit for Service Test end !----------------------------------");
    } 
}
