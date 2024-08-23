package com.spring.service;

import com.spring.entity.Sushexinxi;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface SushexinxiService {
    /**
     * 获取所有数据
     * @return
     */
    public List<Sushexinxi> select();

    /**
     * 根据Sushexinxi类搜索数据
     * @param y
     * @return
     */
    public List<Sushexinxi> select(Sushexinxi y);

    /**
     * 根据主键获取宿舍信息一行数据
     * @param id
     * @return
     */
    public Sushexinxi find(Object id);

    /**
     * 根据宿舍信息获取宿舍信息类条件查询一行数据
     * @param id
     * @return
     */
    public Sushexinxi findEntity(Sushexinxi id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Sushexinxi> selectPage(Sushexinxi obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Sushexinxi> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入宿舍信息     * @param y
     * @return
     */
    public int insert(Sushexinxi y);

    /**
     * 更新宿舍信息     * @param y
     * @return
     */
    public int update(Sushexinxi y);
}
