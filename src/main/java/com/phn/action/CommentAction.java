/**
 * 
 */
package com.phn.action;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.phn.entity.Comment;
import com.phn.entity.Goods;
import com.phn.entity.User;
import com.phn.service.CommentService;

/**
 * @author 潘海南
 * @date 2014-10-18
 */
@Controller("commentAction")
@Scope("prototype")
public class CommentAction {
	@Resource
	private CommentService commentService;
	private Goods goods;
	private Comment comment;
	private int index = 0;
	HttpServletRequest request = ServletActionContext.getRequest();

	public String NewInfo() throws Exception {
		index = this.goods.getId();
		if (index == 0) {
			return "comment_newInfo_failed";
		}
		Date commenttime = new Date();
		this.comment.setCommenttime(commenttime);
		User us = (User) request.getSession().getAttribute("sessionUser");
		System.out.println(us.getUsername());
		this.comment.setCommentuser(us);
		this.comment.setCommentgoods(this.goods);
		boolean flag = this.commentService.insert(comment);
		if (flag == false) {
			return "comment_newInfo_failed";
		}
		return "comment_newInfo_success";
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

}
