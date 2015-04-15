package com.phn.service;

import com.phn.entity.Admin;

public interface AdminService {
	/**
	 * 添加并保存管理员
	 * @param admin
	 */
	public boolean addAdmin(Admin admin);
	
	/**
	 * 管理员登录验证
	 * @param admin
	 * @return
	 */
	public Admin validAdmin(Admin admin);
	
	/**
	 * 删除管理员
	 * @param admin
	 * @return
	 */
	public boolean deleteAdmin(Admin admin);

	/**
	 * 管理员修改密码
	 * @param admin
	 * @return
	 */
	public boolean updateAdmin(Admin admin);
}
