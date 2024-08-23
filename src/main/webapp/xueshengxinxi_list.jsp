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
                        学号

                        <input type="text" class="form-control" style="" name="xuehao" value="${param.xuehao}" />
                    </div>
                    <div class="form-group">
                        学院

                        <select class="form-control class_xueyuan3" data-value="${param.xueyuan}" id="xueyuan" name="xueyuan">
                            <option value="">请选择</option>
                            <ssm:sql var="select" type="select"> SELECT * FROM xueyuan ORDER BY id desc </ssm:sql>
                            <c:forEach items="${select}" var="m"
                                ><c:set var="m" value="${m}" scope="request" />
                                <option value="${m.id}">${m.xueyuanmingcheng}</option>
                            </c:forEach>
                        </select>
                        <script>
                            $(".class_xueyuan3").val($(".class_xueyuan3").attr("data-value"));
                        </script>
                    </div>
                    <div class="form-group">
                        专业

                        <select class="form-control class_zhuanye4" data-value="${param.zhuanye}" id="zhuanye" name="zhuanye">
                            <option value="">请选择</option>
                            <ssm:sql var="select" type="select"> SELECT * FROM zhuanye ORDER BY id desc </ssm:sql>
                            <c:forEach items="${select}" var="m"
                                ><c:set var="m" value="${m}" scope="request" />
                                <option value="${m.id}">${m.zhuanyemingcheng}</option>
                            </c:forEach>
                        </select>
                        <script>
                            $(".class_zhuanye4").val($(".class_zhuanye4").attr("data-value"));
                        </script>
                    </div>
                    <div class="form-group">
                        班级

                        <select class="form-control class_banji5" data-value="${param.banji}" id="banji" name="banji">
                            <option value="">请选择</option>
                            <ssm:sql var="select" type="select"> SELECT * FROM banji ORDER BY id desc </ssm:sql>
                            <c:forEach items="${select}" var="m"
                                ><c:set var="m" value="${m}" scope="request" />
                                <option value="${m.id}">${m.banjimingcheng}</option>
                            </c:forEach>
                        </select>
                        <script>
                            $(".class_banji5").val($(".class_banji5").attr("data-value"));
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
                            <th>学号</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>学院</th>
                            <th>专业</th>
                            <th>班级</th>
                            <th>联系方式</th>

                            <th>学生简介</th>

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
                                <td>${map.xuehao}</td>
                                <td>${map.xingming}</td>
                                <td>${map.xingbie}</td>
                                <td>
                                    <ssm:sql var="mapxueyuan1" type="find"> SELECT xueyuanmingcheng,id FROM xueyuan where id='${map.xueyuan}' </ssm:sql
                                    >${mapxueyuan1.xueyuanmingcheng}
                                </td>
                                <td>
                                    <ssm:sql var="mapzhuanye2" type="find"> SELECT zhuanyemingcheng,id FROM zhuanye where id='${map.zhuanye}' </ssm:sql
                                    >${mapzhuanye2.zhuanyemingcheng}
                                </td>
                                <td><ssm:sql var="mapbanji3" type="find"> SELECT banjimingcheng,id FROM banji where id='${map.banji}' </ssm:sql>${mapbanji3.banjimingcheng}</td>
                                <td>${map.lianxifangshi}</td>

                                <td>${map.xueshengjianjie}</td>

                                <td align="center">
                                    <a href="xueshengxinxi_detail.do?id=${map.id}">详情</a>

                                    <a href="xueshengxinxi_updt.do?id=${map.id}">编辑</a>

                                    <a href="xueshengxinxi_delete.do?id=${map.id}" onclick="return confirm('确定要删除？')">删除</a>
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

