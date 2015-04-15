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

import com.phn.dao.AnnouncementDao;
import com.phn.entity.Announcement;
import com.phn.entity.User;

/**
 * @author 王云鹏
 * @date 2014-10-25
 */
@Transactional(rollbackFor = Exception.class)
//出现Exception异常回滚
@Repository("announcementDao")
public class AnnouncementDaoImpl implements AnnouncementDao {
	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;
	
	@Override
	public boolean addAnnouncement(Announcement acnouncement) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(acnouncement);
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是通告的DAO实现层，insert方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public Announcement findAnnouncement(String annotitle) {
		Session session = sessionFactory.getCurrentSession();
		List<Announcement> listannouncement = null;
		Announcement  announcement = null;
		String sql = "from Announcement announcement where announcement.announcetitle= ?";
		try {
			Query q = session.createQuery(sql);
			q.setString(0, annotitle);
			listannouncement = q.list();
		} catch (HibernateException e) {
			System.out
			.println("通知：这里是通告的DAO实现层，findUser方法抛出HibernateException异常！"
					+ e.getMessage());
			e.printStackTrace();
		}
		if(listannouncement.size()>0){
			announcement = listannouncement.get(0);
			return announcement;
		}
		return announcement;
	}

	
	@Override
	public boolean delAnnouncement(String announcetitle) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "delete from Announcement announcement where announcement.announcetitle = ?";
		Query q = session.createQuery(sql);
		try {
			q.setString(0, announcetitle);
			q.executeUpdate();
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是通告的DAO实现层，delete方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}

	
	@Override
	public boolean updateAnnouncement(Announcement announcement){
		Session session = sessionFactory.getCurrentSession();
		try {
			
			Query query = session.createQuery("update Announcement a set a.announcetitle ='"
					+ announcement.getAnnouncetitle() + "',a.announceinfo='" + announcement.getAnnounceinfo()
					+ "' where a.id =" + announcement.getId());
			query.executeUpdate();
			
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是通告的DAO实现层，udpate方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}
	@Override
	public int getRowCount(){
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(*) from Announcement a";
		Number RowCount = (Number) session.createQuery(hql).uniqueResult();

		return RowCount.intValue();
	}

	public List<Announcement> Getlistanno(int PageNow,int PageSize){
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "From Announcement anno";
		Query query = session.createQuery(hql);
		List<Announcement> emps = query.setFirstResult((PageNow - 1) * PageSize)
				.setMaxResults(PageSize).list();
         System.out.println("2121212121"+emps);
		return emps;
		
	}

	
	@Override
	public Announcement findAnno(int index) {
		
		Session session = sessionFactory.getCurrentSession();
		List<Announcement> listannouncement = null;
		Announcement  announcement = null;
		String sql = "from Announcement announcement where announcement.id= ?";
		try {
			Query q = session.createQuery(sql);
			q.setInteger(0, index);
			listannouncement = q.list();
		} catch (HibernateException e) {
			System.out
			.println("通知：这里是通告的DAO实现层，findUser方法抛出HibernateException异常！"
					+ e.getMessage());
			e.printStackTrace();
		}
		if(listannouncement.size()>0){
			announcement = listannouncement.get(0);
			return announcement;
		}
		return announcement;
	}

	
	@Override
	public boolean delAnno(int index) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "delete from Announcement announcement where announcement.id = ?";
		Query q = session.createQuery(sql);
		try {
			q.setInteger(0, index);
			q.executeUpdate();
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是通告的DAO实现层，delete方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List<Announcement> GetIndex() {
		Session session = sessionFactory.getCurrentSession();
		List<Announcement> listannouncement = null;
		String sql = "from Announcement announcement order by announcement.id desc";
		try {
			Query q = session.createQuery(sql);
			q.setMaxResults(5);
			listannouncement = q.list();
		} catch (HibernateException e) {
			System.out
			.println("通知：这里是通告的DAO实现层，GetIndex方法抛出HibernateException异常！"
					+ e.getMessage());
			e.printStackTrace();
		}
		return listannouncement;
	}

	@Override
	public List<Announcement> GetAll() {
		Session session = sessionFactory.getCurrentSession();
		List<Announcement> listannouncement = null;
		String sql = "from Announcement announcement order by announcement.id desc";
		try {
			Query q = session.createQuery(sql);
			listannouncement = q.list();
		} catch (HibernateException e) {
			System.out
			.println("通知：这里是通告的DAO实现层，GetIndex方法抛出HibernateException异常！"
					+ e.getMessage());
			e.printStackTrace();
		}
		return listannouncement;
	}

}
