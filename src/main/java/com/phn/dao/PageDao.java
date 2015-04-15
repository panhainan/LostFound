/**
 * 
 */
package com.phn.dao;

import java.util.List;


/**
 * @author 潘海南
 * @email phnlove@163.com
 */
public interface PageDao {
	/**
	 * 用于查询所有区域记录条数
	 * @param hql 用于查找的sql语句
	 * @return 总页数
	 */
	public int getAllRowCount(String hql);
	/**
	 * 用户分页查找出区域信息
	 * @param hql 用于查找的sql语句
	 * @param offset 当前页的开始记录
	 * @param length 每页显示的数量
	 * @return 分页的区域信息
	 */
	public List query_Objects_ForPages(String hql, int offset, int length);
}
