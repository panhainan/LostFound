/**
 * 
 */
package com.phn.service;

import java.util.List;

import com.phn.entity.Help;

/**
 * @author 王云鹏
 * @date 2014-10-25
 */
public interface HelpService {
	/**
	 * 增加帮助信息
	 * */
	public boolean addHelp(Help help);
	
	
	/**
	 * 查找相应帮助信息
	 * */
	public Help findHelp(String helptitle);
	
	public Help findHelp1(int index);
	
	/**
	 * 删除相应帮助
	 * */
	public boolean delHelp(String helptitle);
	
	public boolean delHelp1(int index);
	/**
	 * 修改帮助内容
	 * */
	public boolean updateHelp(Help help);
	
	public int getRowCount();
	
	public List<Help> Getlisthelp(int PageNow,int PageSize);


	/**
	 * @return
	 */
	public List<Help> GetAll();


	/**
	 * @return
	 */
	public List<Help> GetIndex();

}
