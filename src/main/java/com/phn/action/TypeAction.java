/**
 * 
 */
package com.phn.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.phn.entity.Pages;
import com.phn.entity.Type;
import com.phn.service.TypeService;

/**
 * @author 潘海南
 * @date 2014-10-13
 */
@Controller("typeAction")
@Scope("prototype")
public class TypeAction {
	@Resource
	private TypeService typeService;
	private Type type;
	private Pages pageBean;
	private List<Type> listType;
	private int nowPage = 1;
	private int index;

	public String NewInfo() throws Exception {
		if (this.typeService.insert(type) != true) {
			return "type_newInfo_failed";
		}
		return "type_newInfo_success";
	}

	public String GoUpdateInfo() throws Exception{
		this.type = this.typeService.find(index);
		if (this.type == null) {
			return "type_goUpdateInfo_failed";
		}
		return "type_goUpdateInfo_success";
	}
	public String UpdateInfo() throws Exception {
		if (this.typeService.update(this.type) != true) {
			return "type_updateInfo_failed";
		}
		return "type_updateInfo_success";
	}

	public String DeleteInfo() throws Exception {
		if(index==0){
			return "type_deleteInfo_failed";
		}
		if (this.typeService.delete(index) != true) {
			return "type_deleteInfo_failed";
		}
		return "type_deleteInfo_success";
	}

	public String FindInfo() throws Exception {
		this.type = this.typeService.find(index);
		if (this.type == null) {
			return "type_findInfo_failed";
		}
		return "type_findInfo_success";
	}

	public String GetAll() throws Exception {
		this.pageBean = this.typeService.getAll(10, nowPage);
		this.listType = this.pageBean.getListType();
		return "type_getAll_success";
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public Pages getPageBean() {
		return pageBean;
	}

	public void setPageBean(Pages pageBean) {
		this.pageBean = pageBean;
	}

	public List<Type> getListType() {
		return listType;
	}

	public void setListType(List<Type> listType) {
		this.listType = listType;
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
