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

@Service("XueshengxinxiService")
public class XueshengxinxiServiceImpl implements XueshengxinxiService {

    @Resource
    private XueshengxinxiMapper dao;

    /**
     * 获取所有数据
     * @return
     */
    public List<Xueshengxinxi> select() {
        return dao.select(null);
    }

    /**
     * 根据Xueshengxinxi类搜索数据
     * @param y
     * @return
     */
    public List<Xueshengxinxi> select(Xueshengxinxi y) {
        return dao.select(y);
    }

    /**
     * 根据主键获取学生信息一行数据
     * @param id
     * @return
     */
    public Xueshengxinxi find(Object id) {
        return dao.selectByPrimaryKey(id);
    }

    /**
     * 根据学生信息获取学生信息类条件查询一行数据
     * @param id
     * @return
     */
    public Xueshengxinxi findEntity(Xueshengxinxi id) {
        return dao.selectOne(id);
    }

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Xueshengxinxi> selectPage(Xueshengxinxi obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Xueshengxinxi> list = select(obj);
        PageInfo<Xueshengxinxi> pageInfo = new PageInfo(list);
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
    public List<Xueshengxinxi> selectPageExample(Example obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Xueshengxinxi> list = dao.selectByExample(obj);
        PageInfo<Xueshengxinxi> pageInfo = new PageInfo(list);
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
     * 插入学生信息     * @param y
     * @return
     */
    public int insert(Xueshengxinxi y) {
        return dao.insertSelective(y);
    }

    /**
     * 更新学生信息     * @param y
     * @return
     */
    public int update(Xueshengxinxi y) {
        return dao.updateByPrimaryKeySelective(y);
    }
}
