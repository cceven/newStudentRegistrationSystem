package com.spring.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.spring.dao.*;
import com.spring.entity.*;
import com.spring.service.*;
import com.spring.util.*;
import java.util.*;
import java.util.*;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

@Service("XueyuanService")
public class XueyuanServiceImpl implements XueyuanService {

    @Resource
    private XueyuanMapper dao;

    /**
     * 获取所有数据
     * @return
     */
    public List<Xueyuan> select() {
        return dao.select(null);
    }

    /**
     * 根据Xueyuan类搜索数据
     * @param y
     * @return
     */
    public List<Xueyuan> select(Xueyuan y) {
        return dao.select(y);
    }

    /**
     * 根据主键获取学院一行数据
     * @param id
     * @return
     */
    public Xueyuan find(Object id) {
        return dao.selectByPrimaryKey(id);
    }

    /**
     * 根据学院获取学院类条件查询一行数据
     * @param id
     * @return
     */
    public Xueyuan findEntity(Xueyuan id) {
        return dao.selectOne(id);
    }

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Xueyuan> selectPage(Xueyuan obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Xueyuan> list = select(obj);
        PageInfo<Xueyuan> pageInfo = new PageInfo(list);
        PageInfoUtil pageInfoUtil = new PageInfoUtil(page);
        pageInfoUtil.setPageInfo(Request.getRequest(), pageInfo.getTotal(), pageSize);
        return list;
    }

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Xueyuan> selectPageExample(Example obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Xueyuan> list = dao.selectByExample(obj);
        PageInfo<Xueyuan> pageInfo = new PageInfo(list);
        PageInfoUtil pageInfoUtil = new PageInfoUtil(page);
        pageInfoUtil.setPageInfo(Request.getRequest(), pageInfo.getTotal(), pageSize);
        return list;
    }

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id) {
        return dao.deleteByPrimaryKey(id);
    }

    /**
     * 插入学院     * @param y
     * @return
     */
    public int insert(Xueyuan y) {
        return dao.insertSelective(y);
    }

    /**
     * 更新学院     * @param y
     * @return
     */
    public int update(Xueyuan y) {
        return dao.updateByPrimaryKeySelective(y);
    }
}
