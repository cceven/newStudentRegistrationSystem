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

@Service("SushefenpeiService")
public class SushefenpeiServiceImpl implements SushefenpeiService {

    @Resource
    private SushefenpeiMapper dao;

    /**
     * 获取所有数据
     * @return
     */
    public List<Sushefenpei> select() {
        return dao.select(null);
    }

    /**
     * 根据Sushefenpei类搜索数据
     * @param y
     * @return
     */
    public List<Sushefenpei> select(Sushefenpei y) {
        return dao.select(y);
    }

    /**
     * 根据主键获取宿舍分配一行数据
     * @param id
     * @return
     */
    public Sushefenpei find(Object id) {
        return dao.selectByPrimaryKey(id);
    }

    /**
     * 根据宿舍分配获取宿舍分配类条件查询一行数据
     * @param id
     * @return
     */
    public Sushefenpei findEntity(Sushefenpei id) {
        return dao.selectOne(id);
    }

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Sushefenpei> selectPage(Sushefenpei obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Sushefenpei> list = select(obj);
        PageInfo<Sushefenpei> pageInfo = new PageInfo(list);
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
    public List<Sushefenpei> selectPageExample(Example obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Sushefenpei> list = dao.selectByExample(obj);
        PageInfo<Sushefenpei> pageInfo = new PageInfo(list);
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
     * 插入宿舍分配     * @param y
     * @return
     */
    public int insert(Sushefenpei y) {
        return dao.insertSelective(y);
    }

    /**
     * 更新宿舍分配     * @param y
     * @return
     */
    public int update(Sushefenpei y) {
        return dao.updateByPrimaryKeySelective(y);
    }
}
