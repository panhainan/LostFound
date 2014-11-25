/**
 * 
 */
package com.phn.dao;

import java.util.List;

import com.phn.entity.Type;

/**
 * @author 潘海南
 * @date 2014-10-13
 */
public interface TypeDao {
	public boolean insert(Type type);
	public boolean update(Type type);
	public boolean delete(int index);
	public Type find(int index);
	/**
	 * @return
	 */
	public List<Type> getAll();
}
