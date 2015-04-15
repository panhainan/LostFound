/**
 * 
 */
package com.phn.action;

import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

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
import org.junit.Test;

/**
 * @author 潘海南
 * @date 2014-9-16
 */
public class TestLogin {
	@Test
	public void Login() {

		HttpClient client = new DefaultHttpClient();
		HttpPost post = new HttpPost(
				"http://pt.csust.edu.cn/eol/homepage/common/login.jsp");
		// http://210.43.188.27/eol/homepage/common/login.jsp
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		String username = "201250080423";
		String password = "940616";
		nvps.add(new BasicNameValuePair("IPT_LOGINUSERNAME", username));
		nvps.add(new BasicNameValuePair("IPT_LOGINPASSWORD", password));
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
			String statusCode = response.getStatusLine().toString();
			if (!statusCode.equals("HTTP/1.1 200 OK")) {
				System.out.println(response.getStatusLine());
				Connection conn = getConnection();
				PreparedStatement prst = null;
				String sql = "insert into t_user(username,userpassword) values(?,?)";
				try {
					prst = conn.prepareStatement(sql);
					prst.setString(1, username);
					prst.setString(2, password);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				closeConnection(null, prst, conn);

			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		Connection conn = null;
		try {
			// 初始化驱动包
			Class.forName("com.mysql.jdbc.Driver").newInstance(); // 根据数据库连接字符，名称，密码给conn赋值
			conn = DriverManager
					.getConnection(
							"jdbc:mysql://localhost:3306/lostfound?useUnicode=true&characterEncoding=UTF-8",
							"root", "123456");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void closeConnection(ResultSet rs, PreparedStatement prst,
			Connection conn) {
		try { // 捕捉异常
			try {
				if (rs != null) { // 当ResultSet对象的实例rs不为空时
					rs.close(); // 关闭ResultSet对象
				}
			} finally {
				try {
					if (prst != null) { // 当Statement对象的实例stmt不为空时
						prst.close(); // 关闭Statement对象
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (conn != null) { // 当Connection对象的实例conn不为空时
						conn.close(); // 关闭Connection对象
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace(); // 输出异常信息
		}
	}
}
