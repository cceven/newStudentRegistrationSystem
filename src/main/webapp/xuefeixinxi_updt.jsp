<%@ page language="java" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="com.spring.util.*" %>
 <%@page import="com.jntoo.db.*" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="head.jsp" %>

<script src="js/jquery.validate.js"></script>
<script>
    window.searchSelectUrl = "selectUpdateSearch.do";
    window.selectUpdateUrl = "tableAjax.do?a=table";
</script>
<script src="js/selectUpdate.js"></script>

<div style="padding: 10px" class="admin-content">
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">编辑学费信息:</div>
            <div class="panel-body">
                <form action="xuefeixinxiupdate.do" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">学费编号</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入学费编号"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="xuefeibianhao"
                                    name="xuefeibianhao"
                                    value="${Info.html(mmm.xuefeibianhao)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">学生</label>
                            <div class="col-sm-10">
                                <div class="form-inline">
                                    <select
                                        class="form-control"
                                        data-fields="xuehao,xingming,xingbie,xueyuan,zhuanye,banji"
                                        data-value="${Info.html(mmm.xuesheng)}"
                                        id="xuesheng"
                                        name="xuesheng"
                                        onchange="getAjaxData('xinsheng',this,this.value)"
                                    >
                                        <option value="">请选择学生</option>
                                    </select>
                                    关键词：<input type="text" class="form-control" id="xuesheng_keyword" value="" />
                                    <select class="form-control class_xingbie_search62" data-value="" id="xingbie_search" name="xingbie_search">
                                        <option value="">请选择</option>
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </select>
                                    <select class="form-control class_xueyuan_search63" data-value="" id="xueyuan_search" name="xueyuan_search">
                                        <option value="">请选择</option>
                                        <ssm:sql var="select" type="select"> SELECT * FROM xueyuan ORDER BY id desc </ssm:sql>
                                        <c:forEach items="${select}" var="m"
                                            ><c:set var="m" value="${m}" scope="request" />
                                            <option value="${m.id}">${m.xueyuanmingcheng}</option>
                                        </c:forEach>
                                    </select>
                                    <select class="form-control class_zhuanye_search64" data-value="" id="zhuanye_search" name="zhuanye_search">
                                        <option value="">请选择</option>
                                        <ssm:sql var="select" type="select"> SELECT * FROM zhuanye ORDER BY id desc </ssm:sql>
                                        <c:forEach items="${select}" var="m"
                                            ><c:set var="m" value="${m}" scope="request" />
                                            <option value="${m.id}">${m.zhuanyemingcheng}</option>
                                        </c:forEach>
                                    </select>
                                    <select class="form-control class_banji_search65" data-value="" id="banji_search" name="banji_search">
                                        <option value="">请选择</option>
                                        <ssm:sql var="select" type="select"> SELECT * FROM banji ORDER BY id desc </ssm:sql>
                                        <c:forEach items="${select}" var="m"
                                            ><c:set var="m" value="${m}" scope="request" />
                                            <option value="${m.id}">${m.banjimingcheng}</option>
                                        </c:forEach>
                                    </select>
                                    <button type="button" class="btn btn-default" onclick="xuesheng_select_update()">搜索</button>
                                    <script>
                                        function xuesheng_select_update() {
                                            var keyword = $("#xuesheng_keyword").val();
                                            var where = {};
                                            if ($("#xingbie_search").val() != "") where.xingbie = $("#xingbie_search").val();
                                            if ($("#xueyuan_search").val() != "") where.xueyuan = $("#xueyuan_search").val();
                                            if ($("#zhuanye_search").val() != "") where.zhuanye = $("#zhuanye_search").val();
                                            if ($("#banji_search").val() != "") where.banji = $("#banji_search").val();
                                            searchSelect("xuesheng", "xinsheng", keyword, where, "xuehao,xingming,xingbie,xueyuan,zhuanye,banji".split(","), "".split(","));
                                        }
                                        xuesheng_select_update();
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">学号</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control select-update"
                                    placeholder="输入学号"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="xuehao"
                                    name="xuehao"
                                    value="${mmm.xuehao}"
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
                                    class="form-control select-update"
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
                                <select class="form-control select-update" data-value="${Info.html(mmm.xingbie)}" id="xingbie" name="xingbie" style="width: 250px">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                                <script>
                                    $(".class_xingbie66 select-update").val($(".class_xingbie66 select-update").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">学院</label>
                            <div class="col-sm-10">
                                <select class="form-control select-update" data-value="${Info.html(mmm.xueyuan)}" id="xueyuan" name="xueyuan" style="width: 250px">
                                    <ssm:sql var="select" type="select"> SELECT * FROM xueyuan ORDER BY id desc </ssm:sql>
                                    <c:forEach items="${select}" var="m"
                                        ><c:set var="m" value="${m}" scope="request" />
                                        <option value="${m.id}">${m.xueyuanmingcheng}</option>
                                    </c:forEach>
                                </select>
                                <script>
                                    $(".class_xueyuan67 select-update").val($(".class_xueyuan67 select-update").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">专业</label>
                            <div class="col-sm-10">
                                <select class="form-control select-update" data-value="${Info.html(mmm.zhuanye)}" id="zhuanye" name="zhuanye" style="width: 250px">
                                    <ssm:sql var="select" type="select"> SELECT * FROM zhuanye ORDER BY id desc </ssm:sql>
                                    <c:forEach items="${select}" var="m"
                                        ><c:set var="m" value="${m}" scope="request" />
                                        <option value="${m.id}">${m.zhuanyemingcheng}</option>
                                    </c:forEach>
                                </select>
                                <script>
                                    $(".class_zhuanye68 select-update").val($(".class_zhuanye68 select-update").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">班级</label>
                            <div class="col-sm-10">
                                <select class="form-control select-update" data-value="${Info.html(mmm.banji)}" id="banji" name="banji" style="width: 250px">
                                    <ssm:sql var="select" type="select"> SELECT * FROM banji ORDER BY id desc </ssm:sql>
                                    <c:forEach items="${select}" var="m"
                                        ><c:set var="m" value="${m}" scope="request" />
                                        <option value="${m.id}">${m.banjimingcheng}</option>
                                    </c:forEach>
                                </select>
                                <script>
                                    $(".class_banji69 select-update").val($(".class_banji69 select-update").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">学费费用</label>
                            <div class="col-sm-10">
                                <input
                                    type="number"
                                    class="form-control"
                                    placeholder="输入学费费用"
                                    style="width: 150px"
                                    step="0.01"
                                    number="true"
                                    data-msg-number="输入一个有效数字"
                                    id="xuefeifeiyong"
                                    name="xuefeifeiyong"
                                    value="${Info.html(mmm.xuefeifeiyong)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">备注</label>
                            <div class="col-sm-10">
                                <textarea style="width: 80%; height: 120px" class="form-control" placeholder="输入备注" id="beizhu" name="beizhu">
${Info.html(mmm.beizhu)}</textarea
                                >
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">缴费状态</label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_jiaofeizhuangtai70"
                                    data-value="${Info.html(mmm.jiaofeizhuangtai)}"
                                    id="jiaofeizhuangtai"
                                    name="jiaofeizhuangtai"
                                    style="width: 250px"
                                >
                                    <option value="待缴费">待缴费</option>
                                    <option value="已缴费">已缴费</option>
                                </select>
                                <script>
                                    $(".class_jiaofeizhuangtai70").val($(".class_jiaofeizhuangtai70").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">操作人</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入操作人"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="caozuoren"
                                    name="caozuoren"
                                    value="${mmm.caozuoren}"
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

