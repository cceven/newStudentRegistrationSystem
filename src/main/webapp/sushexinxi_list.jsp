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
            <span class="module-name"> 宿舍信息 </span>
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
                        宿舍号

                        <input type="text" class="form-control" style="" name="sushehao" value="${param.sushehao}" />
                    </div>
                    <div class="form-group">
                        宿舍类型

                        <select
                            class="form-control class_susheleixing23"
                            data-value="${param.susheleixing}"
                            data-rule-required="true"
                            data-msg-required="请填写宿舍类型"
                            id="susheleixing"
                            name="susheleixing"
                        >
                            <option value="">请选择</option>
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                        <script>
                            $(".class_susheleixing23").val($(".class_susheleixing23").attr("data-value"));
                        </script>
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
                            <th>宿舍号</th>
                            <th>宿舍类型</th>
                            <th>宿舍床位</th>
                            <th>已住人数</th>
                            <th>宿舍物品</th>
                            <th width="180" data-field="handler">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="i" value="0" /><c:forEach items="${list}" var="map"
                            ><c:set var="i" value="${i+1}" /><c:set var="map" value="${map}" scope="request" />
                            <tr id="${map.id}" pid="">
                                <td width="30" align="center">
                                    <label> ${i} </label>
                                </td>
                                <td>${map.sushehao}</td>
                                <td>${map.susheleixing}</td>
                                <td>${map.sushechuangwei}</td>
                                <td>${map.yizhurenshu}</td>
                                <td>${map.sushewupin}</td>
                                <td align="center">
                                    <c:choose>
                                        <c:when test="${map.yizhurenshu != map.sushechuangwei }">

                                            <a href="sushefenpei_add.do?id=${map.id}">宿舍分配</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="#">此宿舍已满</a>
                                        </c:otherwise>
                                    </c:choose>


                                    <a href="sushexinxi_detail.do?id=${map.id}">详情</a>

                                    <a href="sushexinxi_updt.do?id=${map.id}">编辑</a>

                                    <a href="sushexinxi_delete.do?id=${map.id}" onclick="return confirm('确定要删除？')">删除</a>
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

