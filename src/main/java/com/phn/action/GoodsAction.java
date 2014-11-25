/**
 * 
 */
package com.phn.action;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.phn.entity.Area;
import com.phn.entity.Comment;
import com.phn.entity.Goods;
import com.phn.entity.Pages;
import com.phn.entity.Type;
import com.phn.entity.User;
import com.phn.service.GoodsService;
import com.phn.util.FileUpload;

/**
 * @author 潘海南
 * @date 2014-9-18
 */
@Controller("goodsAction")
@Scope("prototype")
public class GoodsAction {
	@Resource
	private GoodsService goodsService;
	private Goods goods;
	private User user;
	private Pages pageBean;
	private List<Goods> listLostGoods;
	private List<Goods> listFoundGoods;
	private List<Goods> listLastGoods;
	private List<Type> listType;
	private List<Area> listArea;
	private List<Comment> listComment;
	private int nowPage = 1;
	private int index;
	private final int lostGoodsStatus = 1;
	private final int foundGoodsStatus = 2;
	private int goodsStatus;
	/* 以下6个变量用于图片上传 */
	private File fileUpload;
	private String fileUploadFileName;
	private String fileUploadContentType;
	private String savePath;
	DateFormat df = new SimpleDateFormat("yyyyMMdd-hhmmss-");
	HttpServletRequest request = ServletActionContext.getRequest();

	/**
	 * 后台管理按每页10条取得丢失物品信息数
	 */
	public String GetAllLost() throws Exception {
		this.pageBean = this.goodsService.GetAllLostForPage(10, nowPage);
		this.listLostGoods = this.pageBean.getListGoods();
		return "goods_getAllLost_success";
	}

	/**
	 * 后台管理按每页10条取得招领物品信息数
	 * 
	 * @return
	 * @throws Exception
	 */
	public String GetAllFound() throws Exception {
		this.pageBean = this.goodsService.GetAllFoundForPage(10, nowPage);
		this.listFoundGoods = this.pageBean.getListGoods();
		return "goods_getAllFound_success";
	}

	/**
	 * 后台管理删除物品信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String DeleteInfo() throws Exception {
		if (index == 0) {
			return "goods_deleteInfo_failed";
		}
		boolean flag = this.goodsService.delete(index);
		if (flag != true) {
			return "goods_deleteInfo_failed";
		}
		if (goodsStatus == lostGoodsStatus) {
			return "goods_deleteLostInfo_success";
		} else if(goodsStatus == foundGoodsStatus){
			return "goods_deleteFoundInfo_success";
		}else{
			return "goods_deleteInfo_failed";
		}
	}

	/**
	 * 首页取得10条丢失物品信息：------待修改
	 * 
	 * @return
	 * @throws Exception
	 */
	public String GetAllLostIndex() throws Exception {
		this.pageBean = this.goodsService.GetAllLostForPage(10, nowPage);
		this.listLostGoods = this.pageBean.getListGoods();
		return "goods_getAllLostIndex_success";
	}

	/**
	 * 首页取得10条拾捡物品信息：------待修改
	 * 
	 * @return
	 * @throws Exception
	 */
	public String GetAllFoundIndex() throws Exception {
		this.pageBean = this.goodsService.GetAllFoundForPage(10, nowPage);
		this.listFoundGoods = this.pageBean.getListGoods();
		return "goods_getAllFoundIndex_success";
	}

	/**
	 * 前台模块取得10条丢失物品信息：------待修改
	 * 
	 * @return
	 * @throws Exception
	 */
	public String GetAllLostFront() throws Exception {
		this.pageBean = this.goodsService.GetAllLostForPage(10, nowPage);
		this.listLostGoods = this.pageBean.getListGoods();
		return "goods_getAllLostFront_success";
	}

	/**
	 * 前台模块取得10条丢失物品信息：------待修改
	 * 
	 * @return
	 * @throws Exception
	 */
	public String GetAllFoundFront() throws Exception {
		this.pageBean = this.goodsService.GetAllFoundForPage(10, nowPage);
		this.listFoundGoods = this.pageBean.getListGoods();
		return "goods_getAllFoundFront_success";
	}

