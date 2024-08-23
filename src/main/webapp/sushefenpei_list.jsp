<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="com.spring.util.*" %>
<%@page import="com.jntoo.db.*" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="head.jsp" %>

<script src="js/datepicker/WdatePicker.js"></script>

<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name"> 宿舍分配 </span>
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

                        <input type="text" class="form-control" style="" name="sushehao" value="${param.sushehao}"/>
                    </div>
                    <div class="form-group">
                        宿舍类型

                        <select class="form-control class_susheleixing1" data-value="${param.susheleixing}"
                                id="susheleixing" name="susheleixing">
                            <option value="">请选择</option>
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                        <script>
                            $(".class_susheleixing1").val($(".class_susheleixing1").attr("data-value"));
                        </script>
                    </div>

                    <div class="form-group">
                        学号

                        <input type="text" class="form-control" style="" name="xuehao" value="${param.xuehao}"/>
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
                        <th>床位号</th>
                        <th>学号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>学院</th>
                        <th>专业</th>
                        <th>班级</th>
                        <th>分配时间</th>
                        <th width="120" data-field="handler">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="i" value="0"/><c:forEach items="${list}" var="map"
                    ><c:set var="i" value="${i+1}"/><c:set var="map" value="${map}" scope="request"/>
                        <tr id="${map.id}" pid="">
                            <td width="30" align="center">
                                <label> ${i} </label>
                            </td>
                            <td>${map.sushehao}</td>
                            <td>${map.susheleixing}</td>
                            <td>${map.chuangweihao}</td>
                            <td>${map.xuehao}</td>
                            <td>${map.xingming}</td>
                            <td>${map.xingbie}</td>
                            <td>
                                <ssm:sql var="mapxueyuan1"
                                         type="find"> SELECT xueyuanmingcheng,id FROM xueyuan where id='${map.xueyuan}' </ssm:sql
                                >${mapxueyuan1.xueyuanmingcheng}
                            </td>
                            <td>
                                <ssm:sql var="mapzhuanye2"
                                         type="find"> SELECT zhuanyemingcheng,id FROM zhuanye where id='${map.zhuanye}' </ssm:sql
                                >${mapzhuanye2.zhuanyemingcheng}
                            </td>
                            <td><ssm:sql var="mapbanji3"
                                         type="find"> SELECT banjimingcheng,id FROM banji where id='${map.banji}' </ssm:sql>
                                ${mapbanji3.banjimingcheng}</td>
                            <td>${map.fenpeishijian}</td>
                            <td align="center">
                                <a href="sushefenpei_detail.do?id=${map.id}">详情</a>

                                <a href="sushefenpei_updt.do?id=${map.id}">编辑</a>

                                <a href="sushefenpei_delete.do?id=${map.id}" onclick="return confirm('确定要删除？')">删除</a>
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

