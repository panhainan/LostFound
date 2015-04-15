/**
 * 
 */
package com.phn.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phn.dao.CommentDao;
import com.phn.entity.Comment;
import com.phn.service.CommentService;

/**
 * @author 潘海南
 * @date 2014-10-18
 */
@Service("commentService")
public class CommentServiceImpl implements CommentService {
	@Resource
	private CommentDao commentDao;
	@Override
	public boolean insert(Comment comment) {
		return this.commentDao.insert(comment);
	}

	@Override
	public boolean update(Comment comment) {
		return this.commentDao.update(comment);
	}
	@Override
	public Comment find(int index) {
		return this.commentDao.find(index);
	}

	@Override
	public boolean delete(int index) {
		return this.commentDao.delete(index);
	}
	
}
