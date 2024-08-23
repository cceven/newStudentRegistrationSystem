package com.spring.controller;

import com.jntoo.db.*;
import com.jntoo.db.utils.*;
import com.spring.dao.*;
import com.spring.entity.*;
import com.spring.service.*;
import com.spring.util.*;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tk.mybatis.mapper.entity.Example;

/**
 * 宿舍分配 */
@Controller
public class SushefenpeiController extends BaseController {

    @Autowired
    private SushefenpeiMapper dao;

    @Autowired
    private SushefenpeiService service;

    @Autowired
    private SushexinxiService serviceRead;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/sushefenpei_list")
    public String list() {
        // 检测是否有登录，没登录则跳转到登录页面
        if (!checkLogin()) {
            return showError("尚未登录", "./login.do");
        }

        String order = Request.get("order", "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort = Request.get("sort", "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        Example example = new Example(Sushefenpei.class); //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria(); // 创建一个扩展搜索条件类
        String where = " 1=1 "; // 创建初始条件为：1=1
        where += getWhere(); // 从方法中获取url 上的参数，并写成 sql条件语句
        criteria.andCondition(where); // 将条件写进上面的扩展条件类中
        if (sort.equals("desc")) { // 判断前台提交的sort 参数是否等于  desc倒序  是则使用倒序，否则使用正序
            example.orderBy(order).desc(); // 把sql 语句设置成倒序
        } else {
            example.orderBy(order).asc(); // 把 sql 设置成正序
        }
        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")); // 获取前台提交的URL参数 page  如果没有则设置为1
        page = Math.max(1, page); // 取两个数的最大值，防止page 小于1
        List<Sushefenpei> list = service.selectPageExample(example, page, 12); // 获取当前页的行数
        // 将列表写给界面使用
        assign("list", list);
        assign("orderby", order); // 把当前排序结果写进前台
        assign("sort", sort); // 把当前排序结果写进前台
        assign("where", where); // 把当前条件写给前台
        return "sushefenpei_list"; // 使用视图文件：WebRoot\sushefenpei_list.jsp
    }

    /**
     *  获取前台搜索框填写的内容,并组成where 语句
     */
    public String getWhere() {
        String where = " ";
        // 判断URL 参数sushexinxiid是否大于0
        if (Request.getInt("sushexinxiid") > 0) {
            // 大于0 则写入条件
            where += " AND sushexinxiid='" + Request.getInt("sushexinxiid") + "' ";
        }
        // 以下是判断搜索框中是否有输入内容，判断是否前台是否有填写相关条件，符合则写入sql搜索语句
        if (!Request.get("sushehao").equals("")) {
            where += " AND sushehao LIKE '%" + Request.get("sushehao") + "%' ";
        }
        if (!Request.get("susheleixing").equals("")) {
            where += " AND susheleixing ='" + Request.get("susheleixing") + "' ";
        }
        if (!Request.get("chuangweihao").equals("")) {
            where += " AND chuangweihao LIKE '%" + Request.get("chuangweihao") + "%' ";
        }
        if (!Request.get("xuehao").equals("")) {
            where += " AND xuehao LIKE '%" + Request.get("xuehao") + "%' ";
        }
        if (!Request.get("xueyuan").equals("")) {
            where += " AND xueyuan ='" + Request.get("xueyuan") + "' ";
        }
        if (!Request.get("zhuanye").equals("")) {
            where += " AND zhuanye ='" + Request.get("zhuanye") + "' ";
        }
        if (!Request.get("banji").equals("")) {
            where += " AND banji ='" + Request.get("banji") + "' ";
        }
        if (!Request.get("fenpeishijian_start").equals("")) {
            where += " AND fenpeishijian >='" + Request.get("fenpeishijian_start") + "' ";
        }
        if (!Request.get("fenpeishijian_end").equals("")) {
            where += " AND fenpeishijian <= '" + Request.get("fenpeishijian_end") + "' ";
        }
        return where;
    }

    /**
     * 学号列表
     */
    @RequestMapping("/sushefenpei_list_xuehao")
    public String listxuehao() {
        // 检测是否有登录，没登录则跳转到登录页面
        if (!checkLogin()) {
            return showError("尚未登录", "./login.do");
        }

        String order = Request.get("order", "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort = Request.get("sort", "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        Example example = new Example(Sushefenpei.class); //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria(); // 创建一个扩展搜索条件类
        // 初始化一个条件，条件为：学号=当前登录用户
        String where = " xuehao='" + session.getAttribute("username") + "' ";
        where += getWhere();

        criteria.andCondition(where); // 将条件写入
        if (sort.equals("desc")) { // 注释同list
            example.orderBy(order).desc(); // 注释同list
        } else {
            example.orderBy(order).asc(); // 注释同list
        }

        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")); // 注释同list
        page = Math.max(1, page); // 注释同list

        List<Sushefenpei> list = service.selectPageExample(example, page, 12);

        request.setAttribute("list", list);
        assign("orderby", order);
        assign("sort", sort);
        assign("where", where);
        return "sushefenpei_list_xuehao";
    }

    @RequestMapping("/sushefenpei_add")
    public String add() {
        int id = Request.getInt("id"); // 根据id 获取 宿舍信息模块中的数据
        Sushexinxi readMap = serviceRead.find(id);
        // 将数据行写入给前台jsp页面
        request.setAttribute("readMap", readMap);
        return "sushefenpei_add";
    }

    @RequestMapping("/sushefenpei_updt")
    public String updt() {
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Sushefenpei mmm = service.find(id);
        request.setAttribute("mmm", mmm);
        request.setAttribute("updtself", 0);
        return "sushefenpei_updt";
    }

    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/sushefenpeiinsert")
    public String insert() {
        String tmp = "";
        Sushefenpei post = new Sushefenpei(); // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setSushexinxiid(Request.getInt("sushexinxiid"));

        post.setSushehao(Request.get("sushehao"));

        post.setSusheleixing(Request.get("susheleixing"));

        post.setChuangweihao(Request.get("chuangweihao"));

        post.setXuesheng(Request.getInt("xuesheng"));

        post.setXuehao(Request.get("xuehao"));

        post.setXingming(Request.get("xingming"));

        post.setXingbie(Request.get("xingbie"));

        post.setXueyuan(Request.get("xueyuan"));

        post.setZhuanye(Request.get("zhuanye"));

        post.setBanji(Request.get("banji"));

        post.setFenpeishijian(Request.get("fenpeishijian"));

        post.setSushexinxiid(Request.getInt("sushexinxiid"));

        service.insert(post); // 插入数据
        int charuid = post.getId().intValue();
        Query.execute("update xinsheng set suozaisushehao='" + request.getParameter("sushehao") + "' where xuehao='" + request.getParameter("xuehao") + "'");

        Query.execute("update xinsheng set shifoufenpeisushe='是' where xuehao='" + request.getParameter("xuehao") + "'");

        Query.execute("update xinsheng set chuangweihao='" + request.getParameter("chuangweihao") + "' where xuehao='" + request.getParameter("xuehao") + "'");

        Query.execute("update sushexinxi set yizhurenshu=yizhurenshu+1 where id='" + request.getParameter("sushexinxiid") + "'");

        return showSuccess("保存成功", Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
     * 更新内容
     * @return
     */
    @RequestMapping("/sushefenpeiupdate")
    public String update() {
        // 创建实体类
        Sushefenpei post = new Sushefenpei();
        // 将前台表单数据填充到实体类
        if (!Request.get("sushexinxiid").equals("")) post.setSushexinxiid(Request.getInt("sushexinxiid"));
        if (!Request.get("sushehao").equals("")) post.setSushehao(Request.get("sushehao"));
        if (!Request.get("susheleixing").equals("")) post.setSusheleixing(Request.get("susheleixing"));
        if (!Request.get("chuangweihao").equals("")) post.setChuangweihao(Request.get("chuangweihao"));
        if (!Request.get("xuesheng").equals("")) post.setXuesheng(Request.getInt("xuesheng"));
        if (!Request.get("xuehao").equals("")) post.setXuehao(Request.get("xuehao"));
        if (!Request.get("xingming").equals("")) post.setXingming(Request.get("xingming"));
        if (!Request.get("xingbie").equals("")) post.setXingbie(Request.get("xingbie"));
        if (!Request.get("xueyuan").equals("")) post.setXueyuan(Request.get("xueyuan"));
        if (!Request.get("zhuanye").equals("")) post.setZhuanye(Request.get("zhuanye"));
        if (!Request.get("banji").equals("")) post.setBanji(Request.get("banji"));
        if (!Request.get("fenpeishijian").equals("")) post.setFenpeishijian(Request.get("fenpeishijian"));

        post.setId(Request.getInt("id"));
        service.update(post); // 更新数据
        int charuid = post.getId().intValue();
        return showSuccess("保存成功", Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
    }

    /**
     *  后台详情
     */
    @RequestMapping("/sushefenpei_detail")
    public String detail() {
        int id = Request.getInt("id");
        Sushefenpei map = service.find(id); // 根据前台url 参数中的id获取行数据
        request.setAttribute("map", map); // 把数据写到前台
        return "sushefenpei_detail"; // 详情页面：WebRoot\sushefenpei_detail.jsp
    }

    /**
     *  删除
     */
    @RequestMapping("/sushefenpei_delete")
    public String delete() {
        if (!checkLogin()) {
            return showError("尚未登录");
        }
        int id = Request.getInt("id"); // 根据id 删除某行数据
        Map map = Query.make("sushefenpei").find(id);

        service.delete(id); // 根据id 删除某行数据
        return showSuccess("删除成功", request.getHeader("referer")); //弹出删除成功，并跳回上一页
    }
}
