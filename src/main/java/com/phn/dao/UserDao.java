/**
 * 
 */
package com.phn.dao;

import com.phn.entity.User;

/**
 * @author 潘海南
 * @date 2014-9-16
 */
public interface UserDao {

	/**
	 * @param user
	 */
	public void insert(User user);

	/**
	 * @param username
	 */
	public User find(String username);

	/**
	 * @param us
	 */
	public void update(User us);
	
}