	/**
	 * 首页取得10条最新丢失招领物品信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String GetLastGoodsIndex() throws Exception {
		this.listLastGoods = this.goodsService.getLast();
		return "goods_getLastGoodsIndex_success";
	}

	public String GoNewInfo() throws Exception {
		this.listType = this.goodsService.getAllType();
		this.listArea = this.goodsService.getAllArea();
		return "goods_goNewInfo_success";
	}

	/**
	 * 发布丢失物品信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String NewLostInfo() throws Exception {
		/* 待完成方法内容 */
		if (this.goods.getGoodsname().equals("")) {
			return "goods_newLostInfo_failed";
		}
		if (this.goods.getGoodstype() == null) {
			return "goods_newLostInfo_failed";
		}
		if (this.goods.getGoodsarea() == null) {
			return "goods_newLostInfo_failed";
		}
		if (this.goods.getGoodstime().equals("")) {
			return "goods_newLostInfo_failed";
		}
		if (user.getUsernickname().equals("")) {
			return "goods_newLostInfo_failed";
		}
		if (user.getUserphone().equals("")) {
			return "goods_newLostInfo_failed";
		}
		/************************** 图片上传，中文名这里还存在问题，需要修改******************************** */
		if (fileUpload == null) {

		} else {
			FileUpload fileUp = new FileUpload();
			String goodsPicName = fileUp.PicUpload(fileUpload,
					fileUploadFileName, fileUploadContentType, savePath);
			System.out.println("图片上传的名称为：" + goodsPicName);
			goods.setGoodspictures(goodsPicName);
		}
		User us = (User) request.getSession().getAttribute("sessionUser");
		if (us.getUsernickname().equals(user.getUsernickname())
				&& us.getUserphone().equals(user.getUserphone())
				&& us.getUserqq().equals(user.getUserqq())) {
			System.out.println("信息：用户基本信息未变");
		} else {
			us.setUsernickname(user.getUsernickname());
			us.setUserphone(user.getUserphone());
			us.setUserqq(user.getUserqq());
			System.out.println("信息：用户基本信息改变");
			this.goodsService.newInfoUpdateUser(us);
		}
		/*
		 * 测试数据:开始 Type type = new Type(); Area area = new Area();
		 * type.setId(1); area.setId(1); goods.setGoodstype(type);
		 * goods.setGoodsarea(area); 测试数据:结束
		 */
		goods.setGoodsuser(us);
		this.goodsService.newInfo(goods);
		this.index = goods.getId();
		return "goods_newLost_success";
	}

	/**
	 * 发布找回物品信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String NewFoundInfo() throws Exception {
		/* 待完成方法内容 */
		if (this.goods.getGoodsname().equals("")) {
			return "goods_newLostInfo_failed";
		}
		if (this.goods.getGoodstype() == null) {
			return "goods_newLostInfo_failed";
		}
		if (this.goods.getGoodsarea() == null) {
			return "goods_newLostInfo_failed";
		}
		if (this.goods.getGoodstime().equals("")) {
			return "goods_newLostInfo_failed";
		}
		if (user.getUsernickname().equals("")) {
			return "goods_newLostInfo_failed";
		}
		if (user.getUserphone().equals("")) {
			return "goods_newLostInfo_failed";
		}
		/************************** 图片上传，中文名这里还存在问题，需要修改******************************** */
		if (fileUpload == null) {

		} else {
			FileUpload fileUp = new FileUpload();
			String goodsPicName = fileUp.PicUpload(fileUpload,
					fileUploadFileName, fileUploadContentType, savePath);
			System.out.println("图片上传的名称为：" + goodsPicName);
			goods.setGoodspictures(goodsPicName);
		}
		User us = (User) request.getSession().getAttribute("sessionUser");
		if (us.getUsernickname().equals(user.getUsernickname())
				&& us.getUserphone().equals(user.getUserphone())
				&& us.getUserqq().equals(user.getUserqq())) {
			System.out.println("信息：用户基本信息未变");
		} else {
			us.setUsernickname(user.getUsernickname());
			us.setUserphone(user.getUserphone());
			us.setUserqq(user.getUserqq());
			System.out.println("信息：用户基本信息改变");
			this.goodsService.newInfoUpdateUser(us);
		}
		/*
		 * 测试数据:开始 Type type = new Type(); Area area = new Area();
		 * type.setId(1); area.setId(1); goods.setGoodstype(type);
		 * goods.setGoodsarea(area); 测试数据:结束
		 */
		goods.setGoodsuser(us);
		this.goodsService.newInfo(goods);
		this.index = goods.getId();
		return "goods_newFound_success";
	}

	/**
	 * 前往刚刚发布的信息页面
	 * 
	 * @return
	 * @throws Exception
	 */
	public String GoTheNewInfo() throws Exception {
		this.goods = this.goodsService.find(this.index);
		if (goods != null & goods.getGoodsstatus() == 1) {
			return "goods_goTheNewLostInfo_success";
		} else if (goods != null & goods.getGoodsstatus() == 2) {
			return "goods_goTheNewFoundInfo_success";
		}
		return "goods_goTheNewInfo_failed";
	}

	/**
	 * 前往指定的信息页面
	 * 
	 * @return
	 * @throws Exception
	 */
	public String GoTheInfo() throws Exception {
		this.goods = this.goodsService.find(this.index);
		this.listComment = new ArrayList<Comment>();
		listComment.addAll(this.goods.getGoodscomments());
		if (listComment.size() > 1) {
			this.QuickSort(listComment, 0, listComment.size() - 1);
		}
		if (goods != null & goods.getGoodsstatus() == lostGoodsStatus) {
			return "goods_goTheLostInfo_success";
		} else if (goods != null & goods.getGoodsstatus() == foundGoodsStatus) {
			return "goods_goTheFoundInfo_success";
		}
		return "goods_goTheInfo_failed";
	}
	/**
	 * 使用快速排序给comment排序
	 * @param list
	 * @param first
	 * @param end
	 */
	public void QuickSort(List<Comment> list, int first, int end) {
		/* 初始化各变量 */
		int i = first;
		int j = end;
		Comment temp = list.get(i); // 用子表的第一个记录作为枢轴记录
		while (i < j) { // 从表的两端交替向中间扫描
			while (i < j && temp.getId() >= list.get(j).getId() )
				j--;
			list.set(i, list.get(j)); // 采用替换而不是交换的方式进行操作
			while (i < j && list.get(i).getId()  >= temp.getId() )
				i++;
			list.set(j, list.get(i)); // 采用替换而不是交换的方式进行操作
		}
		list.set(i, temp); // 将枢轴数值替换回L->R[i]
		if (first < i - 1)
			QuickSort(list, first, i - 1); // 对低子表进行递归
		if (i + 1 < end)
			QuickSort(list, i + 1, end); // 对高子表进行递归
	}
	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Pages getPageBean() {
		return pageBean;
	}

	public void setPageBean(Pages pageBean) {
		this.pageBean = pageBean;
	}

	public List<Goods> getListLostGoods() {
		return listLostGoods;
	}

	public void setListLostGoods(List<Goods> listLostGoods) {
		this.listLostGoods = listLostGoods;
	}

	public List<Goods> getListFoundGoods() {
		return listFoundGoods;
	}

	public void setListFoundGoods(List<Goods> listFoundGoods) {
		this.listFoundGoods = listFoundGoods;
	}

	public List<Goods> getListLastGoods() {
		return listLastGoods;
	}

	public void setListLastGoods(List<Goods> listLastGoods) {
		this.listLastGoods = listLastGoods;
	}

	public List<Type> getListType() {
		return listType;
	}

	public void setListType(List<Type> listType) {
		this.listType = listType;
	}

	public List<Area> getListArea() {
		return listArea;
	}

	public void setListArea(List<Area> listArea) {
		this.listArea = listArea;
	}

	public List<Comment> getListComment() {
		return listComment;
	}

	public void setListComment(List<Comment> listComment) {
		this.listComment = listComment;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getGoodsStatus() {
		return goodsStatus;
	}

	public void setGoodsStatus(int goodsStatus) {
		this.goodsStatus = goodsStatus;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}

	public String getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

}
