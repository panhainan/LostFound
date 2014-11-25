/**
 * 
 */
package com.phn.service;

import java.util.List;

import com.phn.entity.Area;
import com.phn.entity.Goods;
import com.phn.entity.Pages;
import com.phn.entity.Type;
import com.phn.entity.User;

/**
 * @author 潘海南
 * @date 2014-9-18
 */
public interface GoodsService {
	public Pages GetAllLostForPage(int pageSize, int nowPage);

	/**
	 * @param us
	 */
	public void newInfoUpdateUser(User us);

	/**
	 * @param goods
	 */
	public void newInfo(Goods goods);

	/**
	 * @param pageSize
	 * @param nowPage
	 * @return
	 */
	public Pages GetAllFoundForPage(int pageSize, int nowPage);

	/**
	 * @param index
	 * @return
	 */
	public Goods find(int index);

	/**
	 * @return
	 */
	public List<Type> getAllType();

	/**
	 * @return
	 */
	public List<Area> getAllArea();

	/**
	 * @return
	 */
	public List<Goods> getLast();

	/**
	 * @param index
	 * @return 
	 */
	public boolean delete(int index);

	/**
	 * @param searchTxt
	 * @return
	 */
	public List<Goods> GetAllSearTxt(String searchTxt);
}
