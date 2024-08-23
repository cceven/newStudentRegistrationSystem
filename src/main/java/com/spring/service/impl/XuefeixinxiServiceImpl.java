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

@Service("XuefeixinxiService")
public class XuefeixinxiServiceImpl implements XuefeixinxiService {

    @Resource
    private XuefeixinxiMapper dao;

    /**
     * 获取所有数据
     * @return
     */
    public List<Xuefeixinxi> select() {
        return dao.select(null);
    }

    /**
     * 根据Xuefeixinxi类搜索数据
     * @param y
     * @return
     */
    public List<Xuefeixinxi> select(Xuefeixinxi y) {
        return dao.select(y);
    }

    /**
     * 根据主键获取学费信息一行数据
     * @param id
     * @return
     */
    public Xuefeixinxi find(Object id) {
        return dao.selectByPrimaryKey(id);
    }

    /**
     * 根据学费信息获取学费信息类条件查询一行数据
     * @param id
     * @return
     */
    public Xuefeixinxi findEntity(Xuefeixinxi id) {
        return dao.selectOne(id);
    }

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Xuefeixinxi> selectPage(Xuefeixinxi obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Xuefeixinxi> list = select(obj);
        PageInfo<Xuefeixinxi> pageInfo = new PageInfo(list);
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
    public List<Xuefeixinxi> selectPageExample(Example obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Xuefeixinxi> list = dao.selectByExample(obj);
        PageInfo<Xuefeixinxi> pageInfo = new PageInfo(list);
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
     * 插入学费信息     * @param y
     * @return
     */
    public int insert(Xuefeixinxi y) {
        return dao.insertSelective(y);
    }

    /**
     * 更新学费信息     * @param y
     * @return
     */
    public int update(Xuefeixinxi y) {
        return dao.updateByPrimaryKeySelective(y);
    }
}
