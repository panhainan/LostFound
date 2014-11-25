/**
 * 
 */
package com.phn.dao.impl;


import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.phn.dao.AdminDao;
import com.phn.entity.Admin;

/**
 * @author phn
 * 
 */
@Transactional(rollbackFor = Exception.class)
//出现Exception异常回滚
@Repository("adminDao")
public class AdminDaoImpl implements AdminDao {
	//自动注入adminDao，也可以使用@Autowired  
    @Resource(name="sessionFactory") 
	private SessionFactory sessionFactory;

	@Override
	public void addAdmin(Admin admin) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(admin);
		} catch (HibernateException e) {
			System.out.println("通知：这里是用户登录验证的DAO实现层，AddAdmin方法抛出HibernateException异常！"+e.getMessage());
			e.printStackTrace();
		}
	}

	@Override
	public Admin validAdmin(Admin admin) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Admin a where a.adminname =? and a.adminpassword = ?";
		List<Admin> list = null;
		try {
			Query q = session.createQuery(hql);
			q.setString(0, admin.getAdminname());
			q.setString(1, admin.getAdminpassword());
			list = q.list();
		} catch (HibernateException e) {
			System.out.println("通知：这里是用户登录验证的DAO实现层，ValidAdmin方法抛出HibernateException异常！"+e.getMessage());
			e.printStackTrace();
		}
		Admin a = null;
		if(list.size()>0){
			a = list.get(0);
			return a;
		}
		return a;
	}

	public boolean deleteAdmin(Admin admin) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.delete((Admin)session.get(Admin.class, admin.getId()));
		} catch (HibernateException e) {
			System.out.println("通知：这里是用户登录验证的DAO实现层，DeleteAdmin方法抛出HibernateException异常！"+e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean updateAdmin(Admin admin) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Admin a = (Admin)session.get(Admin.class, admin.getId());
			a.setAdminpassword(admin.getAdminpassword());
			session.update(a);
		} catch (HibernateException e) {
			System.out.println("通知：这里是用户登录验证的DAO实现层，UpdateAdmin方法抛出HibernateException异常！"+e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}

}
