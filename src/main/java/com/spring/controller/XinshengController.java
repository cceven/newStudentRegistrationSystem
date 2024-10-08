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
 * 新生 */
@Controller
public class XinshengController extends BaseController {

    @Autowired
    private XinshengMapper dao;

    @Autowired
    private XinshengService service;

    /**
     *  后台列表页
     *
     */
    @RequestMapping("/xinsheng_list")
    public String list() {
        // 检测是否有登录，没登录则跳转到登录页面
        if (!checkLogin()) {
            return showError("尚未登录", "./login.do");
        }

        String order = Request.get("order", "id"); // 获取前台提交的URL参数 order  如果没有则设置为id
        String sort = Request.get("sort", "desc"); // 获取前台提交的URL参数 sort  如果没有则设置为desc

        Example example = new Example(Xinsheng.class); //  创建一个扩展搜索类
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
        List<Xinsheng> list = service.selectPageExample(example, page, 12); // 获取当前页的行数
        // 将列表写给界面使用
        assign("list", list);
        assign("orderby", order); // 把当前排序结果写进前台
        assign("sort", sort); // 把当前排序结果写进前台
        assign("where", where); // 把当前条件写给前台
        return "xinsheng_list"; // 使用视图文件：WebRoot\xinsheng_list.jsp
    }

    /**
     *  获取前台搜索框填写的内容,并组成where 语句
     */
    public String getWhere() {
        String where = " ";
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
        return where;
    }

    /**
     *  导出数据
     *
     */
    @RequestMapping("/xinsheng_export")
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

        xls.addCol("xuehao", "学号"); // 添加一列 xuehao，学号

        xls.addCol("mima", "密码"); // 添加一列 mima，密码

        xls.addCol("xingming", "姓名"); // 添加一列 xingming，姓名

        xls.addCol("xingbie", "性别"); //添加一列  xingbie ， 性别

        xls.addCol("shengyuandi", "生源地"); // 添加一列 shengyuandi，生源地

        xls.addColSelect("xueyuan", "学院", "xueyuan", "id", "xueyuanmingcheng", 0); //添加一个下拉框的行，表字段名，名称，下拉框表，值，名称、是否多选

        xls.addColSelect("zhuanye", "专业", "zhuanye", "id", "zhuanyemingcheng", 0); //添加一个下拉框的行，表字段名，名称，下拉框表，值，名称、是否多选

        xls.addColSelect("banji", "班级", "banji", "id", "banjimingcheng", 0); //添加一个下拉框的行，表字段名，名称，下拉框表，值，名称、是否多选

        xls.addCol("lianxifangshi", "联系方式"); // 添加一列 lianxifangshi，联系方式

        xls.addCol("xueshengjianjie", "学生简介"); // 添加一列 xueshengjianjie，学生简介

        xls.addCol("shifoufenpeisushe", "是否分配宿舍"); //添加一列  shifoufenpeisushe ， 是否分配宿舍

        xls.addCol("suozaisushehao", "所在宿舍号"); // 添加一列 suozaisushehao，所在宿舍号

        xls.addCol("chuangweihao", "床位号"); // 添加一列 chuangweihao，床位号

        xls.addCol("shifouyijiaoxuefei", "是否已缴学费"); //添加一列  shifouyijiaoxuefei ， 是否已缴学费

        xls.addCol("sushejiaofei", "宿舍缴费"); //添加一列  sushejiaofei ， 宿舍缴费

        xls.addCol("issh", "是否审核");

