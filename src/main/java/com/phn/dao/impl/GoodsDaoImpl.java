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

import com.phn.dao.GoodsDao;
import com.phn.entity.Goods;

/**
 * @author 潘海南
 * @date 2014-10-13
 */
@Transactional(rollbackFor = Exception.class)
// 出现Exception异常回滚
@Repository("goodsDao")
public class GoodsDaoImpl implements GoodsDao {
	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;

	@Override
	public void insert(Goods goods) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(goods);
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是Goods的DAO实现层，insertGoods方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
		}
	}

	@Override
	public Goods find(int index) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "from Goods goods where goods.id=?";
		List<Goods> listGoods = null;
		try {
			Query q = session.createQuery(sql);
			q.setInteger(0, index);
			listGoods = q.list();
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是Goods的DAO实现层，findGoods方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
		}
		if (listGoods.size() > 0) {
			return listGoods.get(0);
		}
		return null;
	}

	@Override
	public List<Goods> getLast() {
		Session session = sessionFactory.getCurrentSession();
		String sql = "from Goods goods order by id desc";
		List<Goods> listGoods = null;
		try {
			Query q = session.createQuery(sql);
			q.setMaxResults(6); // 首页取得10条最新丢失招领物品信息
			listGoods = q.list();
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是Goods的DAO实现层，getLastGoods方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
		}
		return listGoods;
	}

	@Override
	public boolean delete(int index) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "from Goods goods where goods.id=?";
		List<Goods> listGoods = null;
		try {
			Query q = session.createQuery(sql);
			q.setInteger(0, index);
			listGoods = q.list();
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是Goods的DAO实现层，delete方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
			return false;
		}
		if (listGoods.size() > 0) {
			session.delete(listGoods.get(0));
			return true;
		}
		return false;
	}

	@Override
	public List<Goods> getSearchTxt(String searchTxt) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "from Goods goods where goods.goodsname like '%"
				+ searchTxt + "%' or goods.goodsdescribe like '%" + searchTxt
				+ "%' order by id desc";
		List<Goods> listGoods = null;
		try {
			Query q = session.createQuery(sql);
			listGoods = q.list();
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是Goods的DAO实现层，getSearchTxt方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
		}
		return listGoods;
	}

	@Override
	public List<Goods> GetUserGoods(int userId) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "from Goods goods where goods.goodsuser="
				+ userId + "  order by id desc";
		List<Goods> listGoods = null;
		try {
			Query q = session.createQuery(sql);
			listGoods = q.list();
		} catch (HibernateException e) {
			System.out
					.println("通知：这里是Goods的DAO实现层，GetUserGoods方法抛出HibernateException异常！"
							+ e.getMessage());
			e.printStackTrace();
		}
		return listGoods;
	}

}
