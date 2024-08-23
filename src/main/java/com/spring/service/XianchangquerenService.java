package com.spring.service;

import com.spring.entity.Xianchangqueren;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface XianchangquerenService {
    /**
     * 获取所有数据
     * @return
     */
    public List<Xianchangqueren> select();

    /**
     * 根据Xianchangqueren类搜索数据
     * @param y
     * @return
     */
    public List<Xianchangqueren> select(Xianchangqueren y);

    /**
     * 根据主键获取现场确认一行数据
     * @param id
     * @return
     */
    public Xianchangqueren find(Object id);

    /**
     * 根据现场确认获取现场确认类条件查询一行数据
     * @param id
     * @return
     */
    public Xianchangqueren findEntity(Xianchangqueren id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Xianchangqueren> selectPage(Xianchangqueren obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Xianchangqueren> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入现场确认     * @param y
     * @return
     */
    public int insert(Xianchangqueren y);

    /**
     * 更新现场确认     * @param y
     * @return
     */
    public int update(Xianchangqueren y);
}
