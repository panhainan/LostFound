/**
 * 
 */
package com.phn.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.phn.dao.TypeDao;
import com.phn.entity.Type;

/**
 * @author 潘海南
 * @date 2014-10-13
 */
@Transactional(rollbackFor = Exception.class)
@Repository("typeDao")
public class TypeDaoImpl implements TypeDao{
	@Resource
	private SessionFactory sessionFactory;

	@Override
	public boolean insert(Type type) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(type);
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是物品区域Type的DAO实现层，insert方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean update(Type type) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.update(type);
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是物品区域Type的DAO实现层，udpate方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean delete(int index) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "delete from Type type where type.id = ?";
		Query q = session.createQuery(sql);
		try {
			q.setInteger(0, index);
			q.executeUpdate();
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是物品区域Type的DAO实现层，delete方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public Type find(int index) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "from Type type where type.id = ?";
		List<Type> listType = null;
		try {
			Query q = session.createQuery(sql);
			q.setInteger(0, index);
			listType = q.list();
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是物品区域Type的DAO实现层，find方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
		}
		if (listType.size() > 0) {
			return listType.get(0);
		}
		return null;
	}

	@Override
	public List<Type> getAll() {
		Session session = sessionFactory.getCurrentSession();
		String sql = "from Type type order by type.id desc";
		List<Type> listType = null;
		try {
			Query q = session.createQuery(sql);
			listType = q.list();
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是物品区域Type的DAO实现层，getAll方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
		}
		return listType;
	}

}
