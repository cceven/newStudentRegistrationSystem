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
            <span class="module-name"> 学生信息 </span>
            <span>列表</span>
        </div>
        <div class="panel-body">


            <div class="list-table">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                        <tr align="center">
                            <th width="60" data-field="item">序号</th>
                            <th>用户名</th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>学院</th>
                            <th>专业</th>
                            <th>班级</th>
                            <th>联系方式</th>
                            <th>所在宿舍号</th>
                            <th>学生简介</th>
                            <th>是否已缴学费</th>
                            <th width="120" data-field="handler">操作</th>
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
                                <td>${map.xuehao}</td>
                                <td>${map.xingming}</td>
                                <td>${map.xingbie}</td>
                                <td>
                                    <ssm:sql var="mapxueyuan4" type="find"> SELECT xueyuanmingcheng,id FROM xueyuan where id='${map.xueyuan}' </ssm:sql
                                    >${mapxueyuan4.xueyuanmingcheng}
                                </td>
                                <td>
                                    <ssm:sql var="mapzhuanye5" type="find"> SELECT zhuanyemingcheng,id FROM zhuanye where id='${map.zhuanye}' </ssm:sql
                                    >${mapzhuanye5.zhuanyemingcheng}
                                </td>
                                <td><ssm:sql var="mapbanji6" type="find"> SELECT banjimingcheng,id FROM banji where id='${map.banji}' </ssm:sql>${mapbanji6.banjimingcheng}</td>
                                <td>${map.lianxifangshi}</td>
                                <td>${map.suozaisushehao}</td>
                                <td>${map.xueshengjianjie}</td>
                                <td>${map.shifouyijiaoxuefei}</td>
                                <td align="center">
                                    <a href="xueshengxinxi_detail.do?id=${map.id}">详情</a>


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

