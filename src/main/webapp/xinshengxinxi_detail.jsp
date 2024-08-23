<%@ page language="java" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="com.spring.util.*" %>
 <%@page import="com.jntoo.db.*" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">新生信息详情</div>
        <div class="panel-body">
            <div class="admin-detail clearfix">
                <div class="detail detail-text">
                    <div class="detail-title">用户名：</div>
                    <div class="detail-content">${map.yonghuming}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">姓名：</div>
                    <div class="detail-content">${map.xingming}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">联系方式：</div>
                    <div class="detail-content">${map.lianxifangshi}</div>
                </div>
                <div class="detail detail-password">
                    <div class="detail-title">密码：</div>
                    <div class="detail-content">${map.mima}</div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">性别：</div>
                    <div class="detail-content">${map.xingbie}</div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">是否新生：</div>
                    <div class="detail-content">${map.shifouxinsheng}</div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">分配宿舍：</div>
                    <div class="detail-content">${map.fenpeisushe}</div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">学费缴费：</div>
                    <div class="detail-content">${map.xuefeijiaofei}</div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">宿舍缴费：</div>
                    <div class="detail-content">${map.sushejiaofei}</div>
                </div>
            </div>

            <div class="button-list mt10">
                <div class="">
                    <button type="button" class="btn btn-default" onclick="history.go(-1);">返回</button>
                    <button type="button" class="btn btn-default" onclick="window.print()">打印本页</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>

