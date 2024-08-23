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
            <div class="panel-heading">添加学费信息:</div>
            <div class="panel-body">
                <form action="xuefeixinxiinsert.do" method="post" name="form1" id="form1">
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
                                        value="${Info.getID()}"
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



                                    <script>
                                        function xuesheng_select_update() {
                                            var keyword = $("#xuesheng_keyword").val();
                                            var where = {};
                                            where.shifouyijiaoxuefei='否'
                                            where.issh='是'
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
                                <input type="text" class="form-control select-update" placeholder="输入姓名"
                                       style="width: 150px" id="xingming" name="xingming" value=""/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">性别</label>
                            <div class="col-sm-10">
                                <select class="form-control select-update" data-value="" id="xingbie" name="xingbie"
                                        style="width: 250px">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">学院</label>
                            <div class="col-sm-10">
                                <select class="form-control select-update" data-value="" id="xueyuan" name="xueyuan"
                                        style="width: 250px">
                                    <ssm:sql var="select"
                                             type="select"> SELECT * FROM xueyuan ORDER BY id desc </ssm:sql>
                                    <c:forEach items="${select}" var="m"
                                    ><c:set var="m" value="${m}" scope="request"/>
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
                                <select class="form-control select-update" data-value="" id="zhuanye" name="zhuanye"
                                        style="width: 250px">
                                    <ssm:sql var="select"
                                             type="select"> SELECT * FROM zhuanye ORDER BY id desc </ssm:sql>
                                    <c:forEach items="${select}" var="m"
                                    ><c:set var="m" value="${m}" scope="request"/>
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
                                <select class="form-control select-update" data-value="" id="banji" name="banji"
                                        style="width: 250px">
                                    <ssm:sql var="select" type="select"> SELECT * FROM banji ORDER BY id desc </ssm:sql>
                                    <c:forEach items="${select}" var="m"
                                    ><c:set var="m" value="${m}" scope="request"/>
                                        <option value="${m.id}">${m.banjimingcheng}</option>
                                    </c:forEach>
                                </select>
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
                                        value=""
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">备注</label>
                            <div class="col-sm-10">
                                <textarea style="width: 80%; height: 120px" class="form-control" placeholder="输入备注"
                                          id="beizhu" name="beizhu"></textarea>
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
                                        value="${sessionScope.username}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
                                <input type="hidden" name="jiaofeizhuangtai" id="jiaofeizhuangtai" value="待缴费"/>
                                <input type="hidden" name="iszf" value="否"/>

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

