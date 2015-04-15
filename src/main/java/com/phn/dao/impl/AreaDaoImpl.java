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

import com.phn.dao.AreaDao;
import com.phn.entity.Area;

/**
 * @author 潘海南
 * @date 2014-10-13
 */
@Transactional(rollbackFor = Exception.class)
@Repository("areaDao")
public class AreaDaoImpl implements AreaDao {
	@Resource
	private SessionFactory sessionFactory;

	@Override
	public boolean insert(Area area) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(area);
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是物品区域Area的DAO实现层，insert方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean update(Area area) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.update(area);
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是物品区域Area的DAO实现层，udpate方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean delete(int index) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "delete from Area area where area.id = ?";
		Query q = session.createQuery(sql);
		try {
			q.setInteger(0, index);
			q.executeUpdate();
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是物品区域Area的DAO实现层，delete方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public Area find(int index) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "from Area area where area.id = ?";
		List<Area> listArea = null;
		try {
			Query q = session.createQuery(sql);
			q.setInteger(0, index);
			listArea = q.list();
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是物品区域Area的DAO实现层，find方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
		}
		if (listArea.size() > 0) {
			return listArea.get(0);
		}
		return null;
	}

	@Override
	public List<Area> getAll() {
		Session session = sessionFactory.getCurrentSession();
		String sql = "from Area area order by area.id desc";
		List<Area> listArea = null;
		try {
			Query q = session.createQuery(sql);
			listArea = q.list();
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是物品区域Area的DAO实现层，getAll方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
		}
		return listArea;
	}

}
