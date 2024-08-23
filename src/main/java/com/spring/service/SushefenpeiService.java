package com.spring.service;

import com.spring.entity.Sushefenpei;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface SushefenpeiService {
    /**
     * 获取所有数据
     * @return
     */
    public List<Sushefenpei> select();

    /**
     * 根据Sushefenpei类搜索数据
     * @param y
     * @return
     */
    public List<Sushefenpei> select(Sushefenpei y);

    /**
     * 根据主键获取宿舍分配一行数据
     * @param id
     * @return
     */
    public Sushefenpei find(Object id);

    /**
     * 根据宿舍分配获取宿舍分配类条件查询一行数据
     * @param id
     * @return
     */
    public Sushefenpei findEntity(Sushefenpei id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Sushefenpei> selectPage(Sushefenpei obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Sushefenpei> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入宿舍分配     * @param y
     * @return
     */
    public int insert(Sushefenpei y);

    /**
     * 更新宿舍分配     * @param y
     * @return
     */
    public int update(Sushefenpei y);
}
