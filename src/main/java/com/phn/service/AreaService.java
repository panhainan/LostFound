/**
 * 
 */
package com.phn.service;


import com.phn.entity.Area;
import com.phn.entity.Pages;

/**
 * @author 潘海南
 * @date 2014-10-13
 */
public interface AreaService {
	public boolean insert(Area area);
	public boolean update(Area area);
	public boolean delete(int index);
	public Area find(int index);
	public Pages getAll(int pageSize,int nowPage);
}
