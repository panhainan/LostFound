/**
 * 
 */
package com.phn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phn.dao.PageDao;
import com.phn.dao.TypeDao;
import com.phn.entity.Pages;
import com.phn.entity.Type;
import com.phn.service.TypeService;

/**
 * @author 潘海南
 * @date 2014-10-13
 */
@Service("typeService")
public class TypeServiceImpl implements TypeService {
	@Resource
	private TypeDao typeDao;
	@Resource
	private PageDao pageDao;
	@Override
	public boolean insert(Type type) {
		return this.typeDao.insert(type);
	}

	@Override
	public boolean update(Type type) {
		return this.typeDao.update(type);
	}

	@Override
	public boolean delete(int index) {
		return this.typeDao.delete(index);
	}

	@Override
	public Type find(int index) {
		return this.typeDao.find(index);
	}

	@Override
	public Pages getAll(int pageSize, int nowPage) {
		String sql = "from Type type order by type.id desc";
		int allRecords = this.pageDao.getAllRowCount(sql);
		int totalPages = Pages.calculateTotalPage(pageSize, allRecords);
		final int currentoffset = Pages.currentPage_startRecord(pageSize, nowPage);
		final int length = pageSize;
		final int currentPage = Pages.judgeCurrentPage(nowPage);
		List<Type> listType = this.pageDao.query_Objects_ForPages(sql, currentoffset, length);
		Pages pagebean = new Pages();
		pagebean.setPageSize(pageSize);
		pagebean.setAllRecords(allRecords);
		pagebean.setCurrentPage(currentPage);
		pagebean.setTotalPages(totalPages);
		pagebean.setListType(listType);
		return pagebean;
	}

}
