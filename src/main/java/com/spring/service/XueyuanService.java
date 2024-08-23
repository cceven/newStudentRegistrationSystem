package com.spring.service;

import com.spring.entity.Xueyuan;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface XueyuanService {
    /**
     * 获取所有数据
     * @return
     */
    public List<Xueyuan> select();

    /**
     * 根据Xueyuan类搜索数据
     * @param y
     * @return
     */
    public List<Xueyuan> select(Xueyuan y);

    /**
     * 根据主键获取学院一行数据
     * @param id
     * @return
     */
    public Xueyuan find(Object id);

    /**
     * 根据学院获取学院类条件查询一行数据
     * @param id
     * @return
     */
    public Xueyuan findEntity(Xueyuan id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Xueyuan> selectPage(Xueyuan obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Xueyuan> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入学院     * @param y
     * @return
     */
    public int insert(Xueyuan y);

    /**
     * 更新学院     * @param y
     * @return
     */
    public int update(Xueyuan y);
}
