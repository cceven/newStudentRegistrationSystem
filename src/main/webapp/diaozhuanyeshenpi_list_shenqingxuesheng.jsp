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
            <span class="module-name"> 调专业审批 </span>
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
                        审批

                        <select
                            class="form-control class_shenpi122"
                            data-value="${param.shenpi}"
                            data-rule-required="true"
                            data-msg-required="请填写审批"
                            id="shenpi"
                            name="shenpi"
                        >
                            <option value="">请选择</option>
                            <option value="通过">通过</option>
                            <option value="未通过">未通过</option>
                        </select>
                        <script>
                            $(".class_shenpi122").val($(".class_shenpi122").attr("data-value"));
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

                            <th>申请时间</th>
                            <th>调到学院</th>
                            <th>调到专业</th>
                            <th>调到班级</th>
                            <th>申请描述</th>
                            <th>申请学生</th>
                            <th>审批</th>
                            <th>审批备注</th>
                            <th>操作人</th>
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
                                <td>${map.xuehao}</td>
                                <td>${map.xingming}</td>
                                <td>
                                    <ssm:sql var="mapxueyuan64" type="find"> SELECT xueyuanmingcheng,id FROM xueyuan where id='${map.xueyuan}' </ssm:sql
                                    >${mapxueyuan64.xueyuanmingcheng}
                                </td>
                                <td>
                                    <ssm:sql var="mapzhuanye65" type="find"> SELECT zhuanyemingcheng,id FROM zhuanye where id='${map.zhuanye}' </ssm:sql
                                    >${mapzhuanye65.zhuanyemingcheng}
                                </td>
                                <td><ssm:sql var="mapbanji66" type="find"> SELECT banjimingcheng,id FROM banji where id='${map.banji}' </ssm:sql>${mapbanji66.banjimingcheng}</td>

                                <td>${map.shenqingshijian}</td>
                                <td>
                                    <ssm:sql var="mapxueyuan67" type="find"> SELECT xueyuanmingcheng,id FROM xueyuan where id='${map.diaodaoxueyuan}' </ssm:sql
                                    >${mapxueyuan67.xueyuanmingcheng}
                                </td>
                                <td>
                                    <ssm:sql var="mapzhuanye68" type="find"> SELECT zhuanyemingcheng,id FROM zhuanye where id='${map.diaodaozhuanye}' </ssm:sql
                                    >${mapzhuanye68.zhuanyemingcheng}
                                </td>
                                <td>
                                    <ssm:sql var="mapbanji69" type="find"> SELECT banjimingcheng,id FROM banji where id='${map.diaodaobanji}' </ssm:sql>${mapbanji69.banjimingcheng}
                                </td>
                                <td>${map.shenqingmiaoshu}</td>
                                <td>${map.shenqingxuesheng}</td>
                                <td>${map.shenpi}</td>
                                <td>${map.shenpibeizhu}</td>
                                <td>${map.caozuoren}</td>
                                <td align="center">
                                    <a href="diaozhuanyeshenpi_detail.do?id=${map.id}">详情</a>


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

