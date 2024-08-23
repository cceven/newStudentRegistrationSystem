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
 * 学费信息 */
@Controller
public class XuefeixinxiController extends BaseController {

    @Autowired
    private XuefeixinxiMapper dao;

    @Autowired
    private XuefeixinxiService service;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/xuefeixinxi_list")
    public String list() {
        // 检测是否有登录，没登录则跳转到登录页面
        if (!checkLogin()) {
            return showError("尚未登录", "./login.do");
        }

        String order = Request.get("order", "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort = Request.get("sort", "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        Example example = new Example(Xuefeixinxi.class); //  创建一个扩展搜索类
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
        List<Xuefeixinxi> list = service.selectPageExample(example, page, 12); // 获取当前页的行数
        // 将列表写给界面使用
        assign("list", list);
        assign("orderby", order); // 把当前排序结果写进前台
        assign("sort", sort); // 把当前排序结果写进前台
        assign("where", where); // 把当前条件写给前台
        return "xuefeixinxi_list"; // 使用视图文件：WebRoot\xuefeixinxi_list.jsp
    }

    /**
     *  获取前台搜索框填写的内容,并组成where 语句
     */
    public String getWhere() {
        String where = " ";
        // 以下是判断搜索框中是否有输入内容，判断是否前台是否有填写相关条件，符合则写入sql搜索语句
        if (!Request.get("xuefeibianhao").equals("")) {
            where += " AND xuefeibianhao LIKE '%" + Request.get("xuefeibianhao") + "%' ";
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
        return where;
    }

    /**
     * 学号列表
     */
    @RequestMapping("/xuefeixinxi_list_xuehao")
    public String listxuehao() {
        // 检测是否有登录，没登录则跳转到登录页面
        if (!checkLogin()) {
            return showError("尚未登录", "./login.do");
        }

        String order = Request.get("order", "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort = Request.get("sort", "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        Example example = new Example(Xuefeixinxi.class); //  创建一个扩展搜索类
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

        List<Xuefeixinxi> list = service.selectPageExample(example, page, 12);

        request.setAttribute("list", list);
        assign("orderby", order);
        assign("sort", sort);
        assign("where", where);
        return "xuefeixinxi_list_xuehao";
    }

    /**
     *  导出数据
     *
     */
    @RequestMapping("/xuefeixinxi_export")
    public String export() {
        if (!checkLogin()) {
            return showError("尚未登录", "./");
        }
        String order = Request.get("order", "id"); // 注释同list
        String sort = Request.get("sort", "desc"); // 注释同list
        String where = " 1=1 "; // 注释同list
        where += getWhere(); // 注释同list
        Execl xls = new Execl(); // 注册一个Execl 导入导出对象
        xls.addCol("id", "ID"); // 添加一列  id 字段，名称ID

        xls.addCol("xuefeibianhao", "学费编号"); // 添加一列 xuefeibianhao，学费编号

        xls.addCol("xuesheng", "学生"); // 添加一列 xuesheng，学生

        xls.addCol("xuehao", "学号"); // 添加一列 xuehao，学号

        xls.addCol("xingming", "姓名"); // 添加一列 xingming，姓名

        xls.addCol("xingbie", "性别"); //添加一列  xingbie ， 性别

        xls.addColSelect("xueyuan", "学院", "xueyuan", "id", "xueyuanmingcheng", 0); //添加一个下拉框的行，表字段名，名称，下拉框表，值，名称、是否多选

        xls.addColSelect("zhuanye", "专业", "zhuanye", "id", "zhuanyemingcheng", 0); //添加一个下拉框的行，表字段名，名称，下拉框表，值，名称、是否多选

        xls.addColSelect("banji", "班级", "banji", "id", "banjimingcheng", 0); //添加一个下拉框的行，表字段名，名称，下拉框表，值，名称、是否多选

        xls.addCol("xuefeifeiyong", "学费费用"); // 添加一列 xuefeifeiyong，学费费用

        xls.addCol("beizhu", "备注"); // 添加一列 beizhu，备注

        xls.addCol("jiaofeizhuangtai", "缴费状态"); //添加一列  jiaofeizhuangtai ， 缴费状态

        xls.addCol("caozuoren", "操作人"); // 添加一列 caozuoren，操作人

        xls.addCol("iszf", "是否支付");

        // 搜索数据库数据，并把数据导入到  execl 导入导出类
        List<Map> list = Query.make("xuefeixinxi").where(where).order(order + " " + sort).select();
        xls.addData(list);
        // 执行导出
        xls.export("xuefeixinxi", response);
        return "success";
    }

    @RequestMapping("/xuefeixinxi_add")
    public String add() {
        return "xuefeixinxi_add";
    }

    @RequestMapping("/xuefeixinxi_updt")
    public String updt() {
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Xuefeixinxi mmm = service.find(id);
        request.setAttribute("mmm", mmm);
        request.setAttribute("updtself", 0);
        return "xuefeixinxi_updt";
    }

    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/xuefeixinxiinsert")
    public String insert() {
        String tmp = "";
        Xuefeixinxi post = new Xuefeixinxi(); // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setXuefeibianhao(Request.get("xuefeibianhao"));

        post.setXuesheng(Request.getInt("xuesheng"));

        post.setXuehao(Request.get("xuehao"));

        post.setXingming(Request.get("xingming"));

        post.setXingbie(Request.get("xingbie"));

        post.setXueyuan(Request.get("xueyuan"));

        post.setZhuanye(Request.get("zhuanye"));

        post.setBanji(Request.get("banji"));

        post.setXuefeifeiyong(Request.getDouble("xuefeifeiyong"));

        post.setBeizhu(Request.get("beizhu"));

        post.setJiaofeizhuangtai(Request.get("jiaofeizhuangtai"));

        post.setCaozuoren(Request.get("caozuoren"));

        post.setIszf(Request.get("iszf", "否"));

        service.insert(post); // 插入数据
        int charuid = post.getId().intValue();

        return showSuccess("保存成功", Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
     * 更新内容
     * @return
     */
    @RequestMapping("/xuefeixinxiupdate")
    public String update() {
        // 创建实体类
        Xuefeixinxi post = new Xuefeixinxi();
        // 将前台表单数据填充到实体类
        if (!Request.get("xuefeibianhao").equals("")) post.setXuefeibianhao(Request.get("xuefeibianhao"));
        if (!Request.get("xuesheng").equals("")) post.setXuesheng(Request.getInt("xuesheng"));
        if (!Request.get("xuehao").equals("")) post.setXuehao(Request.get("xuehao"));
        if (!Request.get("xingming").equals("")) post.setXingming(Request.get("xingming"));
        if (!Request.get("xingbie").equals("")) post.setXingbie(Request.get("xingbie"));
        if (!Request.get("xueyuan").equals("")) post.setXueyuan(Request.get("xueyuan"));
        if (!Request.get("zhuanye").equals("")) post.setZhuanye(Request.get("zhuanye"));
        if (!Request.get("banji").equals("")) post.setBanji(Request.get("banji"));
        if (!Request.get("xuefeifeiyong").equals("")) post.setXuefeifeiyong(Request.getDouble("xuefeifeiyong"));
        if (!Request.get("beizhu").equals("")) post.setBeizhu(Request.get("beizhu"));
        if (!Request.get("jiaofeizhuangtai").equals("")) post.setJiaofeizhuangtai(Request.get("jiaofeizhuangtai"));
        if (!Request.get("caozuoren").equals("")) post.setCaozuoren(Request.get("caozuoren"));

        post.setId(Request.getInt("id"));
        service.update(post); // 更新数据
        int charuid = post.getId().intValue();
        return showSuccess("保存成功", Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
    }

    /**
     *  后台详情
     */
    @RequestMapping("/xuefeixinxi_detail")
    public String detail() {
        int id = Request.getInt("id");
        Xuefeixinxi map = service.find(id); // 根据前台url 参数中的id获取行数据
        request.setAttribute("map", map); // 把数据写到前台
        return "xuefeixinxi_detail"; // 详情页面：WebRoot\xuefeixinxi_detail.jsp
    }

    /**
     *  删除
     */
    @RequestMapping("/xuefeixinxi_delete")
    public String delete() {
        if (!checkLogin()) {
            return showError("尚未登录");
        }
        int id = Request.getInt("id"); // 根据id 删除某行数据
        Map map = Query.make("xuefeixinxi").find(id);

        service.delete(id); // 根据id 删除某行数据
        return showSuccess("删除成功", request.getHeader("referer")); //弹出删除成功，并跳回上一页
    }
}
