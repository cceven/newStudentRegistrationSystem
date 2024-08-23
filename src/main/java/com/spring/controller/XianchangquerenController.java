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
 * 现场确认 */
@Controller
public class XianchangquerenController extends BaseController {

    @Autowired
    private XianchangquerenMapper dao;

    @Autowired
    private XianchangquerenService service;

    @Autowired
    private XinshengxinxiService serviceRead;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/xianchangqueren_list")
    public String list() {
        // 检测是否有登录，没登录则跳转到登录页面
        if (!checkLogin()) {
            return showError("尚未登录", "./login.do");
        }

        String order = Request.get("order", "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort = Request.get("sort", "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        Example example = new Example(Xianchangqueren.class); //  创建一个扩展搜索类
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
        List<Xianchangqueren> list = service.selectPageExample(example, page, 12); // 获取当前页的行数
        // 将列表写给界面使用
        assign("list", list);
        assign("orderby", order); // 把当前排序结果写进前台
        assign("sort", sort); // 把当前排序结果写进前台
        assign("where", where); // 把当前条件写给前台
        return "xianchangqueren_list"; // 使用视图文件：WebRoot\xianchangqueren_list.jsp
    }

    /**
     *  获取前台搜索框填写的内容,并组成where 语句
     */
    public String getWhere() {
        String where = " ";
        // 判断URL 参数xinshengxinxiid是否大于0
        if (Request.getInt("xinshengxinxiid") > 0) {
            // 大于0 则写入条件
            where += " AND xinshengxinxiid='" + Request.getInt("xinshengxinxiid") + "' ";
        }
        // 以下是判断搜索框中是否有输入内容，判断是否前台是否有填写相关条件，符合则写入sql搜索语句
        if (!Request.get("yonghuming").equals("")) {
            where += " AND yonghuming LIKE '%" + Request.get("yonghuming") + "%' ";
        }
        if (!Request.get("shifouxinsheng").equals("")) {
            where += " AND shifouxinsheng ='" + Request.get("shifouxinsheng") + "' ";
        }
        if (!Request.get("beizhu").equals("")) {
            where += " AND beizhu LIKE '%" + Request.get("beizhu") + "%' ";
        }
        return where;
    }

    @RequestMapping("/xianchangqueren_add")
    public String add() {
        int id = Request.getInt("id"); // 根据id 获取 新生信息模块中的数据
        Xinshengxinxi readMap = serviceRead.find(id);
        // 将数据行写入给前台jsp页面
        request.setAttribute("readMap", readMap);
        return "xianchangqueren_add";
    }

    @RequestMapping("/xianchangqueren_updt")
    public String updt() {
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Xianchangqueren mmm = service.find(id);
        request.setAttribute("mmm", mmm);
        request.setAttribute("updtself", 0);
        return "xianchangqueren_updt";
    }

    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/xianchangquereninsert")
    public String insert() {
        String tmp = "";
        Xianchangqueren post = new Xianchangqueren(); // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setXinshengxinxiid(Request.getInt("xinshengxinxiid"));

        post.setYonghuming(Request.get("yonghuming"));

        post.setXingming(Request.get("xingming"));

        post.setXingbie(Request.get("xingbie"));

        post.setLianxifangshi(Request.get("lianxifangshi"));

        post.setShifouxinsheng(Request.get("shifouxinsheng"));

        post.setBeizhu(Request.get("beizhu"));

        post.setCaozuoren(Request.get("caozuoren"));

        post.setXinshengxinxiid(Request.getInt("xinshengxinxiid"));

        service.insert(post); // 插入数据
        int charuid = post.getId().intValue();
        Query.execute("update xinshengxinxi set shifouxinsheng='" + request.getParameter("shifouxinsheng") + "' where id='" + request.getParameter("xinshengxinxiid") + "'");

        return showSuccess("保存成功", Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
     * 更新内容
     * @return
     */
    @RequestMapping("/xianchangquerenupdate")
    public String update() {
        // 创建实体类
        Xianchangqueren post = new Xianchangqueren();
        // 将前台表单数据填充到实体类
        if (!Request.get("xinshengxinxiid").equals("")) post.setXinshengxinxiid(Request.getInt("xinshengxinxiid"));
        if (!Request.get("yonghuming").equals("")) post.setYonghuming(Request.get("yonghuming"));
        if (!Request.get("xingming").equals("")) post.setXingming(Request.get("xingming"));
        if (!Request.get("xingbie").equals("")) post.setXingbie(Request.get("xingbie"));
        if (!Request.get("lianxifangshi").equals("")) post.setLianxifangshi(Request.get("lianxifangshi"));
        if (!Request.get("shifouxinsheng").equals("")) post.setShifouxinsheng(Request.get("shifouxinsheng"));
        if (!Request.get("beizhu").equals("")) post.setBeizhu(Request.get("beizhu"));
        if (!Request.get("caozuoren").equals("")) post.setCaozuoren(Request.get("caozuoren"));

        post.setId(Request.getInt("id"));
        service.update(post); // 更新数据
        int charuid = post.getId().intValue();
        return showSuccess("保存成功", Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
    }

    /**
     *  后台详情
     */
    @RequestMapping("/xianchangqueren_detail")
    public String detail() {
        int id = Request.getInt("id");
        Xianchangqueren map = service.find(id); // 根据前台url 参数中的id获取行数据
        request.setAttribute("map", map); // 把数据写到前台
        return "xianchangqueren_detail"; // 详情页面：WebRoot\xianchangqueren_detail.jsp
    }

    /**
     *  删除
     */
    @RequestMapping("/xianchangqueren_delete")
    public String delete() {
        if (!checkLogin()) {
            return showError("尚未登录");
        }
        int id = Request.getInt("id"); // 根据id 删除某行数据
        Map map = Query.make("xianchangqueren").find(id);

        service.delete(id); // 根据id 删除某行数据
        return showSuccess("删除成功", request.getHeader("referer")); //弹出删除成功，并跳回上一页
    }
}
