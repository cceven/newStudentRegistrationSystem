<%@ page language="java" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="com.spring.util.*" %>
 <%@page import="com.jntoo.db.*" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<li>
    <a href="javascript:;">
        <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
        <span class="menu_title">学生信息</span>
    </a>
    <ul>
        <li>
            <a class="submenu" href="xueshengxinxi_list_yonghuming.do" target="main">
                <i class="fa fa-eye"></i>
                学生个人信息
            </a>
        </li>
    </ul>
</li>

<li>
    <a href="javascript:;">
        <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
        <span class="menu_title">学费信息</span>
    </a>
    <ul>
        <li>
            <a class="submenu" href="xuefeixinxi_list_yonghuming.do" target="main">
                <i class="fa fa-eye"></i>
                学费信息查询
            </a>
        </li>
    </ul>
</li>

<li>
    <a href="javascript:;">
        <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
        <span class="menu_title">宿舍分配</span>
    </a>
    <ul>
        <li>
            <a class="submenu" href="sushefenpei_list_yonghuming.do" target="main">
                <i class="fa fa-eye"></i>
                宿舍分配查询
            </a>
        </li>
    </ul>
</li>

<li>
    <a href="javascript:;">
        <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
        <span class="menu_title">宿舍费用</span>
    </a>
    <ul>
        <li>
            <a class="submenu" href="sushefeiyong_list_yonghuming.do" target="main">
                <i class="fa fa-eye"></i>
                宿舍费用查询
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
            <a class="submenu" href="mod.do" target="main">
                <i class="fa fa-eye"></i>
                修改密码
            </a>
        </li>
    </ul>
</li>
