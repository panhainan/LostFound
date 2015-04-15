/**
 * 
 */
package com.phn.database;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


/**
 * @author phn
 *
 */
public class TableTest {
	private static SessionFactory sessionFactory = null;  
    
    @BeforeClass  
    public static void beforeClass()  
    {     
        sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();  
    }  
      
    @Test  
    public void testSave()  
    {  
       System.out.println("建表成功");
    }  
  
    @AfterClass  
    public static void afterClass()  
    {  
        sessionFactory.close();  
    }  
}  
