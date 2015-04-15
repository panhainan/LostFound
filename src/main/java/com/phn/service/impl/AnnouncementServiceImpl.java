/**
 * 
 */
package com.phn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phn.dao.AnnouncementDao;
import com.phn.entity.Announcement;
import com.phn.service.AnnouncementService;

/**
 * @author 王云鹏
 * @date 2014-10-25
 */
@Service("announcementService")
public class AnnouncementServiceImpl implements AnnouncementService {

	@Resource
	private AnnouncementDao announcementDao;
	
	@Override
	public boolean addAnnouncement(Announcement announcement) {
		return this.announcementDao.addAnnouncement(announcement);

	}

	
	@Override
	public Announcement findAnnouncement(String annotitle) {
		
		return this.announcementDao.findAnnouncement(annotitle);
	}

	@Override
	public Announcement findAnno(int index) {
		
		return this.announcementDao.findAnno(index);
	}

	
	@Override
	public boolean delAnnouncement(String announcetitle) {
		return this.announcementDao.delAnnouncement(announcetitle);

	}

	@Override
	public boolean delAnno(int index) {
		return this.announcementDao.delAnno(index);
	}
	
	@Override
	public boolean updateAnnouncement(Announcement announcement) {
		
		return this.announcementDao.updateAnnouncement(announcement);
	}
	
	@Override
	public int getRowCount(){
		
		return this.announcementDao.getRowCount();
	}
	
	@Override	
	public List<Announcement> Getlistanno(int PageNow,int PageSize){
		return this.announcementDao.Getlistanno(PageNow, PageSize);
	}


	@Override
	public List<Announcement> GetIndex() {
		return this.announcementDao.GetIndex();
	}


	@Override
	public List<Announcement> GetAll() {
		return this.announcementDao.GetAll();
	}


	

}
