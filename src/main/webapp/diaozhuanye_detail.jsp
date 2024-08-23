<%@ page language="java" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="com.spring.util.*" %>
 <%@page import="com.jntoo.db.*" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">调专业详情</div>
        <div class="panel-body">
            <div class="admin-detail clearfix">
                <div class="detail detail-readmodule">
                    <div class="detail-title">新生id：</div>
                    <div class="detail-content">${map.xinshengid}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">学号：</div>
                    <div class="detail-content">${map.xuehao}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">姓名：</div>
                    <div class="detail-content">${map.xingming}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">申请编号：</div>
                    <div class="detail-content">${map.shenqingbianhao}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">申请时间：</div>
                    <div class="detail-content">${map.shenqingshijian}</div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">学院：</div>
                    <div class="detail-content">
                        <ssm:sql var="mapxueyuan46" type="find"> SELECT xueyuanmingcheng,id FROM xueyuan where id='${map.xueyuan}' </ssm:sql>${mapxueyuan46.xueyuanmingcheng}
                    </div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">专业：</div>
                    <div class="detail-content">
                        <ssm:sql var="mapzhuanye47" type="find"> SELECT zhuanyemingcheng,id FROM zhuanye where id='${map.zhuanye}' </ssm:sql>${mapzhuanye47.zhuanyemingcheng}
                    </div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">班级：</div>
                    <div class="detail-content">
                        <ssm:sql var="mapbanji48" type="find"> SELECT banjimingcheng,id FROM banji where id='${map.banji}' </ssm:sql>${mapbanji48.banjimingcheng}
                    </div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">调到学院：</div>
                    <div class="detail-content">
                        <ssm:sql var="mapxueyuan49" type="find"> SELECT xueyuanmingcheng,id FROM xueyuan where id='${map.diaodaoxueyuan}' </ssm:sql>${mapxueyuan49.xueyuanmingcheng}
                    </div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">调到专业：</div>
                    <div class="detail-content">
                        <ssm:sql var="mapzhuanye50" type="find"> SELECT zhuanyemingcheng,id FROM zhuanye where id='${map.diaodaozhuanye}' </ssm:sql>${mapzhuanye50.zhuanyemingcheng}
                    </div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">调到班级：</div>
                    <div class="detail-content">
                        <ssm:sql var="mapbanji51" type="find"> SELECT banjimingcheng,id FROM banji where id='${map.diaodaobanji}' </ssm:sql>${mapbanji51.banjimingcheng}
                    </div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">申请状态：</div>
                    <div class="detail-content">${map.shenqingzhuangtai}</div>
                </div>
                <div class="detail detail-textarea">
                    <div class="detail-title">申请描述：</div>
                    <div class="detail-content">${map.shenqingmiaoshu}</div>
                </div>
                <div class="detail detail-textuser">
                    <div class="detail-title">申请学生：</div>
                    <div class="detail-content">${map.shenqingxuesheng}</div>
                </div>
            </div>

            <div class="button-list mt10">
                <div class="">
                    <button type="button" class="btn btn-default" onclick="history.go(-1);">返回</button>
                    <button type="button" class="btn btn-default" onclick="window.print()">打印本页</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>

