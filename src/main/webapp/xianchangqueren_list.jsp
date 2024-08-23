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
            <span class="module-name"> 现场确认 </span>
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
                    <div class="form-group">
                        是否新生

                        <select
                            class="form-control class_shifouxinsheng38"
                            data-value="${param.shifouxinsheng}"
                            data-rule-required="true"
                            data-msg-required="请填写是否新生"
                            id="shifouxinsheng"
                            name="shifouxinsheng"
                        >
                            <option value="">请选择</option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                        <script>
                            $(".class_shifouxinsheng38").val($(".class_shifouxinsheng38").attr("data-value"));
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
                            <th>用户名</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>联系方式</th>
                            <th>是否新生</th>
                            <th>备注</th>
                            <th>操作人</th>
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
                                <td>${map.beizhu}</td>
                                <td>${map.caozuoren}</td>
                                <td align="center">
                                    <a href="xianchangqueren_detail.do?id=${map.id}">详情</a>

                                    <a href="xianchangqueren_updt.do?id=${map.id}">编辑</a>

                                    <a href="xianchangqueren_delete.do?id=${map.id}" onclick="return confirm('确定要删除？')">删除</a>
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

