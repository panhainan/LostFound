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

import com.phn.dao.UserDao;
import com.phn.entity.User;

/**
 * @author 潘海南
 * @date 2014-9-16
 */
@Transactional(rollbackFor = Exception.class)
// 出现Exception异常回滚
@Repository("userDao")
public class UserDaoImpl implements UserDao {
	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;

	@Override
	public void insert(User user) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(user);
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是用户登录验证的DAO实现层，insertUser方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
		}
	}

	@Override
	public User find(String username) {
		Session session = sessionFactory.getCurrentSession();
		List<User> listUser = null;
		User  user = null;
		String sql = "from User us where us.username = ?";
		try {
			Query q = session.createQuery(sql);
			q.setString(0, username);
			listUser = q.list();
		} catch (HibernateException e) {
			System.out
			.println("通知：这里是用户登录验证的DAO实现层，findUser方法抛出HibernateException异常！"
					+ e.getMessage());
			e.printStackTrace();
		}
		if(listUser.size()>0){
			user = listUser.get(0);
			return user;
		}
		return user;
	}

	@Override
	public void update(User us) {
		Session session = sessionFactory.getCurrentSession();
		try{
			session.update(us);
		}
		catch (HibernateException e) {
			System.out
			.println("通知：这里是用户登录验证的DAO实现层，updateUser方法抛出HibernateException异常！"
					+ e.getMessage());
			e.printStackTrace();
		}
	}

}
