package com.phn.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.phn.entity.Announcement;
import com.phn.service.AnnouncementService;
/**
 * @author 王云鹏
 * @date 2014-10-25
 */
@Controller("annoAction")
@Scope("prototype")
public class AnnoAction {	
	@Resource
	private AnnouncementService announcementService;
	private Announcement announcement;
	private List<Announcement> listanno;
	private int index;
	private int RowCount;
	
	HttpServletRequest request = ServletActionContext.getRequest();

	
	
	public String Addanno() throws Exception{
		if (this.announcementService.addAnnouncement(announcement) != true) {
			return "anno_newInfo_failed";
		}
		return "anno_newInfo_success";
	}
	
	public String GoUpdateInfo() throws Exception{
		this.announcement = this.announcementService.findAnno(index);
		if (this.announcement == null) {
			return "anno_goUpdateInfo_failed";
		}
		return "anno_goUpdateInfo_success";
	}
	
	public String DeleteInfo() throws Exception {
		if (this.announcementService.delAnno(index) != true) {
			return "anno_deleteInfo_failed";
		}
		return "anno_deleteInfo_success";
	}
	
	public String UpdateInfo() throws Exception{
		if (this.announcementService.updateAnnouncement(announcement) != true) {
			return "anno_updateInfo_failed";
		}
		return "anno_updateInfo_success";
	}
	
	
	public String GetRowCount() throws Exception{
		this.RowCount=this.announcementService.getRowCount();
		request.setAttribute("RowCount", RowCount);
		return "anno_RowCount_success";
	}
	
	public String Getlistanno() throws Exception{
		int PageNow=1;
		String pageNow = request.getParameter("PageNow");
		if(pageNow!=null) 
			PageNow=Integer.parseInt(pageNow);
		int PageSize=10;
		this.listanno=this.announcementService.Getlistanno(PageNow, PageSize);
		return "anno_RowCount_success";
	}
	/*首页获取5条记录*/
	public String GetIndexAnno() throws Exception{
		this.listanno = this.announcementService.GetIndex();
		return "anno_getIndex_success";
	}
	/*首页点击进入具体的页面*/
	public String GoTheInfo() throws Exception{
		this.announcement = this.announcementService.findAnno(index);
		return "anno_goTheInfo_success";
	}
	/*网站公告具体页面左侧导航栏*/
	public String GetAll() throws Exception{
		this.listanno = this.announcementService.GetAll();
		return "anno_getAll_success";
	}
	
	public String Getlist() throws Exception{
		int PageNow=1;
		String pageNow = request.getParameter("PageNow");
		if(pageNow!=null) 
			PageNow=Integer.parseInt(pageNow);
		int PageSize=10;
		this.listanno=this.announcementService.Getlistanno(PageNow, PageSize);
		this.announcement = this.listanno.get(0);
		return "anno_List_success";
	}
	
	public String FindAnno() throws Exception{
		String annotitle=request.getParameter("annotitle");
		this.announcement = this.announcementService.findAnnouncement(annotitle);
	 return "anno_findAnno_success";	
	} 
	

	public int getIndex() {
		return index;
	}


	public void setIndex(int index) {
		this.index = index;
	}


	public List<Announcement> getListanno() {
		return listanno;
	}

	
	public void setListanno(List<Announcement> listanno) {
		this.listanno = listanno;
	}
	
	public Announcement getAnnouncement() {
		return announcement;
	}
	
	public void setAnnouncement(Announcement announcement) {
		this.announcement = announcement;
	}
	
	public AnnouncementService getAnnouncementService() {
		return announcementService;
	}

	public void setAnnouncementService(AnnouncementService announcementService) {
		this.announcementService = announcementService;
	}


}
