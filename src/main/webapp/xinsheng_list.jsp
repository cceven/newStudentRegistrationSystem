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
            <span class="module-name"> 新生 </span>
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

                        <select
                            class="form-control class_xueyuan1"
                            data-value="${param.xueyuan}"
                            data-rule-required="true"
                            data-msg-required="请填写学院"
                            id="xueyuan"
                            name="xueyuan"
                        >
                            <option value="">请选择</option>
                            <ssm:sql var="select" type="select"> SELECT * FROM xueyuan ORDER BY id desc </ssm:sql>
                            <c:forEach items="${select}" var="m"
                                ><c:set var="m" value="${m}" scope="request" />
                                <option value="${m.id}">${m.xueyuanmingcheng}</option>
                            </c:forEach>
                        </select>
                        <script>
                            $(".class_xueyuan1").val($(".class_xueyuan1").attr("data-value"));
                        </script>
                    </div>
                    <div class="form-group">
                        专业

                        <select
                            class="form-control class_zhuanye2"
                            data-value="${param.zhuanye}"
                            data-rule-required="true"
                            data-msg-required="请填写专业"
                            id="zhuanye"
                            name="zhuanye"
                        >
                            <option value="">请选择</option>
                            <ssm:sql var="select" type="select"> SELECT * FROM zhuanye ORDER BY id desc </ssm:sql>
                            <c:forEach items="${select}" var="m"
                                ><c:set var="m" value="${m}" scope="request" />
                                <option value="${m.id}">${m.zhuanyemingcheng}</option>
                            </c:forEach>
                        </select>
                        <script>
                            $(".class_zhuanye2").val($(".class_zhuanye2").attr("data-value"));
                        </script>
                    </div>
                    <div class="form-group">
                        班级

                        <select class="form-control class_banji3" data-value="${param.banji}" data-rule-required="true" data-msg-required="请填写班级" id="banji" name="banji">
                            <option value="">请选择</option>
                            <ssm:sql var="select" type="select"> SELECT * FROM banji ORDER BY id desc </ssm:sql>
                            <c:forEach items="${select}" var="m"
                                ><c:set var="m" value="${m}" scope="request" />
                                <option value="${m.id}">${m.banjimingcheng}</option>
                            </c:forEach>
                        </select>
                        <script>
                            $(".class_banji3").val($(".class_banji3").attr("data-value"));
                        </script>
                    </div>

                    <button type="submit" class="btn btn-default">搜索</button>

                    <button type="button" class="btn btn-default" onclick="exportXls()">导出</button>
                    <script>
                        function exportXls() {
                            var param = $("#formSearch").serialize();
                            var url = "xinsheng_export.do";
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
                            <th>学号</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>生源地</th>
                            <th>学院</th>
                            <th>专业</th>
                            <th>班级</th>
                            <th>联系方式</th>
                            <th>学生简介</th>
                            <th>所在宿舍号</th>
                            <th>床位号</th>
                            <th>是否已缴学费</th>
                            <th>宿舍缴费</th>
                            <th width="80" data-field="issh">注册状态</th>
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
                                <td>${map.xingbie}</td>
                                <td>${map.shengyuandi}</td>
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
                                <td>${map.suozaisushehao}</td>
                                <td>${map.chuangweihao}</td>
                                <td>${map.shifouyijiaoxuefei}</td>
                                <td>${map.sushejiaofei}</td>
                                <td>
                                    ${map.issh}
                                    <a href="sh.do?id=${map.id}&yuan=${map.issh}&tablename=xinsheng">
                                        <c:choose> <c:when test="${map.issh == '是' }">  </c:when><c:otherwise> 注册 </c:otherwise></c:choose>
                                    </a>
                                </td>
                                <td align="center">


                                    <a href="xinsheng_detail.do?id=${map.id}">详情</a>

                                    <a href="xinsheng_updt.do?id=${map.id}">编辑</a>

                                    <a href="xinsheng_delete.do?id=${map.id}" onclick="return confirm('确定要删除？')">删除</a>
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

