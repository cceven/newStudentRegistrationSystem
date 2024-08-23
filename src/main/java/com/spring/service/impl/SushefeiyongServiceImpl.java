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

@Service("SushefeiyongService")
public class SushefeiyongServiceImpl implements SushefeiyongService {

    @Resource
    private SushefeiyongMapper dao;

    /**
     * 获取所有数据
     * @return
     */
    public List<Sushefeiyong> select() {
        return dao.select(null);
    }

    /**
     * 根据Sushefeiyong类搜索数据
     * @param y
     * @return
     */
    public List<Sushefeiyong> select(Sushefeiyong y) {
        return dao.select(y);
    }

    /**
     * 根据主键获取宿舍费用一行数据
     * @param id
     * @return
     */
    public Sushefeiyong find(Object id) {
        return dao.selectByPrimaryKey(id);
    }

    /**
     * 根据宿舍费用获取宿舍费用类条件查询一行数据
     * @param id
     * @return
     */
    public Sushefeiyong findEntity(Sushefeiyong id) {
        return dao.selectOne(id);
    }

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Sushefeiyong> selectPage(Sushefeiyong obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Sushefeiyong> list = select(obj);
        PageInfo<Sushefeiyong> pageInfo = new PageInfo(list);
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
    public List<Sushefeiyong> selectPageExample(Example obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Sushefeiyong> list = dao.selectByExample(obj);
        PageInfo<Sushefeiyong> pageInfo = new PageInfo(list);
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
     * 插入宿舍费用     * @param y
     * @return
     */
    public int insert(Sushefeiyong y) {
        return dao.insertSelective(y);
    }

    /**
     * 更新宿舍费用     * @param y
     * @return
     */
    public int update(Sushefeiyong y) {
        return dao.updateByPrimaryKeySelective(y);
    }
}
