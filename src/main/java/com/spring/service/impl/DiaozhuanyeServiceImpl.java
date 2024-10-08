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

@Service("DiaozhuanyeService")
public class DiaozhuanyeServiceImpl implements DiaozhuanyeService {

    @Resource
    private DiaozhuanyeMapper dao;

    /**
     * 获取所有数据
     * @return
     */
    public List<Diaozhuanye> select() {
        return dao.select(null);
    }

    /**
     * 根据Diaozhuanye类搜索数据
     * @param y
     * @return
     */
    public List<Diaozhuanye> select(Diaozhuanye y) {
        return dao.select(y);
    }

    /**
     * 根据主键获取调专业一行数据
     * @param id
     * @return
     */
    public Diaozhuanye find(Object id) {
        return dao.selectByPrimaryKey(id);
    }

    /**
     * 根据调专业获取调专业类条件查询一行数据
     * @param id
     * @return
     */
    public Diaozhuanye findEntity(Diaozhuanye id) {
        return dao.selectOne(id);
    }

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Diaozhuanye> selectPage(Diaozhuanye obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Diaozhuanye> list = select(obj);
        PageInfo<Diaozhuanye> pageInfo = new PageInfo(list);
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
    public List<Diaozhuanye> selectPageExample(Example obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Diaozhuanye> list = dao.selectByExample(obj);
        PageInfo<Diaozhuanye> pageInfo = new PageInfo(list);
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
     * 插入调专业     * @param y
     * @return
     */
    public int insert(Diaozhuanye y) {
        return dao.insertSelective(y);
    }

    /**
     * 更新调专业     * @param y
     * @return
     */
    public int update(Diaozhuanye y) {
        return dao.updateByPrimaryKeySelective(y);
    }
}
