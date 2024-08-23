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
            <span class="module-name"> 调专业 </span>
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
                        学号

                        <input type="text" class="form-control" style="" name="xuehao" value="${param.xuehao}" />
                    </div>
                    <div class="form-group">
                        学院

                        <select class="form-control class_xueyuan94" data-value="${param.xueyuan}" id="xueyuan" name="xueyuan">
                            <option value="">请选择</option>
                            <ssm:sql var="select" type="select"> SELECT * FROM xueyuan ORDER BY id desc </ssm:sql>
                            <c:forEach items="${select}" var="m"
                                ><c:set var="m" value="${m}" scope="request" />
                                <option value="${m.id}">${m.xueyuanmingcheng}</option>
                            </c:forEach>
                        </select>
                        <script>
                            $(".class_xueyuan94").val($(".class_xueyuan94").attr("data-value"));
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
                            <th>学号</th>
                            <th>姓名</th>
                            <th>学院 (原院系)</th>
                            <th>专业 (原专业)</th>
                            <th>班级 (原班级)</th>
                            <th>申请编号</th>
                            <th>申请时间</th>
                            <th>调到学院</th>
                            <th>调到专业</th>
                            <th>调到班级</th>
                            <th>申请描述</th>
                            <th>申请学生</th>
                            <th>申请状态</th>
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
                                <td>${map.xuehao}</td>
                                <td>${map.xingming}</td>
                                <td>
                                    <ssm:sql var="mapxueyuan34" type="find"> SELECT xueyuanmingcheng,id FROM xueyuan where id='${map.xueyuan}' </ssm:sql
                                    >${mapxueyuan34.xueyuanmingcheng}
                                </td>
                                <td>
                                    <ssm:sql var="mapzhuanye35" type="find"> SELECT zhuanyemingcheng,id FROM zhuanye where id='${map.zhuanye}' </ssm:sql
                                    >${mapzhuanye35.zhuanyemingcheng}
                                </td>
                                <td><ssm:sql var="mapbanji36" type="find"> SELECT banjimingcheng,id FROM banji where id='${map.banji}' </ssm:sql>${mapbanji36.banjimingcheng}</td>
                                <td>${map.shenqingbianhao}</td>
                                <td>${map.shenqingshijian}</td>
                                <td>
                                    <ssm:sql var="mapxueyuan37" type="find"> SELECT xueyuanmingcheng,id FROM xueyuan where id='${map.diaodaoxueyuan}' </ssm:sql
                                    >${mapxueyuan37.xueyuanmingcheng}
                                </td>
                                <td>
                                    <ssm:sql var="mapzhuanye38" type="find"> SELECT zhuanyemingcheng,id FROM zhuanye where id='${map.diaodaozhuanye}' </ssm:sql
                                    >${mapzhuanye38.zhuanyemingcheng}
                                </td>
                                <td>
                                    <ssm:sql var="mapbanji39" type="find"> SELECT banjimingcheng,id FROM banji where id='${map.diaodaobanji}' </ssm:sql>${mapbanji39.banjimingcheng}
                                </td>
                                <td>${map.shenqingmiaoshu}</td>
                                <td>${map.shenqingxuesheng}</td>
                                <td>${map.shenqingzhuangtai}</td>
                                <td align="center">
                                    <c:choose>
                                        <c:when test="${'待审批' == map.shenqingzhuangtai }">
                                            <a href="diaozhuanyeshenpi_add.do?id=${map.id}">审批</a>
                                        </c:when></c:choose>




                                    <a href="diaozhuanye_detail.do?id=${map.id}">详情</a>

                                    <a href="diaozhuanye_updt.do?id=${map.id}">编辑</a>

                                    <a href="diaozhuanye_delete.do?id=${map.id}" onclick="return confirm('确定要删除？')">删除</a>
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

