/**
 * 
 */
package com.phn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phn.dao.CommentDao;
import com.phn.dao.GoodsDao;
import com.phn.dao.PageDao;
import com.phn.dao.UserDao;
import com.phn.entity.Comment;
import com.phn.entity.Goods;
import com.phn.entity.Pages;
import com.phn.entity.User;
import com.phn.service.UserService;

/**
 * @author 潘海南
 * @date 2014-9-16
 */
@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;
	@Resource
	private PageDao pageDao;
	@Resource
	private GoodsDao goodsDao;
	@Resource
	private CommentDao commentDao;

	@Override
	public void insert(User user) {
		this.userDao.insert(user);
	}

	@Override
	public User find(String username) {
		return this.userDao.find(username);
	}
	@Override
	public Pages GetAll(int pageSize, int nowPage) {
		final String sql = "from User us order by us.id desc";
		int allRecords = this.pageDao.getAllRowCount(sql);
		int totalPage = Pages.calculateTotalPage(pageSize, allRecords);// 总页数
		final int currentoffset = Pages.currentPage_startRecord(pageSize,
				nowPage);// 当前页的开始记录
		final int length = pageSize;
		final int currentPage = Pages.judgeCurrentPage(nowPage);
		List<User> listUser = this.pageDao.query_Objects_ForPages(sql,
				currentoffset, length);
		Pages pagebean = new Pages();
		pagebean.setPageSize(pageSize);
		pagebean.setAllRecords(allRecords);
		pagebean.setCurrentPage(currentPage);
		pagebean.setTotalPages(totalPage);
		pagebean.setListUser(listUser);
		pagebean.init();
		return pagebean;
	}

	@Override
	public List<Goods> GetAllGoods(int userId) {
		return this.goodsDao.GetUserGoods(userId);
	}
	@Override
	public List<Comment> GetAllComments(int userId) {
		return this.commentDao.GetUserComments(userId);
	}
}
