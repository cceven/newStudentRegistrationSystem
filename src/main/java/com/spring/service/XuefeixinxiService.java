package com.spring.service;

import com.spring.entity.Xuefeixinxi;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface XuefeixinxiService {
    /**
     * 获取所有数据
     * @return
     */
    public List<Xuefeixinxi> select();

    /**
     * 根据Xuefeixinxi类搜索数据
     * @param y
     * @return
     */
    public List<Xuefeixinxi> select(Xuefeixinxi y);

    /**
     * 根据主键获取学费信息一行数据
     * @param id
     * @return
     */
    public Xuefeixinxi find(Object id);

    /**
     * 根据学费信息获取学费信息类条件查询一行数据
     * @param id
     * @return
     */
    public Xuefeixinxi findEntity(Xuefeixinxi id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Xuefeixinxi> selectPage(Xuefeixinxi obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Xuefeixinxi> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入学费信息     * @param y
     * @return
     */
    public int insert(Xuefeixinxi y);

    /**
     * 更新学费信息     * @param y
     * @return
     */
    public int update(Xuefeixinxi y);
}
