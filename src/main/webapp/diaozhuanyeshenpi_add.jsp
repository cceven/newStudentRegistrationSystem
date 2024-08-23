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
            <div class="panel-heading">添加调专业审批:</div>
            <div class="panel-body">
                <form action="diaozhuanyeshenpiinsert.do" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <input type="hidden" name="diaozhuanyeid" value="${param.id}" />
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
                                <ssm:sql var="mapxueyuan76" type="find"> SELECT xueyuanmingcheng,id FROM xueyuan where id='${readMap.xueyuan}' </ssm:sql
                                >${mapxueyuan76.xueyuanmingcheng}<input type="hidden" id="xueyuan" name="xueyuan" value="${Info.html(readMap.xueyuan)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">专业(原专业)</label>
                            <div class="col-sm-10">
                                <ssm:sql var="mapzhuanye77" type="find"> SELECT zhuanyemingcheng,id FROM zhuanye where id='${readMap.zhuanye}' </ssm:sql
                                >${mapzhuanye77.zhuanyemingcheng}<input type="hidden" id="zhuanye" name="zhuanye" value="${Info.html(readMap.zhuanye)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">班级(原班级)</label>
                            <div class="col-sm-10">
                                <ssm:sql var="mapbanji78" type="find"> SELECT banjimingcheng,id FROM banji where id='${readMap.banji}' </ssm:sql>${mapbanji78.banjimingcheng}<input
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
                                ${readMap.shenqingbianhao}<input type="hidden" id="shenqingbianhao" name="shenqingbianhao" value="${Info.html(readMap.shenqingbianhao)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">申请时间</label>
                            <div class="col-sm-10">
                                ${readMap.shenqingshijian}<input type="hidden" id="shenqingshijian" name="shenqingshijian" value="${Info.html(readMap.shenqingshijian)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">调到学院</label>
                            <div class="col-sm-10">
                                <ssm:sql var="mapxueyuan79" type="find"> SELECT xueyuanmingcheng,id FROM xueyuan where id='${readMap.diaodaoxueyuan}' </ssm:sql
                                >${mapxueyuan79.xueyuanmingcheng}<input type="hidden" id="diaodaoxueyuan" name="diaodaoxueyuan" value="${Info.html(readMap.diaodaoxueyuan)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">调到专业</label>
                            <div class="col-sm-10">
                                <ssm:sql var="mapzhuanye80" type="find"> SELECT zhuanyemingcheng,id FROM zhuanye where id='${readMap.diaodaozhuanye}' </ssm:sql
                                >${mapzhuanye80.zhuanyemingcheng}<input type="hidden" id="diaodaozhuanye" name="diaodaozhuanye" value="${Info.html(readMap.diaodaozhuanye)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">调到班级</label>
                            <div class="col-sm-10">
                                <ssm:sql var="mapbanji81" type="find"> SELECT banjimingcheng,id FROM banji where id='${readMap.diaodaobanji}' </ssm:sql
                                >${mapbanji81.banjimingcheng}<input type="hidden" id="diaodaobanji" name="diaodaobanji" value="${Info.html(readMap.diaodaobanji)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">申请描述</label>
                            <div class="col-sm-10">
                                ${readMap.shenqingmiaoshu}<input type="hidden" id="shenqingmiaoshu" name="shenqingmiaoshu" value="${Info.html(readMap.shenqingmiaoshu)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">申请学生</label>
                            <div class="col-sm-10">
                                ${readMap.shenqingxuesheng}<input type="hidden" id="shenqingxuesheng" name="shenqingxuesheng" value="${Info.html(readMap.shenqingxuesheng)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">审批<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_shenpi123"
                                    data-value=""
                                    data-rule-required="true"
                                    data-msg-required="请填写审批"
                                    id="shenpi"
                                    name="shenpi"
                                    style="width: 250px"
                                >
                                    <option value="通过">通过</option>
                                    <option value="未通过">未通过</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">审批备注</label>
                            <div class="col-sm-10">
                                <textarea style="width: 80%; height: 120px" class="form-control" placeholder="输入审批备注" id="shenpibeizhu" name="shenpibeizhu"></textarea>
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

