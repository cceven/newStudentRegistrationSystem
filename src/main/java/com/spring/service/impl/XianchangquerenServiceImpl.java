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

@Service("XianchangquerenService")
public class XianchangquerenServiceImpl implements XianchangquerenService {

    @Resource
    private XianchangquerenMapper dao;

    /**
     * 获取所有数据
     * @return
     */
    public List<Xianchangqueren> select() {
        return dao.select(null);
    }

    /**
     * 根据Xianchangqueren类搜索数据
     * @param y
     * @return
     */
    public List<Xianchangqueren> select(Xianchangqueren y) {
        return dao.select(y);
    }

    /**
     * 根据主键获取现场确认一行数据
     * @param id
     * @return
     */
    public Xianchangqueren find(Object id) {
        return dao.selectByPrimaryKey(id);
    }

    /**
     * 根据现场确认获取现场确认类条件查询一行数据
     * @param id
     * @return
     */
    public Xianchangqueren findEntity(Xianchangqueren id) {
        return dao.selectOne(id);
    }

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Xianchangqueren> selectPage(Xianchangqueren obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Xianchangqueren> list = select(obj);
        PageInfo<Xianchangqueren> pageInfo = new PageInfo(list);
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
    public List<Xianchangqueren> selectPageExample(Example obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Xianchangqueren> list = dao.selectByExample(obj);
        PageInfo<Xianchangqueren> pageInfo = new PageInfo(list);
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
     * 插入现场确认     * @param y
     * @return
     */
    public int insert(Xianchangqueren y) {
        return dao.insertSelective(y);
    }

    /**
     * 更新现场确认     * @param y
     * @return
     */
    public int update(Xianchangqueren y) {
        return dao.updateByPrimaryKeySelective(y);
    }
}
