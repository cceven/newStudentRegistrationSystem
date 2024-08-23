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

@Service("BanjiService")
public class BanjiServiceImpl implements BanjiService {

    @Resource
    private BanjiMapper dao;

    /**
     * 获取所有数据
     * @return
     */
    public List<Banji> select() {
        return dao.select(null);
    }

    /**
     * 根据Banji类搜索数据
     * @param y
     * @return
     */
    public List<Banji> select(Banji y) {
        return dao.select(y);
    }

    /**
     * 根据主键获取班级一行数据
     * @param id
     * @return
     */
    public Banji find(Object id) {
        return dao.selectByPrimaryKey(id);
    }

    /**
     * 根据班级获取班级类条件查询一行数据
     * @param id
     * @return
     */
    public Banji findEntity(Banji id) {
        return dao.selectOne(id);
    }

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Banji> selectPage(Banji obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Banji> list = select(obj);
        PageInfo<Banji> pageInfo = new PageInfo(list);
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
    public List<Banji> selectPageExample(Example obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Banji> list = dao.selectByExample(obj);
        PageInfo<Banji> pageInfo = new PageInfo(list);
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
     * 插入班级     * @param y
     * @return
     */
    public int insert(Banji y) {
        return dao.insertSelective(y);
    }

    /**
     * 更新班级     * @param y
     * @return
     */
    public int update(Banji y) {
        return dao.updateByPrimaryKeySelective(y);
    }
}
