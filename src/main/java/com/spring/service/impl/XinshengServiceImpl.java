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

@Service("XinshengService")
public class XinshengServiceImpl implements XinshengService {

    @Resource
    private XinshengMapper dao;

    public Xinsheng login(String username, String password) {
        Xinsheng user = new Xinsheng();
        user.setXuehao(username);
        user.setMima(password);

        return this.dao.login(user);
    }

    public boolean updatePassword(int id, String newPassword) {
        Xinsheng user = new Xinsheng();
        user.setId(id);
        user.setMima(newPassword);
        int i = this.dao.updateByPrimaryKeySelective(user);
        return i == 1;
    }

    /**
     * 获取所有数据
     * @return
     */
    public List<Xinsheng> select() {
        return dao.select(null);
    }

    /**
     * 根据Xinsheng类搜索数据
     * @param y
     * @return
     */
    public List<Xinsheng> select(Xinsheng y) {
        return dao.select(y);
    }

    /**
     * 根据主键获取新生一行数据
     * @param id
     * @return
     */
    public Xinsheng find(Object id) {
        return dao.selectByPrimaryKey(id);
    }

    /**
     * 根据新生获取新生类条件查询一行数据
     * @param id
     * @return
     */
    public Xinsheng findEntity(Xinsheng id) {
        return dao.selectOne(id);
    }

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Xinsheng> selectPage(Xinsheng obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Xinsheng> list = select(obj);
        PageInfo<Xinsheng> pageInfo = new PageInfo(list);
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
    public List<Xinsheng> selectPageExample(Example obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Xinsheng> list = dao.selectByExample(obj);
        PageInfo<Xinsheng> pageInfo = new PageInfo(list);
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
     * 插入新生     * @param y
     * @return
     */
    public int insert(Xinsheng y) {
        return dao.insertSelective(y);
    }

    /**
     * 更新新生     * @param y
     * @return
     */
    public int update(Xinsheng y) {
        return dao.updateByPrimaryKeySelective(y);
    }
}
