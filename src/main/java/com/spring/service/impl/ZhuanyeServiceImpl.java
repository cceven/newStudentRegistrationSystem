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

@Service("ZhuanyeService")
public class ZhuanyeServiceImpl implements ZhuanyeService {

    @Resource
    private ZhuanyeMapper dao;

    /**
     * 获取所有数据
     * @return
     */
    public List<Zhuanye> select() {
        return dao.select(null);
    }

    /**
     * 根据Zhuanye类搜索数据
     * @param y
     * @return
     */
    public List<Zhuanye> select(Zhuanye y) {
        return dao.select(y);
    }

    /**
     * 根据主键获取专业一行数据
     * @param id
     * @return
     */
    public Zhuanye find(Object id) {
        return dao.selectByPrimaryKey(id);
    }

    /**
     * 根据专业获取专业类条件查询一行数据
     * @param id
     * @return
     */
    public Zhuanye findEntity(Zhuanye id) {
        return dao.selectOne(id);
    }

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Zhuanye> selectPage(Zhuanye obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Zhuanye> list = select(obj);
        PageInfo<Zhuanye> pageInfo = new PageInfo(list);
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
    public List<Zhuanye> selectPageExample(Example obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Zhuanye> list = dao.selectByExample(obj);
        PageInfo<Zhuanye> pageInfo = new PageInfo(list);
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
     * 插入专业     * @param y
     * @return
     */
    public int insert(Zhuanye y) {
        return dao.insertSelective(y);
    }

    /**
     * 更新专业     * @param y
     * @return
     */
    public int update(Zhuanye y) {
        return dao.updateByPrimaryKeySelective(y);
    }
}
