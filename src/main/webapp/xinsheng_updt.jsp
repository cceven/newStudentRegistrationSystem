<%@ page language="java" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="com.spring.util.*" %>
 <%@page import="com.jntoo.db.*" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="head.jsp" %>

<script src="js/jquery.validate.js"></script>

<div style="padding: 10px" class="admin-content">
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">编辑新生:</div>
            <div class="panel-body">
                <form action="xinshengupdate.do" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">学号<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入学号"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写学号"
                                    remote="checkno.do?checktype=update&id=${mmm.id}&table=xinsheng&col=xuehao"
                                    data-msg-remote="内容重复了"
                                    id="xuehao"
                                    name="xuehao"
                                    value="${Info.html(mmm.xuehao)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">姓名<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入姓名"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写姓名"
                                    id="xingming"
                                    name="xingming"
                                    value="${Info.html(mmm.xingming)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">性别<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_xingbie19"
                                    data-value="${Info.html(mmm.xingbie)}"
                                    data-rule-required="true"
                                    data-msg-required="请填写性别"
                                    id="xingbie"
                                    name="xingbie"
                                    style="width: 250px"
                                >
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                                <script>
                                    $(".class_xingbie19").val($(".class_xingbie19").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">生源地<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入生源地"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写生源地"
                                    id="shengyuandi"
                                    name="shengyuandi"
                                    value="${Info.html(mmm.shengyuandi)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">学院<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_xueyuan20"
                                    data-value="${Info.html(mmm.xueyuan)}"
                                    data-rule-required="true"
                                    data-msg-required="请填写学院"
                                    id="xueyuan"
                                    name="xueyuan"
                                    style="width: 250px"
                                >
                                    <ssm:sql var="select" type="select"> SELECT * FROM xueyuan ORDER BY id desc </ssm:sql>
                                    <c:forEach items="${select}" var="m"
                                        ><c:set var="m" value="${m}" scope="request" />
                                        <option value="${m.id}">${m.xueyuanmingcheng}</option>
                                    </c:forEach>
                                </select>
                                <script>
                                    $(".class_xueyuan20").val($(".class_xueyuan20").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">专业<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_zhuanye21"
                                    data-value="${Info.html(mmm.zhuanye)}"
                                    data-rule-required="true"
                                    data-msg-required="请填写专业"
                                    id="zhuanye"
                                    name="zhuanye"
                                    style="width: 250px"
                                >
                                    <ssm:sql var="select" type="select"> SELECT * FROM zhuanye ORDER BY id desc </ssm:sql>
                                    <c:forEach items="${select}" var="m"
                                        ><c:set var="m" value="${m}" scope="request" />
                                        <option value="${m.id}">${m.zhuanyemingcheng}</option>
                                    </c:forEach>
                                </select>
                                <script>
                                    $(".class_zhuanye21").val($(".class_zhuanye21").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">班级<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_banji22"
                                    data-value="${Info.html(mmm.banji)}"
                                    data-rule-required="true"
                                    data-msg-required="请填写班级"
                                    id="banji"
                                    name="banji"
                                    style="width: 250px"
                                >
                                    <ssm:sql var="select" type="select"> SELECT * FROM banji ORDER BY id desc </ssm:sql>
                                    <c:forEach items="${select}" var="m"
                                        ><c:set var="m" value="${m}" scope="request" />
                                        <option value="${m.id}">${m.banjimingcheng}</option>
                                    </c:forEach>
                                </select>
                                <script>
                                    $(".class_banji22").val($(".class_banji22").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">联系方式</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入联系方式"
                                    style="width: 150px"
                                    id="lianxifangshi"
                                    name="lianxifangshi"
                                    value="${Info.html(mmm.lianxifangshi)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">学生简介</label>
                            <div class="col-sm-10">
                                <textarea style="width: 80%; height: 120px" class="form-control" placeholder="输入学生简介" id="xueshengjianjie" name="xueshengjianjie">
${Info.html(mmm.xueshengjianjie)}</textarea
                                >
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">所在宿舍号</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入所在宿舍号"
                                    style="width: 150px"
                                    id="suozaisushehao"
                                    name="suozaisushehao"
                                    value="${Info.html(mmm.suozaisushehao)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">床位号</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入床位号"
                                    style="width: 150px"
                                    id="chuangweihao"
                                    name="chuangweihao"
                                    value="${Info.html(mmm.chuangweihao)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
                                <input name="id" value="${mmm.id}" type="hidden" />
                                <input name="referer" value="<%=request.getHeader("referer") %>" type="hidden" />
                                <input name="updtself" value="${updtself}" type="hidden" />

                                <button type="submit" class="btn btn-primary" name="Submit">提交</button>
                                <button type="reset" class="btn btn-default" name="Submit2">重置</button>
                            </div>
                        </div>
                    </div>

                    <!--form标签结束-->
                </form>
            </div>
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>

    <script>
        $(function () {
            $("#form1").validate();
        });
    </script>
</div>
<%@ include file="foot.jsp" %>

