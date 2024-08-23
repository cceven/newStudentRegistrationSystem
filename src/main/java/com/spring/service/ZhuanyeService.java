package com.spring.service;

import com.spring.entity.Zhuanye;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface ZhuanyeService {
    /**
     * 获取所有数据
     * @return
     */
    public List<Zhuanye> select();

    /**
     * 根据Zhuanye类搜索数据
     * @param y
     * @return
     */
    public List<Zhuanye> select(Zhuanye y);

    /**
     * 根据主键获取专业一行数据
     * @param id
     * @return
     */
    public Zhuanye find(Object id);

    /**
     * 根据专业获取专业类条件查询一行数据
     * @param id
     * @return
     */
    public Zhuanye findEntity(Zhuanye id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Zhuanye> selectPage(Zhuanye obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Zhuanye> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入专业     * @param y
     * @return
     */
    public int insert(Zhuanye y);

    /**
     * 更新专业     * @param y
     * @return
     */
    public int update(Zhuanye y);
}
