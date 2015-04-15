/**
 * 
 */
package com.phn.service;


import com.phn.entity.Pages;
import com.phn.entity.Type;

/**
 * @author 潘海南
 * @date 2014-10-13
 */
public interface TypeService {
	public boolean insert(Type type);
	public boolean update(Type type);
	public boolean delete(int index);
	public Type find(int index);
	public Pages getAll(int pageSize,int nowPage);
}
