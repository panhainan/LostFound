package com.phn.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.phn.entity.Help;
import com.phn.service.HelpService;
/**
 * @author 王云鹏
 * @date 2014-10-25
 */
@Controller("helpAction")
@Scope("prototype")
public class HelpAction {	
	@Resource
	private HelpService helpService;
	private Help help;
	private List<Help> listhelp;
	private int index;
	private int RowCount;
	
	HttpServletRequest request = ServletActionContext.getRequest();

	public String Addhelp() throws Exception{
		if (this.helpService.addHelp(help) != true) {
			return "help_newInfo_failed";
		}
		return "help_newInfo_success";
	}
	
	public String GoUpdateInfo() throws Exception{
		this.help = this.helpService.findHelp1(index);
		if (this.help == null) {
			return "help_goUpdateInfo_failed";
		}
		return "help_goUpdateInfo_success";
	}
	
	public String DeleteInfo() throws Exception {
		if (this.helpService.delHelp1(index) != true) {
			return "help_deleteInfo_failed";
		}
		return "help_deleteInfo_success";
	}
	
	public String UpdateInfo() throws Exception{
		if (this.helpService.updateHelp(help) != true) {
			return "help_updateInfo_failed";
		}
		return "help_updateInfo_success";
	}
	
	
	public String GetRowCount() throws Exception{
		this.RowCount=this.helpService.getRowCount();
		request.setAttribute("RowCount", RowCount);
		return "help_RowCount_success";
	}
	
	public String Getlisthelp() throws Exception{
		int PageNow=1;
		String pageNow = request.getParameter("PageNow");
		if(pageNow!=null) 
			PageNow=Integer.parseInt(pageNow);
		int PageSize=10;
		this.listhelp=this.helpService.Getlisthelp(PageNow, PageSize);
		return "help_RowCount_success";
	}
	/*首页获取5条记录*/
	public String GetIndexHelp() throws Exception{
		this.listhelp = this.helpService.GetIndex();
		return "help_getIndex_success";
	}
	/*首页点击进入具体的页面*/
	public String GoTheInfo() throws Exception{
		this.help = this.helpService.findHelp1(index);
		return "help_goTheInfo_success";
	}
	/*网站公告具体页面左侧导航栏*/
	public String GetAll() throws Exception{
		this.listhelp = this.helpService.GetAll();
		return "help_getAll_success";
	}
	
	public String Getlist() throws Exception{
		int PageNow=1;
		String pageNow = request.getParameter("PageNow");
		if(pageNow!=null) 
			PageNow=Integer.parseInt(pageNow);
		int PageSize=10;
		this.listhelp=this.helpService.Getlisthelp(PageNow, PageSize);
		this.help = this.listhelp.get(0);
		return "help_List_success";
	}
	
	public String FindHelp() throws Exception{
		String helpTitle=request.getParameter("helpTitle");
		this.help = this.helpService.findHelp(helpTitle);
	 return "help_findAnno_success";	
	} 
	

	public HelpService getHelpService() {
		return helpService;
	}

	public void setHelpService(HelpService helpService) {
		this.helpService = helpService;
	}

	public Help getHelp() {
		return help;
	}

	public void setHelp(Help help) {
		this.help = help;
	}

	public List<Help> getListhelp() {
		return listhelp;
	}

	public void setListhelp(List<Help> listhelp) {
		this.listhelp = listhelp;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getRowCount() {
		return RowCount;
	}

	public void setRowCount(int rowCount) {
		RowCount = rowCount;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}


}
