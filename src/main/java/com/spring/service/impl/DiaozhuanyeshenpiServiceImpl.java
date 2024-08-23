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

@Service("DiaozhuanyeshenpiService")
public class DiaozhuanyeshenpiServiceImpl implements DiaozhuanyeshenpiService {

    @Resource
    private DiaozhuanyeshenpiMapper dao;

    /**
     * 获取所有数据
     * @return
     */
    public List<Diaozhuanyeshenpi> select() {
        return dao.select(null);
    }

    /**
     * 根据Diaozhuanyeshenpi类搜索数据
     * @param y
     * @return
     */
    public List<Diaozhuanyeshenpi> select(Diaozhuanyeshenpi y) {
        return dao.select(y);
    }

    /**
     * 根据主键获取调专业审批一行数据
     * @param id
     * @return
     */
    public Diaozhuanyeshenpi find(Object id) {
        return dao.selectByPrimaryKey(id);
    }

    /**
     * 根据调专业审批获取调专业审批类条件查询一行数据
     * @param id
     * @return
     */
    public Diaozhuanyeshenpi findEntity(Diaozhuanyeshenpi id) {
        return dao.selectOne(id);
    }

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Diaozhuanyeshenpi> selectPage(Diaozhuanyeshenpi obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Diaozhuanyeshenpi> list = select(obj);
        PageInfo<Diaozhuanyeshenpi> pageInfo = new PageInfo(list);
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
    public List<Diaozhuanyeshenpi> selectPageExample(Example obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Diaozhuanyeshenpi> list = dao.selectByExample(obj);
        PageInfo<Diaozhuanyeshenpi> pageInfo = new PageInfo(list);
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
     * 插入调专业审批     * @param y
     * @return
     */
    public int insert(Diaozhuanyeshenpi y) {
        return dao.insertSelective(y);
    }

    /**
     * 更新调专业审批     * @param y
     * @return
     */
    public int update(Diaozhuanyeshenpi y) {
        return dao.updateByPrimaryKeySelective(y);
    }
}
