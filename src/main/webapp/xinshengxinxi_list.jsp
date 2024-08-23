<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="com.spring.util.*" %>
<%@page import="com.jntoo.db.*" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> 新生信息 </span>
            <span>列表</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" id="formSearch" action="?">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <i class="glyphicon glyphicon-search"></i>
                    </div>

                    <div class="form-group">
                        用户名

                        <input type="text" class="form-control" style="" name="yonghuming" value="${param.yonghuming}" />
                    </div>

                    <button type="submit" class="btn btn-default">搜索</button>

                    <!--form标签结束-->
                </form>
            </div>

            <div class="list-table">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                    <tr align="center">
                        <th width="60" data-field="item">序号</th>
                        <th>用户名</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>联系方式</th>
                        <th>是否新生</th>
                        <th width="220" data-field="handler">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="i" value="0" /><c:forEach items="${list}" var="map"
                    ><c:set var="i" value="${i+1}" /><c:set var="map" value="${map}" scope="request" />
                        <tr id="${map.id}" pid="">
                            <td width="30" align="center">
                                <label> ${i} </label>
                            </td>
                            <td>${map.yonghuming}</td>
                            <td>${map.xingming}</td>
                            <td>${map.xingbie}</td>
                            <td>${map.lianxifangshi}</td>
                            <td>${map.shifouxinsheng}</td>
                            <td align="center">
                                <c:choose>
                                    <c:when test="${'待确认' == map.shifouxinsheng }">

                                        <a href="xianchangqueren_add.do?id=${map.id}">现场确认</a>
                                    </c:when></c:choose>

                                <c:choose>
                                    <c:when test="${'是' == map.shifouxinsheng }">
                                        <c:choose>
                                            <c:when test="${Query.make('xueshengxinxi').where('xinshengxinxiid' , map.id).count() == 0}">
                                                <a href="xueshengxinxi_add.do?id=${map.id}">学生信息</a>
                                            </c:when>

                                        </c:choose>


                                    </c:when></c:choose>







                                <a href="xinshengxinxi_detail.do?id=${map.id}">详情</a>

                                <a href="xinshengxinxi_updt.do?id=${map.id}">编辑</a>

                                <a href="xinshengxinxi_delete.do?id=${map.id}" onclick="return confirm('确定要删除？')">删除</a>
                                <!--qiatnalijne-->
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <%@include file="/page.jsp" %>

        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>

