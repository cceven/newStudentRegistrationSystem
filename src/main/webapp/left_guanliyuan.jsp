<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="com.spring.util.*" %>
<%@page import="com.jntoo.db.*" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<li>
    <a href="javascript:;">
        <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
        <span class="menu_title">账号管理</span>
    </a>
    <ul>
        <li>
            <a class="submenu" href="admins_list.do" target="main">
                <i class="fa fa-eye"></i>
                管理员账号管理
            </a>
        </li>
        <li>
            <a class="submenu" href="admins_add.do" target="main">
                <i class="fa fa-eye"></i>
                管理员账号添加
            </a>
        </li>
        <li>
            <a class="submenu" href="mod.do" target="main">
                <i class="fa fa-eye"></i>
                密码修改
            </a>
        </li>
    </ul>
</li>

<li>
    <a href="javascript:;">
        <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
        <span class="menu_title">学院管理</span>
    </a>
    <ul>
        <li>
            <a class="submenu" href="xueyuan_add.do" target="main">
                <i class="fa fa-eye"></i>
                学院添加
            </a>
        </li>
        <li>
            <a class="submenu" href="xueyuan_list.do" target="main">
                <i class="fa fa-eye"></i>
                学院查询
            </a>
        </li>
    </ul>
</li>

<li>
    <a href="javascript:;">
        <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
        <span class="menu_title">专业管理</span>
    </a>
    <ul>
        <li>
            <a class="submenu" href="zhuanye_add.do" target="main">
                <i class="fa fa-eye"></i>
                专业添加
            </a>
        </li>
        <li>
            <a class="submenu" href="zhuanye_list.do" target="main">
                <i class="fa fa-eye"></i>
                专业查询
            </a>
        </li>
    </ul>
</li>

<li>
    <a href="javascript:;">
        <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
        <span class="menu_title">班级管理</span>
    </a>
    <ul>
        <li>
            <a class="submenu" href="banji_add.do" target="main">
                <i class="fa fa-eye"></i>
                班级添加
            </a>
        </li>
        <li>
            <a class="submenu" href="banji_list.do" target="main">
                <i class="fa fa-eye"></i>
                班级查询
            </a>
        </li>
    </ul>
</li>

<li>
    <a href="javascript:;">
        <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
        <span class="menu_title">新生信息管理</span>
    </a>
    <ul>
        <li>
            <a class="submenu" href="xinsheng_add.do" target="main">
                <i class="fa fa-eye"></i>
                新生信息添加
            </a>
        </li>
        <li>
            <a class="submenu" href="xinsheng_list.do" target="main">
                <i class="fa fa-eye"></i>
                新生信息查询
            </a>
        </li>
        <li>
            <a class="submenu" href="xinsheng_import.do" target="main">
                <i class="fa fa-eye"></i>
                批量导入
            </a>
        </li>
    </ul>
</li>

<li>
    <a href="javascript:;">
        <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
        <span class="menu_title">宿舍信息管理</span>
    </a>
    <ul>
        <li>
            <a class="submenu" href="sushexinxi_add.do" target="main">
                <i class="fa fa-eye"></i>
                宿舍信息添加
            </a>
        </li>
        <li>
            <a class="submenu" href="sushexinxi_list.do" target="main">
                <i class="fa fa-eye"></i>
                宿舍信息查询
            </a>
        </li>
    </ul>
</li>

<li>
    <a href="javascript:;">
        <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
        <span class="menu_title">宿舍分配管理</span>
    </a>
    <ul>
        <li>
            <a class="submenu" href="sushefenpei_list.do" target="main">
                <i class="fa fa-eye"></i>
                宿舍分配查询
            </a>
        </li>
    </ul>
</li>

<li>
    <a href="javascript:;">
        <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
        <span class="menu_title">学费信息管理</span>
    </a>
    <ul>
        <li>
            <a class="submenu" href="xuefeixinxi_add.do" target="main">
                <i class="fa fa-eye"></i>
                学费信息添加
            </a>
        </li>
        <li>
            <a class="submenu" href="xuefeixinxi_list.do" target="main">
                <i class="fa fa-eye"></i>
                学费信息查询
            </a>
        </li>
    </ul>
</li>

<li>
    <a href="javascript:;">
        <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
        <span class="menu_title">宿舍费用管理</span>
    </a>
    <ul>
        <li>
            <a class="submenu" href="sushefeiyong_add.do" target="main">
                <i class="fa fa-eye"></i>
                宿舍费用添加
            </a>
        </li>
        <li>
            <a class="submenu" href="sushefeiyong_list.do" target="main">
                <i class="fa fa-eye"></i>
                宿舍费用查询
            </a>
        </li>
    </ul>
</li>

<li>
    <a href="javascript:;">
        <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
        <span class="menu_title">调专业申请管理</span>
    </a>
    <ul>
        <li>
            <a class="submenu" href="diaozhuanye_list.do" target="main">
                <i class="fa fa-eye"></i>
                调专业查询
            </a>
        </li>
        <li>
            <a class="submenu" href="diaozhuanyeshenpi_list.do" target="main">
                <i class="fa fa-eye"></i>
                调专业审批查询
            </a>
        </li>
    </ul>
</li>
