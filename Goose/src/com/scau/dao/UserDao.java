package com.scau.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.scau.model.User;

@Component
public class UserDao implements BaseDao<User> {
	private HibernateTemplate hibernateTemplate;
	@Override
	public User get(User t) {
		
		List<User> users = hibernateTemplate.find("from User u where u.username='"+ t.getUserName() + "' and u.password='" + t.getPassword()+ "'");
		if(users != null && users.size() >0 ){
			return users.get(0);
		}
		else 
			return null;
	}

	@Override
	public void add(User t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(User t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(User t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<User> getAll(String condition) {
		// TODO Auto-generated method stub
		return null;
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	
}
