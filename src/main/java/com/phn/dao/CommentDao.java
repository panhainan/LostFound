/**
 * 
 */
package com.phn.dao;

import java.util.List;

import com.phn.entity.Comment;

/**
 * @author 潘海南
 * @date 2014-10-18
 */
public interface CommentDao {
	public boolean insert(Comment comment);
	public boolean update(Comment comment);
	public Comment find(int index);
	public boolean delete(int index);
	/**
	 * @param userId
	 * @return
	 */
	public List<Comment> GetUserComments(int userId);
}
