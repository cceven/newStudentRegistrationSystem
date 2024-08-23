package com.spring.service;

import com.spring.entity.Diaozhuanye;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface DiaozhuanyeService {
    /**
     * 获取所有数据
     * @return
     */
    public List<Diaozhuanye> select();

    /**
     * 根据Diaozhuanye类搜索数据
     * @param y
     * @return
     */
    public List<Diaozhuanye> select(Diaozhuanye y);

    /**
     * 根据主键获取调专业一行数据
     * @param id
     * @return
     */
    public Diaozhuanye find(Object id);

    /**
     * 根据调专业获取调专业类条件查询一行数据
     * @param id
     * @return
     */
    public Diaozhuanye findEntity(Diaozhuanye id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Diaozhuanye> selectPage(Diaozhuanye obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Diaozhuanye> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入调专业     * @param y
     * @return
     */
    public int insert(Diaozhuanye y);

    /**
     * 更新调专业     * @param y
     * @return
     */
    public int update(Diaozhuanye y);
}
