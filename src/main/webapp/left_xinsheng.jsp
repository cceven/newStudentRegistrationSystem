<%@ page language="java" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="com.spring.util.*" %>
 <%@page import="com.jntoo.db.*" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<li>
    <a href="javascript:;">
        <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
        <span class="menu_title">宿舍分配</span>
    </a>
    <ul>
        <li>
            <a class="submenu" href="sushefenpei_list_xuehao.do" target="main">
                <i class="fa fa-eye"></i>
                宿舍分配查询
            </a>
        </li>
    </ul>
</li>

<li>
    <a href="javascript:;">
        <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
        <span class="menu_title">费用信息</span>
    </a>
    <ul>
        <li>
            <a class="submenu" href="xuefeixinxi_list_xuehao.do" target="main">
                <i class="fa fa-eye"></i>
                学费信息查询
            </a>
        </li>
        <li>
            <a class="submenu" href="sushefeiyong_list_xuehao.do" target="main">
                <i class="fa fa-eye"></i>
                宿舍费用查询
            </a>
        </li>
    </ul>
</li>

<li>
    <a href="javascript:;">
        <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
        <span class="menu_title">调专业申请</span>
    </a>
    <ul>
        <li>
            <a class="submenu" href="diaozhuanye_list_shenqingxuesheng.do" target="main">
                <i class="fa fa-eye"></i>
                调专业申请查询
            </a>
        </li>
        <li>
            <a class="submenu" href="diaozhuanyeshenpi_list_shenqingxuesheng.do" target="main">
                <i class="fa fa-eye"></i>
                调专业审批查询
            </a>
        </li>
    </ul>
</li>

<li>
    <a href="javascript:;">
        <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
        <span class="menu_title">个人中心</span>
    </a>
    <ul>
        <li>
            <a class="submenu" href="xinsheng_updtself.do" target="main">
                <i class="fa fa-eye"></i>
                修改个人资料
            </a>
        </li>
        <li>
            <a class="submenu" href="mod.do" target="main">
                <i class="fa fa-eye"></i>
                修改密码
            </a>
        </li>
    </ul>
</li>
