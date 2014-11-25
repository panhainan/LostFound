/**
 * 
 */
package com.phn.service;

import java.util.List;

import com.phn.entity.Comment;
import com.phn.entity.Goods;
import com.phn.entity.Pages;
import com.phn.entity.User;

/**
 * @author 潘海南
 * @date 2014-9-16
 */
public interface UserService {

	/**
	 * @param user
	 */
	public void insert(User user);

	/**
	 * @param username
	 * @return 
	 */
	public User find(String username);

	/**
	 * @param pageSize
	 * @param nowPage
	 * @return
	 */
	public Pages GetAll(int pageSize, int nowPage);

	/**
	 * @param userId 
	 * @return
	 */
	public List<Goods> GetAllGoods(int userId);

	/**
	 * @param userId
	 * @return
	 */
	public List<Comment> GetAllComments(int userId);

}
