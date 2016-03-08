package com.ssm.demo.test.dao;

import java.util.List;

import com.ssm.demo.test.vo.ScheduleJob;

public interface ScheduleJobMapper {
    int deleteByPrimaryKey(Integer jobId);

    int insert(ScheduleJob record);

    int insertSelective(ScheduleJob record);

    ScheduleJob selectByPrimaryKey(Integer jobId);

    int updateByPrimaryKeySelective(ScheduleJob record);

    int updateByPrimaryKey(ScheduleJob record);
    
    List<ScheduleJob> selectAll();
}