package com.ssdut.demo.dao;

import java.util.List;

import com.ssdut.demo.pojo.user_info;

public interface user_infoMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(user_info record);

    int insertSelective(user_info record);

    user_info selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(user_info record);

    int updateByPrimaryKey(user_info record);

	List<user_info> getAllUsers();
	
	user_info selectByUsername(String username);
}