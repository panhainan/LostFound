/**
 * 
 */
package com.phn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phn.dao.AreaDao;
import com.phn.dao.PageDao;
import com.phn.entity.Area;
import com.phn.entity.Pages;
import com.phn.service.AreaService;

/**
 * @author 潘海南
 * @date 2014-10-13
 */
@Service("areaService")
public class AreaServiceImpl implements AreaService {
	@Resource
	private AreaDao areaDao;
	@Resource
	private PageDao pageDao;
	@Override
	public boolean insert(Area area) {
		return this.areaDao.insert(area);
	}

	@Override
	public boolean update(Area area) {
		return this.areaDao.update(area);
	}

	@Override
	public boolean delete(int index) {
		return this.areaDao.delete(index);
	}

	@Override
	public Area find(int index) {
		return this.areaDao.find(index);
	}

	@Override
	public Pages getAll(int pageSize, int nowPage) {
		String sql = "from Area area order by area.id desc";
		int allRecords = this.pageDao.getAllRowCount(sql);
		int totalPages = Pages.calculateTotalPage(pageSize, allRecords);
		final int currentoffset = Pages.currentPage_startRecord(pageSize, nowPage);
		final int length = pageSize;
		final int currentPage = Pages.judgeCurrentPage(nowPage);
		List<Area> listArea = this.pageDao.query_Objects_ForPages(sql, currentoffset, length);
		Pages pagebean = new Pages();
		pagebean.setPageSize(pageSize);
		pagebean.setAllRecords(allRecords);
		pagebean.setCurrentPage(currentPage);
		pagebean.setTotalPages(totalPages);
		pagebean.setListArea(listArea);
		return pagebean;
	}

}
