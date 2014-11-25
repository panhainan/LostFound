/**
 * 
 */
package com.phn.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.phn.entity.Area;
import com.phn.entity.Pages;
import com.phn.service.AreaService;

/**
 * @author 潘海南
 * @date 2014-10-13
 */
@Controller("areaAction")
@Scope("prototype")
public class AreaAction {
	@Resource
	private AreaService areaService;
	private Area area;
	private Pages pageBean;
	private List<Area> listArea;
	private int nowPage = 1;
	private int index;

	public String NewInfo() throws Exception {
		if (this.areaService.insert(area) != true) {
			return "area_newInfo_failed";
		}
		return "area_newInfo_success";
	}

	public String GoUpdateInfo() throws Exception{
		this.area = this.areaService.find(index);
		if (this.area == null) {
			return "area_goUpdateInfo_failed";
		}
		return "area_goUpdateInfo_success";
	}
	public String UpdateInfo() throws Exception {
		if (this.areaService.update(area) != true) {
			return "area_updateInfo_failed";
		}
		return "area_updateInfo_success";
	}

	public String DeleteInfo() throws Exception {
		if(index==0){
			return "area_deleteInfo_failed";
		}
		if (this.areaService.delete(index) != true) {
			return "area_deleteInfo_failed";
		}
		return "area_deleteInfo_success";
	}

	public String FindInfo() throws Exception {
		Area area = this.areaService.find(index);
		if (area == null) {
			return "area_findInfo_failed";
		}
		return "area_findInfo_success";
	}

	public String GetAll() throws Exception {
		this.pageBean = this.areaService.getAll(10, nowPage);
		this.listArea = this.pageBean.getListArea();
		return "area_getAll_success";
	}

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public Pages getPageBean() {
		return pageBean;
	}

	public void setPageBean(Pages pageBean) {
		this.pageBean = pageBean;
	}

	public List<Area> getListArea() {
		return listArea;
	}

	public void setListArea(List<Area> listArea) {
		this.listArea = listArea;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

}
