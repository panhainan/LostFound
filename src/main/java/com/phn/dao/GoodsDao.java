/**
 * 
 */
package com.phn.dao;

import java.util.List;

import com.phn.entity.Goods;

/**
 * @author 潘海南
 * @date 2014-9-18
 */
public interface GoodsDao {

	/**
	 * @param goods
	 */
	public void insert(Goods goods);

	/**
	 * @param index
	 * @return
	 */
	public Goods find(int index);

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
	public List<Goods> getSearchTxt(String searchTxt);

	/**
	 * @param userId
	 * @return
	 */
	public List<Goods> GetUserGoods(int userId);
	
}
