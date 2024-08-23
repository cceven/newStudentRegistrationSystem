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
            <div class="panel-heading">编辑调专业审批:</div>
            <div class="panel-body">
                <form action="diaozhuanyeshenpiupdate.do" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <input type="hidden" name="diaozhuanyeid" value="${mmm.diaozhuanyeid}" />
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">学号</label>
                            <div class="col-sm-10">${mmm.xuehao}<input type="hidden" id="xuehao" name="xuehao" value="${Info.html(mmm.xuehao)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">姓名</label>
                            <div class="col-sm-10">${mmm.xingming}<input type="hidden" id="xingming" name="xingming" value="${Info.html(mmm.xingming)}" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">学院(原院系)</label>
                            <div class="col-sm-10">
                                <ssm:sql var="mapxueyuan82" type="find"> SELECT xueyuanmingcheng,id FROM xueyuan where id='${mmm.xueyuan}' </ssm:sql
                                >${mapxueyuan82.xueyuanmingcheng}<input type="hidden" id="xueyuan" name="xueyuan" value="${Info.html(mmm.xueyuan)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">专业(原专业)</label>
                            <div class="col-sm-10">
                                <ssm:sql var="mapzhuanye83" type="find"> SELECT zhuanyemingcheng,id FROM zhuanye where id='${mmm.zhuanye}' </ssm:sql
                                >${mapzhuanye83.zhuanyemingcheng}<input type="hidden" id="zhuanye" name="zhuanye" value="${Info.html(mmm.zhuanye)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">班级(原班级)</label>
                            <div class="col-sm-10">
                                <ssm:sql var="mapbanji84" type="find"> SELECT banjimingcheng,id FROM banji where id='${mmm.banji}' </ssm:sql>${mapbanji84.banjimingcheng}<input
                                    type="hidden"
                                    id="banji"
                                    name="banji"
                                    value="${Info.html(mmm.banji)}"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">申请编号</label>
                            <div class="col-sm-10">
                                ${mmm.shenqingbianhao}<input type="hidden" id="shenqingbianhao" name="shenqingbianhao" value="${Info.html(mmm.shenqingbianhao)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">申请时间</label>
                            <div class="col-sm-10">
                                ${mmm.shenqingshijian}<input type="hidden" id="shenqingshijian" name="shenqingshijian" value="${Info.html(mmm.shenqingshijian)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">调到学院</label>
                            <div class="col-sm-10">
                                <ssm:sql var="mapxueyuan85" type="find"> SELECT xueyuanmingcheng,id FROM xueyuan where id='${mmm.diaodaoxueyuan}' </ssm:sql
                                >${mapxueyuan85.xueyuanmingcheng}<input type="hidden" id="diaodaoxueyuan" name="diaodaoxueyuan" value="${Info.html(mmm.diaodaoxueyuan)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">调到专业</label>
                            <div class="col-sm-10">
                                <ssm:sql var="mapzhuanye86" type="find"> SELECT zhuanyemingcheng,id FROM zhuanye where id='${mmm.diaodaozhuanye}' </ssm:sql
                                >${mapzhuanye86.zhuanyemingcheng}<input type="hidden" id="diaodaozhuanye" name="diaodaozhuanye" value="${Info.html(mmm.diaodaozhuanye)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">调到班级</label>
                            <div class="col-sm-10">
                                <ssm:sql var="mapbanji87" type="find"> SELECT banjimingcheng,id FROM banji where id='${mmm.diaodaobanji}' </ssm:sql
                                >${mapbanji87.banjimingcheng}<input type="hidden" id="diaodaobanji" name="diaodaobanji" value="${Info.html(mmm.diaodaobanji)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">申请描述</label>
                            <div class="col-sm-10">
                                ${mmm.shenqingmiaoshu}<input type="hidden" id="shenqingmiaoshu" name="shenqingmiaoshu" value="${Info.html(mmm.shenqingmiaoshu)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">申请学生</label>
                            <div class="col-sm-10">
                                ${mmm.shenqingxuesheng}<input type="hidden" id="shenqingxuesheng" name="shenqingxuesheng" value="${Info.html(mmm.shenqingxuesheng)}" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">审批<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_shenpi124"
                                    data-value="${Info.html(mmm.shenpi)}"
                                    data-rule-required="true"
                                    data-msg-required="请填写审批"
                                    id="shenpi"
                                    name="shenpi"
                                    style="width: 250px"
                                >
                                    <option value="通过">通过</option>
                                    <option value="未通过">未通过</option>
                                </select>
                                <script>
                                    $(".class_shenpi124").val($(".class_shenpi124").attr("data-value"));
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">审批备注</label>
                            <div class="col-sm-10">
                                <textarea style="width: 80%; height: 120px" class="form-control" placeholder="输入审批备注" id="shenpibeizhu" name="shenpibeizhu">
${Info.html(mmm.shenpibeizhu)}</textarea
                                >
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

