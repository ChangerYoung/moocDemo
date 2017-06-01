package com.ssdut.demo.service;

import java.util.List;

import com.ssdut.demo.pojo.user_info;

public interface UserService {
	List<user_info> getList();
	boolean checkLogin(String username, String password);
	int insertUser(user_info user);
	user_info getUserByUserName(String name);
}
