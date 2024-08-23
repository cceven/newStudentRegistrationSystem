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
 * 调专业审批 */
@Controller
public class DiaozhuanyeshenpiController extends BaseController {

    @Autowired
    private DiaozhuanyeshenpiMapper dao;

    @Autowired
    private DiaozhuanyeshenpiService service;

    @Autowired
    private DiaozhuanyeService serviceRead;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/diaozhuanyeshenpi_list")
    public String list() {
        // 检测是否有登录，没登录则跳转到登录页面
        if (!checkLogin()) {
            return showError("尚未登录", "./login.do");
        }

        String order = Request.get("order", "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort = Request.get("sort", "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        Example example = new Example(Diaozhuanyeshenpi.class); //  创建一个扩展搜索类
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
        List<Diaozhuanyeshenpi> list = service.selectPageExample(example, page, 12); // 获取当前页的行数
        // 将列表写给界面使用
        assign("list", list);
        assign("orderby", order); // 把当前排序结果写进前台
        assign("sort", sort); // 把当前排序结果写进前台
        assign("where", where); // 把当前条件写给前台
        return "diaozhuanyeshenpi_list"; // 使用视图文件：WebRoot\diaozhuanyeshenpi_list.jsp
    }

    /**
     *  获取前台搜索框填写的内容,并组成where 语句
     */
    public String getWhere() {
        String where = " ";
        // 判断URL 参数diaozhuanyeid是否大于0
        if (Request.getInt("diaozhuanyeid") > 0) {
            // 大于0 则写入条件
            where += " AND diaozhuanyeid='" + Request.getInt("diaozhuanyeid") + "' ";
        }
        // 以下是判断搜索框中是否有输入内容，判断是否前台是否有填写相关条件，符合则写入sql搜索语句
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
        if (!Request.get("diaodaoxueyuan").equals("")) {
            where += " AND diaodaoxueyuan ='" + Request.get("diaodaoxueyuan") + "' ";
        }
        if (!Request.get("diaodaozhuanye").equals("")) {
            where += " AND diaodaozhuanye ='" + Request.get("diaodaozhuanye") + "' ";
        }
        if (!Request.get("shenpi").equals("")) {
            where += " AND shenpi ='" + Request.get("shenpi") + "' ";
        }
        return where;
    }

    /**
     * 申请学生列表
     */
    @RequestMapping("/diaozhuanyeshenpi_list_shenqingxuesheng")
    public String listshenqingxuesheng() {
        // 检测是否有登录，没登录则跳转到登录页面
        if (!checkLogin()) {
            return showError("尚未登录", "./login.do");
        }

        String order = Request.get("order", "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort = Request.get("sort", "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        Example example = new Example(Diaozhuanyeshenpi.class); //  创建一个扩展搜索类
        Example.Criteria criteria = example.createCriteria(); // 创建一个扩展搜索条件类
        // 初始化一个条件，条件为：申请学生=当前登录用户
        String where = " shenqingxuesheng='" + session.getAttribute("username") + "' ";
        where += getWhere();

        criteria.andCondition(where); // 将条件写入
        if (sort.equals("desc")) { // 注释同list
            example.orderBy(order).desc(); // 注释同list
        } else {
            example.orderBy(order).asc(); // 注释同list
        }

        int page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page")); // 注释同list
        page = Math.max(1, page); // 注释同list

        List<Diaozhuanyeshenpi> list = service.selectPageExample(example, page, 12);

        request.setAttribute("list", list);
        assign("orderby", order);
        assign("sort", sort);
        assign("where", where);
        return "diaozhuanyeshenpi_list_shenqingxuesheng";
    }

    @RequestMapping("/diaozhuanyeshenpi_add")
    public String add() {
        int id = Request.getInt("id"); // 根据id 获取 调专业模块中的数据
        Diaozhuanye readMap = serviceRead.find(id);
        // 将数据行写入给前台jsp页面
        request.setAttribute("readMap", readMap);
        return "diaozhuanyeshenpi_add";
    }

    @RequestMapping("/diaozhuanyeshenpi_updt")
    public String updt() {
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Diaozhuanyeshenpi mmm = service.find(id);
        request.setAttribute("mmm", mmm);
        request.setAttribute("updtself", 0);
        return "diaozhuanyeshenpi_updt";
    }

    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/diaozhuanyeshenpiinsert")
    public String insert() {
        String tmp = "";
        Diaozhuanyeshenpi post = new Diaozhuanyeshenpi(); // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setDiaozhuanyeid(Request.getInt("diaozhuanyeid"));

        post.setXuehao(Request.get("xuehao"));

        post.setXingming(Request.get("xingming"));

        post.setXueyuan(Request.get("xueyuan"));

        post.setZhuanye(Request.get("zhuanye"));

        post.setBanji(Request.get("banji"));

        post.setShenqingbianhao(Request.get("shenqingbianhao"));

        post.setShenqingshijian(Request.get("shenqingshijian"));

        post.setDiaodaoxueyuan(Request.get("diaodaoxueyuan"));

        post.setDiaodaozhuanye(Request.get("diaodaozhuanye"));

        post.setDiaodaobanji(Request.get("diaodaobanji"));

        post.setShenqingmiaoshu(Request.get("shenqingmiaoshu"));

        post.setShenqingxuesheng(Request.get("shenqingxuesheng"));

        post.setShenpi(Request.get("shenpi"));

        post.setShenpibeizhu(Request.get("shenpibeizhu"));

        post.setCaozuoren(Request.get("caozuoren"));

        post.setDiaozhuanyeid(Request.getInt("diaozhuanyeid"));

        service.insert(post); // 插入数据
        int charuid = post.getId().intValue();
        Query.execute("update diaozhuanye set shenqingzhuangtai='" + request.getParameter("shenpi") + "' where id='" + request.getParameter("diaozhuanyeid") + "'");

        Query.execute(
            "update xinsheng set xueyuan='" +
            request.getParameter("diaodaoxueyuan") +
            "',zhuanye='" +
            request.getParameter("diaodaozhuanye") +
            "',banji='" +
            request.getParameter("diaodaobanji") +
            "' where xuehao='" +
            request.getParameter("xuehao") +
            "' AND '" +
            request.getParameter("shenpi") +
            "'='通过'"
        );

        return showSuccess("保存成功", Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
     * 更新内容
     * @return
     */
    @RequestMapping("/diaozhuanyeshenpiupdate")
    public String update() {
        // 创建实体类
        Diaozhuanyeshenpi post = new Diaozhuanyeshenpi();
        // 将前台表单数据填充到实体类
        if (!Request.get("diaozhuanyeid").equals("")) post.setDiaozhuanyeid(Request.getInt("diaozhuanyeid"));
        if (!Request.get("xuehao").equals("")) post.setXuehao(Request.get("xuehao"));
        if (!Request.get("xingming").equals("")) post.setXingming(Request.get("xingming"));
        if (!Request.get("xueyuan").equals("")) post.setXueyuan(Request.get("xueyuan"));
        if (!Request.get("zhuanye").equals("")) post.setZhuanye(Request.get("zhuanye"));
        if (!Request.get("banji").equals("")) post.setBanji(Request.get("banji"));
        if (!Request.get("shenqingbianhao").equals("")) post.setShenqingbianhao(Request.get("shenqingbianhao"));
        if (!Request.get("shenqingshijian").equals("")) post.setShenqingshijian(Request.get("shenqingshijian"));
        if (!Request.get("diaodaoxueyuan").equals("")) post.setDiaodaoxueyuan(Request.get("diaodaoxueyuan"));
        if (!Request.get("diaodaozhuanye").equals("")) post.setDiaodaozhuanye(Request.get("diaodaozhuanye"));
        if (!Request.get("diaodaobanji").equals("")) post.setDiaodaobanji(Request.get("diaodaobanji"));
        if (!Request.get("shenqingmiaoshu").equals("")) post.setShenqingmiaoshu(Request.get("shenqingmiaoshu"));
        if (!Request.get("shenqingxuesheng").equals("")) post.setShenqingxuesheng(Request.get("shenqingxuesheng"));
        if (!Request.get("shenpi").equals("")) post.setShenpi(Request.get("shenpi"));
        if (!Request.get("shenpibeizhu").equals("")) post.setShenpibeizhu(Request.get("shenpibeizhu"));
        if (!Request.get("caozuoren").equals("")) post.setCaozuoren(Request.get("caozuoren"));

        post.setId(Request.getInt("id"));
        service.update(post); // 更新数据
        int charuid = post.getId().intValue();
        return showSuccess("保存成功", Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
    }

    /**
     *  后台详情
     */
    @RequestMapping("/diaozhuanyeshenpi_detail")
    public String detail() {
        int id = Request.getInt("id");
        Diaozhuanyeshenpi map = service.find(id); // 根据前台url 参数中的id获取行数据
        request.setAttribute("map", map); // 把数据写到前台
        return "diaozhuanyeshenpi_detail"; // 详情页面：WebRoot\diaozhuanyeshenpi_detail.jsp
    }

    /**
     *  删除
     */
    @RequestMapping("/diaozhuanyeshenpi_delete")
    public String delete() {
        if (!checkLogin()) {
            return showError("尚未登录");
        }
        int id = Request.getInt("id"); // 根据id 删除某行数据
        Map map = Query.make("diaozhuanyeshenpi").find(id);

        service.delete(id); // 根据id 删除某行数据
        return showSuccess("删除成功", request.getHeader("referer")); //弹出删除成功，并跳回上一页
    }
}
