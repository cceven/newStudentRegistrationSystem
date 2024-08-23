package com.spring.service;

import com.spring.entity.Xueshengxinxi;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface XueshengxinxiService {
    /**
     * 获取所有数据
     * @return
     */
    public List<Xueshengxinxi> select();

    /**
     * 根据Xueshengxinxi类搜索数据
     * @param y
     * @return
     */
    public List<Xueshengxinxi> select(Xueshengxinxi y);

    /**
     * 根据主键获取学生信息一行数据
     * @param id
     * @return
     */
    public Xueshengxinxi find(Object id);

    /**
     * 根据学生信息获取学生信息类条件查询一行数据
     * @param id
     * @return
     */
    public Xueshengxinxi findEntity(Xueshengxinxi id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Xueshengxinxi> selectPage(Xueshengxinxi obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Xueshengxinxi> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入学生信息     * @param y
     * @return
     */
    public int insert(Xueshengxinxi y);

    /**
     * 更新学生信息     * @param y
     * @return
     */
    public int update(Xueshengxinxi y);
}
