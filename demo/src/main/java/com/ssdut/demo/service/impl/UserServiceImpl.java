package com.ssdut.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssdut.demo.dao.user_infoMapper;
import com.ssdut.demo.pojo.user_info;
import com.ssdut.demo.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private user_infoMapper user_mapper;
	//获取所有用户列表
	public List<user_info> getList(){
		return user_mapper.getAllUsers();
	}
	//学生登陆
	public boolean checkLogin(String username, String password){
		user_info user =user_mapper.selectByUsername(username);
		if(username==null||"".equals(username)||password==null||"".equals(password))
			return false;
		if(user!=null&&password.equals(user.getUserpwd())){
			return true;
		}
		return false;
	}
	//注册学生
	public int insertUser(user_info user){
		return user_mapper.insert(user);
	}
	
	public user_info getUserByUserName(String name){
		return user_mapper.selectByUsername(name);
}
}
