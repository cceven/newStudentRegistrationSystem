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
            <div class="panel-heading">编辑新生信息:</div>
            <div class="panel-body">
                <form action="xinshengxinxiupdate.do" method="post" name="form1" id="form1">
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
                                    remote="checkno.do?checktype=update&id=${mmm.id}&table=xinshengxinxi&col=yonghuming"
                                    data-msg-remote="内容重复了"
                                    id="yonghuming"
                                    name="yonghuming"
                                    value="${Info.html(mmm.yonghuming)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">姓名</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入姓名"
                                    style="width: 150px"
                                    id="xingming"
                                    name="xingming"
                                    value="${Info.html(mmm.xingming)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">性别</label>
                            <div class="col-sm-10">
                                <select class="form-control class_xingbie7" data-value="${Info.html(mmm.xingbie)}" id="xingbie" name="xingbie" style="width: 250px">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                                <script>
                                    $(".class_xingbie7").val($(".class_xingbie7").attr("data-value"));
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
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">是否新生</label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_shifouxinsheng8"
                                    data-value="${Info.html(mmm.shifouxinsheng)}"
                                    id="shifouxinsheng"
                                    name="shifouxinsheng"
                                    style="width: 250px"
                                >
                                    <option value="待确认">待确认</option>
                                </select>
                                <script>
                                    $(".class_shifouxinsheng8").val($(".class_shifouxinsheng8").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">分配宿舍</label>
                            <div class="col-sm-10">
                                <select class="form-control class_fenpeisushe9" data-value="${Info.html(mmm.fenpeisushe)}" id="fenpeisushe" name="fenpeisushe" style="width: 250px">
                                    <option value="未分配">未分配</option>
                                    <option value="已分配">已分配</option>
                                </select>
                                <script>
                                    $(".class_fenpeisushe9").val($(".class_fenpeisushe9").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">学费缴费</label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_xuefeijiaofei10"
                                    data-value="${Info.html(mmm.xuefeijiaofei)}"
                                    id="xuefeijiaofei"
                                    name="xuefeijiaofei"
                                    style="width: 250px"
                                >
                                    <option value="未缴费">未缴费</option>
                                    <option value="已缴费">已缴费</option>
                                </select>
                                <script>
                                    $(".class_xuefeijiaofei10").val($(".class_xuefeijiaofei10").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">宿舍缴费</label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_sushejiaofei11"
                                    data-value="${Info.html(mmm.sushejiaofei)}"
                                    id="sushejiaofei"
                                    name="sushejiaofei"
                                    style="width: 250px"
                                >
                                    <option value="未缴费">未缴费</option>
                                    <option value="已缴费">已缴费</option>
                                </select>
                                <script>
                                    $(".class_sushejiaofei11").val($(".class_sushejiaofei11").attr("data-value"));
                                </script>
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

