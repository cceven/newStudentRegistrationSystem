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
<script src="js/datepicker/WdatePicker.js"></script>

<div style="padding: 10px" class="admin-content">
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">添加宿舍分配:</div>
            <div class="panel-body">
                <form action="sushefenpeiinsert.do" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <input type="hidden" name="sushexinxiid" value="${param.id}" />
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">宿舍号</label>
                            <div class="col-sm-10">${readMap.sushehao}<input type="hidden" id="sushehao" name="sushehao" value="${Info.html(readMap.sushehao)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">宿舍类型</label>
                            <div class="col-sm-10">
                                ${readMap.susheleixing}<input type="hidden" id="susheleixing" name="susheleixing" value="${Info.html(readMap.susheleixing)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">床位号<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入床位号"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写床位号"
                                    remote="checkno.do?checktype=insert&table=sushefenpei&col=chuangweihao"
                                    data-msg-remote="内容重复了"
                                    id="chuangweihao"
                                    name="chuangweihao"
                                    value=""
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
                                        id="xuesheng"
                                        name="xuesheng"
                                        onchange="getAjaxData('xinsheng',this,this.value)"
                                    >
                                        <option value="">请选择学生</option>
                                    </select>
                                    关键词：<input type="text" class="form-control" id="xuesheng_keyword" value="" />
                                    <select class="form-control class_xingbie_search9" data-value="" id="xingbie_search" name="xingbie_search">
                                        <option value="">请选择</option>
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </select>
                                    <select class="form-control class_xueyuan_search10" data-value="" id="xueyuan_search" name="xueyuan_search">
                                        <option value="">请选择</option>
                                        <ssm:sql var="select" type="select"> SELECT * FROM xueyuan ORDER BY id desc </ssm:sql>
                                        <c:forEach items="${select}" var="m"
                                            ><c:set var="m" value="${m}" scope="request" />
                                            <option value="${m.id}">${m.xueyuanmingcheng}</option>
                                        </c:forEach>
                                    </select>
                                    <select class="form-control class_zhuanye_search11" data-value="" id="zhuanye_search" name="zhuanye_search">
                                        <option value="">请选择</option>
                                        <ssm:sql var="select" type="select"> SELECT * FROM zhuanye ORDER BY id desc </ssm:sql>
                                        <c:forEach items="${select}" var="m"
                                            ><c:set var="m" value="${m}" scope="request" />
                                            <option value="${m.id}">${m.zhuanyemingcheng}</option>
                                        </c:forEach>
                                    </select>
                                    <select class="form-control class_banji_search12" data-value="" id="banji_search" name="banji_search">
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
                                    value="${sessionScope.username}"
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
                                    value="${sessionScope.xingming}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">性别</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control select-update"
                                    placeholder="输入性别"
                                    style="width: 150px"
                                    id="xingbie"
                                    name="xingbie"
                                    value="${sessionScope.xingbie}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">学院</label>
                            <div class="col-sm-10">
                                <select class="form-control select-update" data-value="" id="xueyuan" name="xueyuan" style="width: 250px">
                                    <ssm:sql var="select" type="select"> SELECT * FROM xueyuan ORDER BY id desc </ssm:sql>
                                    <c:forEach items="${select}" var="m"
                                        ><c:set var="m" value="${m}" scope="request" />
                                        <option value="${m.id}">${m.xueyuanmingcheng}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">专业</label>
                            <div class="col-sm-10">
                                <select class="form-control select-update" data-value="" id="zhuanye" name="zhuanye" style="width: 250px">
                                    <ssm:sql var="select" type="select"> SELECT * FROM zhuanye ORDER BY id desc </ssm:sql>
                                    <c:forEach items="${select}" var="m"
                                        ><c:set var="m" value="${m}" scope="request" />
                                        <option value="${m.id}">${m.zhuanyemingcheng}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">班级</label>
                            <div class="col-sm-10">
                                <select class="form-control select-update" data-value="" id="banji" name="banji" style="width: 250px">
                                    <ssm:sql var="select" type="select"> SELECT * FROM banji ORDER BY id desc </ssm:sql>
                                    <c:forEach items="${select}" var="m"
                                        ><c:set var="m" value="${m}" scope="request" />
                                        <option value="${m.id}">${m.banjimingcheng}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">分配时间<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})"
                                    style="width: 200px"
                                    data-rule-required="true"
                                    data-msg-required="请填写分配时间"
                                    id="fenpeishijian"
                                    name="fenpeishijian"
                                    readonly="readonly"
                                    value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
                                <input name="referer" id="referers" class="referers" value="<%=request.getHeader("referer") %>" type="hidden" />
                                <script>
                                    $(function () {
                                        $("input.referers").val(document.referrer);
                                    });
                                </script>

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

