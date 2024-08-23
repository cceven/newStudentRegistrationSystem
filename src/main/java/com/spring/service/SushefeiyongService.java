package com.spring.service;

import com.spring.entity.Sushefeiyong;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface SushefeiyongService {
    /**
     * 获取所有数据
     * @return
     */
    public List<Sushefeiyong> select();

    /**
     * 根据Sushefeiyong类搜索数据
     * @param y
     * @return
     */
    public List<Sushefeiyong> select(Sushefeiyong y);

    /**
     * 根据主键获取宿舍费用一行数据
     * @param id
     * @return
     */
    public Sushefeiyong find(Object id);

    /**
     * 根据宿舍费用获取宿舍费用类条件查询一行数据
     * @param id
     * @return
     */
    public Sushefeiyong findEntity(Sushefeiyong id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Sushefeiyong> selectPage(Sushefeiyong obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Sushefeiyong> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入宿舍费用     * @param y
     * @return
     */
    public int insert(Sushefeiyong y);

    /**
     * 更新宿舍费用     * @param y
     * @return
     */
    public int update(Sushefeiyong y);
}
