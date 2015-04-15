/**
 * 
 */
package com.phn.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.phn.dao.PageDao;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
@Repository("pageDao")
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class PageDaoImpl implements PageDao {
	@Resource
	private SessionFactory sessionFactory;

	@Override
	public int getAllRowCount(String hql) {
		Session session = this.sessionFactory.getCurrentSession();
		Query q = session.createQuery(hql);
		return q.list().size();
	}

	@Override
	public List query_Objects_ForPages(String hql, int offset, int length) {
		Session session = this.sessionFactory.getCurrentSession();
		Query q = session.createQuery(hql);
		q.setFirstResult(offset);
		q.setMaxResults(length);
		List list = q.list();
		return list;
	}

}
