package com.spring.service;

import com.spring.entity.Xinsheng;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface XinshengService {
    public Xinsheng login(String username, String password);

    public boolean updatePassword(int id, String newPassword);

    /**
     * 获取所有数据
     * @return
     */
    public List<Xinsheng> select();

    /**
     * 根据Xinsheng类搜索数据
     * @param y
     * @return
     */
    public List<Xinsheng> select(Xinsheng y);

    /**
     * 根据主键获取新生一行数据
     * @param id
     * @return
     */
    public Xinsheng find(Object id);

    /**
     * 根据新生获取新生类条件查询一行数据
     * @param id
     * @return
     */
    public Xinsheng findEntity(Xinsheng id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Xinsheng> selectPage(Xinsheng obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Xinsheng> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入新生     * @param y
     * @return
     */
    public int insert(Xinsheng y);

    /**
     * 更新新生     * @param y
     * @return
     */
    public int update(Xinsheng y);
}
