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
            <div class="panel-heading">添加调专业:</div>
            <div class="panel-body">
                <form action="diaozhuanyeinsert.do" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <input type="hidden" name="xinshengid" value="${param.id}" />
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">学号</label>
                            <div class="col-sm-10">${readMap.xuehao}<input type="hidden" id="xuehao" name="xuehao" value="${Info.html(readMap.xuehao)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">姓名</label>
                            <div class="col-sm-10">${readMap.xingming}<input type="hidden" id="xingming" name="xingming" value="${Info.html(readMap.xingming)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">学院(原院系)</label>
                            <div class="col-sm-10">
                                <ssm:sql var="mapxueyuan52" type="find"> SELECT xueyuanmingcheng,id FROM xueyuan where id='${readMap.xueyuan}' </ssm:sql
                                >${mapxueyuan52.xueyuanmingcheng}<input type="hidden" id="xueyuan" name="xueyuan" value="${Info.html(readMap.xueyuan)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">专业(原专业)</label>
                            <div class="col-sm-10">
                                <ssm:sql var="mapzhuanye53" type="find"> SELECT zhuanyemingcheng,id FROM zhuanye where id='${readMap.zhuanye}' </ssm:sql
                                >${mapzhuanye53.zhuanyemingcheng}<input type="hidden" id="zhuanye" name="zhuanye" value="${Info.html(readMap.zhuanye)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">班级(原班级)</label>
                            <div class="col-sm-10">
                                <ssm:sql var="mapbanji54" type="find"> SELECT banjimingcheng,id FROM banji where id='${readMap.banji}' </ssm:sql>${mapbanji54.banjimingcheng}<input
                                    type="hidden"
                                    id="banji"
                                    name="banji"
                                    value="${Info.html(readMap.banji)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">申请编号</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入申请编号"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="shenqingbianhao"
                                    name="shenqingbianhao"
                                    value="${Info.getID()}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">申请时间</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入申请时间"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="shenqingshijian"
                                    name="shenqingshijian"
                                    value="${Info.getID()}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">调到学院<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_diaodaoxueyuan104"
                                    data-value=""
                                    data-rule-required="true"
                                    data-msg-required="请填写调到学院"
                                    id="diaodaoxueyuan"
                                    name="diaodaoxueyuan"
                                    style="width: 250px"
                                >
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
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">调到专业<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_diaodaozhuanye105"
                                    data-value=""
                                    data-rule-required="true"
                                    data-msg-required="请填写调到专业"
                                    id="diaodaozhuanye"
                                    name="diaodaozhuanye"
                                    style="width: 250px"
                                >
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
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">调到班级<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_diaodaobanji106"
                                    data-value=""
                                    data-rule-required="true"
                                    data-msg-required="请填写调到班级"
                                    id="diaodaobanji"
                                    name="diaodaobanji"
                                    style="width: 250px"
                                >
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
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">申请描述<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <textarea
                                    style="width: 80%; height: 120px"
                                    class="form-control"
                                    placeholder="输入申请描述"
                                    data-rule-required="true"
                                    data-msg-required="请填写申请描述"
                                    id="shenqingmiaoshu"
                                    name="shenqingmiaoshu"
                                ></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">申请学生</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入申请学生"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="shenqingxuesheng"
                                    name="shenqingxuesheng"
                                    value="${sessionScope.username}"
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

                                <input type="hidden" name="shenqingzhuangtai" id="shenqingzhuangtai" value="待审批" />

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

