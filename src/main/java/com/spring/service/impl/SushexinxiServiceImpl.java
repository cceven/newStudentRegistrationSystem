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

@Service("SushexinxiService")
public class SushexinxiServiceImpl implements SushexinxiService {

    @Resource
    private SushexinxiMapper dao;

    /**
     * 获取所有数据
     * @return
     */
    public List<Sushexinxi> select() {
        return dao.select(null);
    }

    /**
     * 根据Sushexinxi类搜索数据
     * @param y
     * @return
     */
    public List<Sushexinxi> select(Sushexinxi y) {
        return dao.select(y);
    }

    /**
     * 根据主键获取宿舍信息一行数据
     * @param id
     * @return
     */
    public Sushexinxi find(Object id) {
        return dao.selectByPrimaryKey(id);
    }

    /**
     * 根据宿舍信息获取宿舍信息类条件查询一行数据
     * @param id
     * @return
     */
    public Sushexinxi findEntity(Sushexinxi id) {
        return dao.selectOne(id);
    }

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Sushexinxi> selectPage(Sushexinxi obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Sushexinxi> list = select(obj);
        PageInfo<Sushexinxi> pageInfo = new PageInfo(list);
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
    public List<Sushexinxi> selectPageExample(Example obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Sushexinxi> list = dao.selectByExample(obj);
        PageInfo<Sushexinxi> pageInfo = new PageInfo(list);
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
     * 插入宿舍信息     * @param y
     * @return
     */
    public int insert(Sushexinxi y) {
        return dao.insertSelective(y);
    }

    /**
     * 更新宿舍信息     * @param y
     * @return
     */
    public int update(Sushexinxi y) {
        return dao.updateByPrimaryKeySelective(y);
    }
}
