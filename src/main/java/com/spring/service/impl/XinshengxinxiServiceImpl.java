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

@Service("XinshengxinxiService")
public class XinshengxinxiServiceImpl implements XinshengxinxiService {

    @Resource
    private XinshengxinxiMapper dao;

    public Xinshengxinxi login(String username, String password) {
        Xinshengxinxi user = new Xinshengxinxi();
        user.setYonghuming(username);
        user.setMima(password);

        return this.dao.login(user);
    }

    public boolean updatePassword(int id, String newPassword) {
        Xinshengxinxi user = new Xinshengxinxi();
        user.setId(id);
        user.setMima(newPassword);
        int i = this.dao.updateByPrimaryKeySelective(user);
        return i == 1;
    }

    /**
     * 获取所有数据
     * @return
     */
    public List<Xinshengxinxi> select() {
        return dao.select(null);
    }

    /**
     * 根据Xinshengxinxi类搜索数据
     * @param y
     * @return
     */
    public List<Xinshengxinxi> select(Xinshengxinxi y) {
        return dao.select(y);
    }

    /**
     * 根据主键获取新生信息一行数据
     * @param id
     * @return
     */
    public Xinshengxinxi find(Object id) {
        return dao.selectByPrimaryKey(id);
    }

    /**
     * 根据新生信息获取新生信息类条件查询一行数据
     * @param id
     * @return
     */
    public Xinshengxinxi findEntity(Xinshengxinxi id) {
        return dao.selectOne(id);
    }

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Xinshengxinxi> selectPage(Xinshengxinxi obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Xinshengxinxi> list = select(obj);
        PageInfo<Xinshengxinxi> pageInfo = new PageInfo(list);
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
    public List<Xinshengxinxi> selectPageExample(Example obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Xinshengxinxi> list = dao.selectByExample(obj);
        PageInfo<Xinshengxinxi> pageInfo = new PageInfo(list);
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
     * 插入新生信息     * @param y
     * @return
     */
    public int insert(Xinshengxinxi y) {
        return dao.insertSelective(y);
    }

    /**
     * 更新新生信息     * @param y
     * @return
     */
    public int update(Xinshengxinxi y) {
        return dao.updateByPrimaryKeySelective(y);
    }
}
