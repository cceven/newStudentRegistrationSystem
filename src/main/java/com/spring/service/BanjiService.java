package com.spring.service;

import com.spring.entity.Banji;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface BanjiService {
    /**
     * 获取所有数据
     * @return
     */
    public List<Banji> select();

    /**
     * 根据Banji类搜索数据
     * @param y
     * @return
     */
    public List<Banji> select(Banji y);

    /**
     * 根据主键获取班级一行数据
     * @param id
     * @return
     */
    public Banji find(Object id);

    /**
     * 根据班级获取班级类条件查询一行数据
     * @param id
     * @return
     */
    public Banji findEntity(Banji id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Banji> selectPage(Banji obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Banji> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入班级     * @param y
     * @return
     */
    public int insert(Banji y);

    /**
     * 更新班级     * @param y
     * @return
     */
    public int update(Banji y);
}
