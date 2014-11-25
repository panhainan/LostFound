package com.phn.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phn.dao.AdminDao;
import com.phn.entity.Admin;
import com.phn.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	// 自动注入userDao，也可以使用@Autowired
	@Resource
	private AdminDao adminDao;

	@Override
	public boolean addAdmin(Admin admin) {
		this.adminDao.addAdmin(admin);
		return true;
	}

	@Override
	public Admin validAdmin(Admin admin) {
		return this.adminDao.validAdmin(admin);
	}

	@Override
	public boolean deleteAdmin(Admin admin) {
		return this.adminDao.deleteAdmin(admin);
	}

	@Override
	public boolean updateAdmin(Admin admin) {
		return this.adminDao.updateAdmin(admin);
	}
}
