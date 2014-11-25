/**
 * 
 */
package com.phn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phn.dao.HelpDao;
import com.phn.entity.Announcement;
import com.phn.entity.Help;
import com.phn.service.HelpService;

/**
 * @author 王云鹏
 * @date 2014-10-25
 */
@Service("helpService")
public class HelpServiceImpl implements HelpService {

	@Resource
	private HelpDao helpDao;
	
	@Override
	public boolean addHelp(Help help) {

		return this.helpDao.addHelp(help);
	}

	@Override
	public Help findHelp(String helptitle) {

		return this.helpDao.findHelp(helptitle);
	}

	@Override
	public Help findHelp1(int index) {
		
		return this.helpDao.findHelp1(index);
	}

	
	@Override
	public boolean delHelp(String helptitle) {

		return this.helpDao.delHelp(helptitle);
	}

	@Override
	public boolean delHelp1(int index) {
	
		return this.helpDao.delHelp1(index);
	}
	
	@Override
	public boolean updateHelp(Help help) {

		return this.helpDao.updateHelp(help);
	}


	@Override
	public List<Help> Getlisthelp(int PageNow, int PageSize) {

		return this.helpDao.Getlisthelp(PageNow, PageSize);
	}

	@Override
	public int getRowCount() {

		return this.helpDao.getRowCount();
	}

	@Override
	public List<Help> GetAll() {
		return this.helpDao.GetAll();
	}
	@Override
	public List<Help> GetIndex() {
		return this.helpDao.GetIndex();
	}

	
	
	
	

}
