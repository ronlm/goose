package com.scau.dao;

import java.util.List;

public interface BaseDao<T> {
	public T get(T t);
	public void add(T t);
	public void delete(T t);
	public void update(T t);
	public List<T> getAll(String condition);
}
