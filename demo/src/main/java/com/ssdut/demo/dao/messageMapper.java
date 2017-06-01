package com.ssdut.demo.dao;

import com.ssdut.demo.pojo.message;

public interface messageMapper {
    int deleteByPrimaryKey(Integer messageid);

    int insert(message record);

    int insertSelective(message record);

    message selectByPrimaryKey(Integer messageid);

    int updateByPrimaryKeySelective(message record);

    int updateByPrimaryKey(message record);
}