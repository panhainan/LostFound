/**
 * 
 */
package com.phn.action;

import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentProducer;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.phn.entity.Comment;
import com.phn.entity.Goods;
import com.phn.entity.Pages;
import com.phn.entity.User;
import com.phn.service.UserService;

/**
 * @author 潘海南
 * @date 2014-9-16
 */
@Controller("userAction")
@Scope("prototype")
public class UserAction {
	private User user;
	@Resource
	private UserService userService;
	private Pages pageBean;
	private int nowPage = 1;
	private List<User> listUser;
	private List<Goods> listGoods;
	HttpSession session = ServletActionContext.getRequest().getSession();
	private List<Comment> listComments;

	public String Login() {
		User us = null;
		HttpClient client = new DefaultHttpClient();
		// 外网：http://pt.csust.edu.cn/eol/homepage/common/login.jsp
		// 内网：http://210.43.188.27/eol/homepage/common/login.jsp
		HttpPost post = new HttpPost(
				"http://210.43.188.27/eol/homepage/common/login.jsp");
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		// 提交两个参数及值
		nvps.add(new BasicNameValuePair("IPT_LOGINUSERNAME", user.getUsername()));
		nvps.add(new BasicNameValuePair("IPT_LOGINPASSWORD", user
				.getUserpassword()));
		try {
			ContentProducer cp = new ContentProducer() {
				public void writeTo(OutputStream outstream) throws IOException {
					Writer writer = new OutputStreamWriter(outstream, "UTF-8");
					writer.write("");
					writer.flush();
				}
			};
			post.setEntity(new UrlEncodedFormEntity(nvps, HTTP.UTF_8));
			HttpResponse response = client.execute(post);
			// 打印状态码
			// System.out.println(response.getStatusLine());
			String statusCode = response.getStatusLine().toString();
			if (statusCode.equals("HTTP/1.1 302 Moved Temporarily")) {
				us = this.userService.find(user.getUsername());
				if (us == null) {
					user.setUsernickname(user.getUsername());
					this.userService.insert(user);
					us = this.userService.find(user.getUsername());
				}
				session.setAttribute("sessionUser", us);
				session.setMaxInactiveInterval(15 * 60);
				System.out.println("通知：用户登录成功");
				return "user_login_success";
			}
		} catch (ClientProtocolException e) {
			System.out.println("通知：用户登录异常" + e.getMessage());
		} catch (IOException e) {
			System.out.println("通知：用户登录异常" + e.getMessage());
		}
		return "user_login_failed";
	}
	
	public String Logout() throws Exception{
		session.removeAttribute("sessionUser");
		System.out.println("通知：用户注销成功！");
		return "user_logout_success";
	}
	
	public String GetAll() throws Exception {
		/*这里使用2条的目的用于测试，项目结束后请更改*/
		this.pageBean = this.userService.GetAll(2, nowPage);
		this.listUser = this.pageBean.getListUser();
		for (int i = 0; i < listUser.size(); i++) {
			System.out.println(listUser.get(i).getUsername());
		}
		return "user_getAll_success";
	}

	public String GoHome() throws Exception{
		this.user= (User) session.getAttribute("sessionUser");
		return "user_goHome_success";
	}
	
	public String GetAllGoods() throws Exception{
		User us = (User) session.getAttribute("sessionUser");
		this.listGoods=this.userService.GetAllGoods(us.getId());
		return "user_getAllGoods_success";
	}
	
	public String GetAllComments() throws Exception{
		User us = (User) session.getAttribute("sessionUser");
		this.listComments=this.userService.GetAllComments(us.getId());
		return "user_getAllComments_success";
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Pages getPageBean() {
		return pageBean;
	}

	public void setPageBean(Pages pageBean) {
		this.pageBean = pageBean;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public List<User> getListUser() {
		return listUser;
	}

	public void setListUser(List<User> listUser) {
		this.listUser = listUser;
	}

	public List<Goods> getListGoods() {
		return listGoods;
	}

	public void setListGoods(List<Goods> listGoods) {
		this.listGoods = listGoods;
	}

	public List<Comment> getListComments() {
		return listComments;
	}

	public void setListComments(List<Comment> listComments) {
		this.listComments = listComments;
	}

}
