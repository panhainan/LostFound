package com.phn.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.phn.entity.Admin;
import com.phn.service.AdminService;

@Controller("adminAction")
@Scope("prototype")
public class AdminAction {
	private Admin admin;
	@Resource
	private AdminService adminService;

	/**
	 * 添加管理员
	 * @return
	 * @throws Exception
	 */
	public String Add() throws Exception{
		boolean flag = this.adminService.addAdmin(admin);
		if(flag==false){
			return "admin_add_failed";
		}
		return "admin_add_success";
	}
	/**
	 * 管理员登录验证
	 * @return
	 * @throws Exception
	 */
	public String Log() throws Exception {
		this.admin = this.adminService.validAdmin(admin);
		if(this.admin==null){
			return "admin_log_failed";
		}
		return "admin_log_success";
	}
	/**
	 * 删除管理员
	 * @return
	 * @throws Exception
	 */
	public String Del() throws Exception {
		boolean flag = this.adminService.deleteAdmin(admin);
		if(flag==false){
			return "amdin_del_failed";
		}
		return "admin_del_success";
	}
	
	/**
	 * 管理员修改密码
	 * @return
	 * @throws Exception
	 */
	public String Upd() throws Exception{
		boolean flag = this.adminService.updateAdmin(admin);
		if(flag==false){
			return "admin_upd_fail";
		}
		return "admin_upd_success";
	}
	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}



}
