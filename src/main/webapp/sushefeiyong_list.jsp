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
            <span class="module-name"> 宿舍费用 </span>
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
                        费用编号

                        <input type="text" class="form-control" style="" name="feiyongbianhao" value="${param.feiyongbianhao}" />
                    </div>

                    <div class="form-group">
                        学号

                        <input type="text" class="form-control" style="" name="xuehao" value="${param.xuehao}" />
                    </div>

                    <button type="submit" class="btn btn-default">搜索</button>

                    <button type="button" class="btn btn-default" onclick="exportXls()">导出</button>
                    <script>
                        function exportXls() {
                            var param = $("#formSearch").serialize();
                            var url = "sushefeiyong_export.do";
                            url += (url.indexOf("?") == -1 ? "?" : "&") + param;
                            location.href = url;
                        }
                    </script>

                    <!--form标签结束-->
                </form>
            </div>

            <div class="list-table">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                        <tr align="center">
                            <th width="60" data-field="item">序号</th>
                            <th>费用编号</th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>学院</th>
                            <th>专业</th>
                            <th>班级</th>
                            <th>所在宿舍号</th>
                            <th>床位号</th>
                            <th>宿舍费</th>
                            <th>缴费状态</th>
                            <th width="80" data-field="iszf">是否支付</th>
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
                                <td>${map.feiyongbianhao}</td>
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
                                <td>${map.suozaisushehao}</td>
                                <td>${map.chuangweihao}</td>
                                <td>${map.sushefei}</td>
                                <td>${map.jiaofeizhuangtai}</td>
                                <td>
                                    ${map.iszf}
                                    <c:choose>
                                        <c:when test="${'否' == map.iszf }">

                                        </c:when></c:choose
                                    >
                                </td>
                                <td align="center">
                                    <a href="sushefeiyong_detail.do?id=${map.id}">详情</a>

                                    <a href="sushefeiyong_updt.do?id=${map.id}">编辑</a>

                                    <a href="sushefeiyong_delete.do?id=${map.id}" onclick="return confirm('确定要删除？')">删除</a>
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

