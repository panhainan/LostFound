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

import com.phn.dao.HelpDao;
import com.phn.entity.Help;

/**
 * @author 王云鹏
 * @date 2014-10-25
 */
@Transactional(rollbackFor = Exception.class)
//出现Exception异常回滚
@Repository("helpDao")
public class HelpDaoImpl implements HelpDao {
	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;
	
	@Override
	public boolean addHelp(Help help) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(help);
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是帮助的DAO实现层，insert方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}

	
	
	@Override
	public Help findHelp(String helptitle) {
		Session session = sessionFactory.getCurrentSession();
		List<Help> listhelp = null;
		Help help = null;
		String sql = "from Help help where help.helptitle= ?";
		try {
			Query q = session.createQuery(sql);
			q.setString(0, helptitle);
			listhelp = q.list();
		} catch (HibernateException e) {
			System.out
			.println("通知：这里是帮助的DAO实现层，findUser方法抛出HibernateException异常！"
					+ e.getMessage());
			e.printStackTrace();
		}
		if(listhelp.size()>0){
			help = listhelp.get(0);
			return help;
		}
		return help;
	}

	
	@Override
	public Help findHelp1(int index) {
		Session session = sessionFactory.getCurrentSession();
		List<Help> listhelp = null;
		Help help = null;
		String sql = "from Help help where help.id= ?";
		try {
			Query q = session.createQuery(sql);
			q.setInteger(0, index);
			listhelp = q.list();
		} catch (HibernateException e) {
			System.out
			.println("通知：这里是帮助的DAO实现层，findUser方法抛出HibernateException异常！"
					+ e.getMessage());
			e.printStackTrace();
		}
		if(listhelp.size()>0){
			help = listhelp.get(0);
			return help;
		}
		return help;
	}
	
	@Override
	public boolean delHelp(String helptitle) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "delete from Help help where help.helptitle = ?";
		Query q = session.createQuery(sql);
		try {
			q.setString(0, helptitle);
			q.executeUpdate();
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是帮助的DAO实现层，delete方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean delHelp1(int index) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "delete from Help help where help.id = ?";
		Query q = session.createQuery(sql);
		try {
			q.setInteger(0, index);
			q.executeUpdate();
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是帮助的DAO实现层，delete方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	
	@Override
	public boolean updateHelp(Help help) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.update(help);
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是帮助的DAO实现层，udpate方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}

	
	
	@Override
	public int getRowCount() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(*) from Help h";
		Number RowCount = (Number) session.createQuery(hql).uniqueResult();

		return RowCount.intValue();
	}

	
	@Override
	public List<Help> Getlisthelp(int PageNow, int PageSize) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "From Help";
		Query query = session.createQuery(hql);
		List<Help> emps = query.setFirstResult((PageNow - 1) * PageSize)
				.setMaxResults(PageSize).list();
		return emps;
	}


	@Override
	public List<Help> GetAll() {
		Session session = sessionFactory.getCurrentSession();
		List<Help> listhelp = null;
		String sql = "from Help help order by help.id desc";
		try {
			Query q = session.createQuery(sql);
			listhelp = q.list();
		} catch (HibernateException e) {
			System.out
			.println("通知：这里是帮助的DAO实现层，GetAll方法抛出HibernateException异常！"
					+ e.getMessage());
			e.printStackTrace();
		}
		return listhelp;
	}


	@Override
	public List<Help> GetIndex() {
		Session session = sessionFactory.getCurrentSession();
		List<Help> listhelp = null;
		String sql = "from Help help order by help.id desc";
		try {
			Query q = session.createQuery(sql);
			listhelp = q.list();
		} catch (HibernateException e) {
			System.out
			.println("通知：这里是帮助的DAO实现层，GetIndex方法抛出HibernateException异常！"
					+ e.getMessage());
			e.printStackTrace();
		}
		return listhelp;
	}


	

}