        // 搜索数据库数据，并把数据导入到  execl 导入导出类
        List<Map> list = Query.make("xinsheng").where(where).order(order + " " + sort).select();
        xls.addData(list);
        // 执行导出
        xls.export("xinsheng", response);
        return "success";
    }

    /**
     *  导入模块
     */
    @RequestMapping("/xinsheng_import")
    public String imports() {
        // 输出导出页面 WebRoot\xinsheng_import.jsp
        return "xinsheng_import";
    }

    /**
     *  生成导入模版文件
     */
    @RequestMapping("/xinsheng_importfile")
    public String importFile() {
        Execl xls = new Execl(); // 生成导入导出类
        xls.addCol("xuehao", "学号");
        xls.addCol("mima", "密码");
        xls.addCol("xingming", "姓名");
        xls.addCol("xingbie", "性别");
        xls.addCol("shengyuandi", "生源地");
        xls.addColSelect("xueyuan", "学院", "xueyuan", "id", "xueyuanmingcheng", 0);
        xls.addColSelect("zhuanye", "专业", "zhuanye", "id", "zhuanyemingcheng", 0);
        xls.addColSelect("banji", "班级", "banji", "id", "banjimingcheng", 0);
        xls.addCol("lianxifangshi", "联系方式");
        xls.addCol("xueshengjianjie", "学生简介");
        xls.addCol("shifoufenpeisushe", "是否分配宿舍");
        xls.addCol("suozaisushehao", "所在宿舍号");
        xls.addCol("chuangweihao", "床位号");
        xls.addCol("shifouyijiaoxuefei", "是否已缴学费");
        xls.addCol("sushejiaofei", "宿舍缴费");
        // 插入一个空数据列，执行导出文件
        List<Map> list = new ArrayList();
        xls.addData(list);
        xls.export("xinshengtemplate", response);
        return "success";
    }

    @RequestMapping("/xinsheng_add")
    public String add() {
        return "xinsheng_add";
    }

    @RequestMapping("/xinsheng_updt")
    public String updt() {
        int id = Request.getInt("id");
        // 获取行数据，并赋值给前台jsp页面
        Xinsheng mmm = service.find(id);
        request.setAttribute("mmm", mmm);
        request.setAttribute("updtself", 0);
        return "xinsheng_updt";
    }

    /**
     *  更新个人资料
     */
    @RequestMapping("/xinsheng_updtself")
    public String updtself() {
        // 更新个人资料
        int id = (int) request.getSession().getAttribute("id");
        Xinsheng mmm = service.find(id);
        request.setAttribute("mmm", mmm);
        request.setAttribute("updtself", 1);

        return "xinsheng_updtself";
    }

    /**
     * 添加内容
     * @return
     */
    @RequestMapping("/xinshenginsert")
    public String insert() {
        String tmp = "";
        Xinsheng post = new Xinsheng(); // 创建实体类
        // 设置前台提交上来的数据到实体类中
        post.setXuehao(Request.get("xuehao"));

        post.setMima(Request.get("mima"));

        post.setXingming(Request.get("xingming"));

        post.setXingbie(Request.get("xingbie"));

        post.setShengyuandi(Request.get("shengyuandi"));

        post.setXueyuan(Request.get("xueyuan"));

        post.setZhuanye(Request.get("zhuanye"));

        post.setBanji(Request.get("banji"));

        post.setLianxifangshi(Request.get("lianxifangshi"));

        post.setXueshengjianjie(Request.get("xueshengjianjie"));

        post.setShifoufenpeisushe(Request.get("shifoufenpeisushe"));

        post.setSuozaisushehao(Request.get("suozaisushehao"));

        post.setChuangweihao(Request.get("chuangweihao"));

        post.setShifouyijiaoxuefei(Request.get("shifouyijiaoxuefei"));

        post.setSushejiaofei(Request.get("sushejiaofei"));

        post.setIssh(Request.get("issh", "否"));

        service.insert(post); // 插入数据
        int charuid = post.getId().intValue();

        return showSuccess("保存成功", Request.get("referer").equals("") ? request.getHeader("referer") : Request.get("referer"));
    }

    /**
     * 更新内容
     * @return
     */
    @RequestMapping("/xinshengupdate")
    public String update() {
        // 创建实体类
        Xinsheng post = new Xinsheng();
        // 将前台表单数据填充到实体类
        if (!Request.get("xuehao").equals("")) post.setXuehao(Request.get("xuehao"));
        if (!Request.get("mima").equals("")) post.setMima(Request.get("mima"));
        if (!Request.get("xingming").equals("")) post.setXingming(Request.get("xingming"));
        if (!Request.get("xingbie").equals("")) post.setXingbie(Request.get("xingbie"));
        if (!Request.get("shengyuandi").equals("")) post.setShengyuandi(Request.get("shengyuandi"));
        if (!Request.get("xueyuan").equals("")) post.setXueyuan(Request.get("xueyuan"));
        if (!Request.get("zhuanye").equals("")) post.setZhuanye(Request.get("zhuanye"));
        if (!Request.get("banji").equals("")) post.setBanji(Request.get("banji"));
        if (!Request.get("lianxifangshi").equals("")) post.setLianxifangshi(Request.get("lianxifangshi"));
        if (!Request.get("xueshengjianjie").equals("")) post.setXueshengjianjie(Request.get("xueshengjianjie"));
        if (!Request.get("shifoufenpeisushe").equals("")) post.setShifoufenpeisushe(Request.get("shifoufenpeisushe"));
        if (!Request.get("suozaisushehao").equals("")) post.setSuozaisushehao(Request.get("suozaisushehao"));
        if (!Request.get("chuangweihao").equals("")) post.setChuangweihao(Request.get("chuangweihao"));
        if (!Request.get("shifouyijiaoxuefei").equals("")) post.setShifouyijiaoxuefei(Request.get("shifouyijiaoxuefei"));
        if (!Request.get("sushejiaofei").equals("")) post.setSushejiaofei(Request.get("sushejiaofei"));

        post.setId(Request.getInt("id"));
        service.update(post); // 更新数据
        int charuid = post.getId().intValue();
        if (Request.getInt("updtself") == 1) {
            return showSuccess("保存成功", "xinsheng_updtself.do");
        }
        return showSuccess("保存成功", Request.get("referer")); // 弹出保存成功，并跳转到前台提交的 referer 页面
    }

    /**
     *  后台详情
     */
    @RequestMapping("/xinsheng_detail")
    public String detail() {
        int id = Request.getInt("id");
        Xinsheng map = service.find(id); // 根据前台url 参数中的id获取行数据
        request.setAttribute("map", map); // 把数据写到前台
        return "xinsheng_detail"; // 详情页面：WebRoot\xinsheng_detail.jsp
    }

    /**
     *  删除
     */
    @RequestMapping("/xinsheng_delete")
    public String delete() {
        if (!checkLogin()) {
            return showError("尚未登录");
        }
        int id = Request.getInt("id"); // 根据id 删除某行数据
        Map map = Query.make("xinsheng").find(id);

        service.delete(id); // 根据id 删除某行数据
        return showSuccess("删除成功", request.getHeader("referer")); //弹出删除成功，并跳回上一页
    }
}
