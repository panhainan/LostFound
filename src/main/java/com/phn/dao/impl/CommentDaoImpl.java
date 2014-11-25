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

import com.phn.dao.CommentDao;
import com.phn.entity.Comment;

/**
 * @author 潘海南
 * @date 2014-10-18
 */
@Transactional(rollbackFor = Exception.class)
@Repository("commentDao")
public class CommentDaoImpl implements CommentDao {
	@Resource
	private SessionFactory sessionFactory;

	@Override
	public boolean insert(Comment comment) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(comment);
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean update(Comment comment) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.update(comment);
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public Comment find(int index) {
		Session session = sessionFactory.getCurrentSession();
		String sql ="from Comment comment where id=?";
		List<Comment> listComment = null;
		try {
			Query q = session.createQuery(sql);
			q.setInteger(0, index);
			listComment=  q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
		if(listComment.size()>0){
			return listComment.get(0);
		}
		return null;
	}

	@Override
	public boolean delete(int index) {
		Session session = sessionFactory.getCurrentSession();
		String sql ="delete from Comment comment where id=?";
		try {
			Query q = session.createQuery(sql);
			q.setInteger(0, index);
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List<Comment> GetUserComments(int userId) {
		Session session = sessionFactory.getCurrentSession();
		String sql ="from Comment comment where comment.commentuser="+userId+" order by id desc";
		List<Comment> listComment = null;
		try {
			Query q = session.createQuery(sql);
			listComment=  q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return listComment;
	}

}
