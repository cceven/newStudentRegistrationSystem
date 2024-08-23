package com.spring.service;

import com.spring.entity.Xinshengxinxi;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface XinshengxinxiService {
    public Xinshengxinxi login(String username, String password);

    public boolean updatePassword(int id, String newPassword);

    /**
     * 获取所有数据
     * @return
     */
    public List<Xinshengxinxi> select();

    /**
     * 根据Xinshengxinxi类搜索数据
     * @param y
     * @return
     */
    public List<Xinshengxinxi> select(Xinshengxinxi y);

    /**
     * 根据主键获取新生信息一行数据
     * @param id
     * @return
     */
    public Xinshengxinxi find(Object id);

    /**
     * 根据新生信息获取新生信息类条件查询一行数据
     * @param id
     * @return
     */
    public Xinshengxinxi findEntity(Xinshengxinxi id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Xinshengxinxi> selectPage(Xinshengxinxi obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Xinshengxinxi> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入新生信息     * @param y
     * @return
     */
    public int insert(Xinshengxinxi y);

    /**
     * 更新新生信息     * @param y
     * @return
     */
    public int update(Xinshengxinxi y);
}
