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
            <div class="panel-heading">添加新生信息:</div>
            <div class="panel-body">
                <form action="xinshengxinxiinsert.do" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">用户名<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入用户名"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写用户名"
                                    remote="checkno.do?checktype=insert&table=xinshengxinxi&col=yonghuming"
                                    data-msg-remote="内容重复了"
                                    id="yonghuming"
                                    name="yonghuming"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">密码<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="password"
                                    class="form-control"
                                    placeholder="输入密码"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写密码"
                                    id="mima"
                                    name="mima"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="输入姓名" style="width: 150px" id="xingming" name="xingming" value="" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">性别</label>
                            <div class="col-sm-10">
                                <select class="form-control class_xingbie1" data-value="" id="xingbie" name="xingbie" style="width: 250px">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">联系方式</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="输入联系方式" style="width: 150px" id="lianxifangshi" name="lianxifangshi" value="" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
                                <input type="hidden" name="shifouxinsheng" id="shifouxinsheng" value="待确认" />
                                <input type="hidden" name="fenpeisushe" id="fenpeisushe" value="未分配" />
                                <input type="hidden" name="xuefeijiaofei" id="xuefeijiaofei" value="未缴费" />
                                <input type="hidden" name="sushejiaofei" id="sushejiaofei" value="未缴费" />
                                <input name="referer" value="login.do" type="hidden"/>
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

