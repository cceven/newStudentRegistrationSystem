package com.spring.service;

import com.spring.entity.Diaozhuanyeshenpi;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface DiaozhuanyeshenpiService {
    /**
     * 获取所有数据
     * @return
     */
    public List<Diaozhuanyeshenpi> select();

    /**
     * 根据Diaozhuanyeshenpi类搜索数据
     * @param y
     * @return
     */
    public List<Diaozhuanyeshenpi> select(Diaozhuanyeshenpi y);

    /**
     * 根据主键获取调专业审批一行数据
     * @param id
     * @return
     */
    public Diaozhuanyeshenpi find(Object id);

    /**
     * 根据调专业审批获取调专业审批类条件查询一行数据
     * @param id
     * @return
     */
    public Diaozhuanyeshenpi findEntity(Diaozhuanyeshenpi id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Diaozhuanyeshenpi> selectPage(Diaozhuanyeshenpi obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Diaozhuanyeshenpi> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入调专业审批     * @param y
     * @return
     */
    public int insert(Diaozhuanyeshenpi y);

    /**
     * 更新调专业审批     * @param y
     * @return
     */
    public int update(Diaozhuanyeshenpi y);
}
