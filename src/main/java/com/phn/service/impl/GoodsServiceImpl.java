/**
 * 
 */
package com.phn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phn.dao.AreaDao;
import com.phn.dao.GoodsDao;
import com.phn.dao.PageDao;
import com.phn.dao.TypeDao;
import com.phn.dao.UserDao;
import com.phn.entity.Area;
import com.phn.entity.Goods;
import com.phn.entity.Pages;
import com.phn.entity.Type;
import com.phn.entity.User;
import com.phn.service.GoodsService;

/**
 * @author 潘海南
 * @date 2014-9-18
 */
@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {

	@Resource
	private PageDao pageDao;
	@Resource
	private GoodsDao goodsDao;
	@Resource
	private UserDao userDao;
	@Resource
	private TypeDao typeDao;
	@Resource
	private AreaDao areaDao;
	
	@Override
	public Pages GetAllLostForPage(int pageSize, int nowPage) {
		final String sql = "from Goods goods where goods.goodsstatus = 1 order by goods.id desc";
		int allRecords = this.pageDao.getAllRowCount(sql);
		int totalPage = Pages.calculateTotalPage(pageSize, allRecords);// 总页数
		final int currentoffset = Pages.currentPage_startRecord(pageSize,
				nowPage);// 当前页的开始记录
		final int length = pageSize;
		final int currentPage = Pages.judgeCurrentPage(nowPage);
		List<Goods> listGoods = this.pageDao.query_Objects_ForPages(sql,
				currentoffset, length);
		Pages pagebean = new Pages();
		pagebean.setPageSize(pageSize);
		pagebean.setAllRecords(allRecords);
		pagebean.setCurrentPage(currentPage);
		pagebean.setTotalPages(totalPage);
		pagebean.setListGoods(listGoods);
		pagebean.init();
		return pagebean;
	}
	@Override
	public Pages GetAllFoundForPage(int pageSize, int nowPage) {
		final String sql = "from Goods goods where goods.goodsstatus = 2 order by goods.id desc";
		int allRecords = this.pageDao.getAllRowCount(sql);
		int totalPage = Pages.calculateTotalPage(pageSize, allRecords);// 总页数
		final int currentoffset = Pages.currentPage_startRecord(pageSize,
				nowPage);// 当前页的开始记录
		final int length = pageSize;
		final int currentPage = Pages.judgeCurrentPage(nowPage);
		List<Goods> listGoods = this.pageDao.query_Objects_ForPages(sql,
				currentoffset, length);
		Pages pagebean = new Pages();
		pagebean.setPageSize(pageSize);
		pagebean.setAllRecords(allRecords);
		pagebean.setCurrentPage(currentPage);
		pagebean.setTotalPages(totalPage);
		pagebean.setListGoods(listGoods);
		pagebean.init();
		return pagebean;
	}

	@Override
	public void newInfoUpdateUser(User us) {
		this.userDao.update(us);
	}

	@Override
	public void newInfo(Goods goods) {
		this.goodsDao.insert(goods);
	}
	@Override
	public Goods find(int index) {
		return this.goodsDao.find(index);
	}
	@Override
	public List<Type> getAllType() {
		return this.typeDao.getAll();
	}
	@Override
	public List<Area> getAllArea() {
		return this.areaDao.getAll();
	}
	@Override
	public List<Goods> getLast() {
		return this.goodsDao.getLast();
	}
	@Override
	public boolean delete(int index) {
		return this.goodsDao.delete(index);
	}
	@Override
	public List<Goods> GetAllSearTxt(String searchTxt) {
		return this.goodsDao.getSearchTxt(searchTxt);
	}

}
