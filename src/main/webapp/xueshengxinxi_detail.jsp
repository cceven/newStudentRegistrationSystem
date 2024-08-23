<%@ page language="java" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="com.spring.util.*" %>
 <%@page import="com.jntoo.db.*" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="head.jsp" %>


<div style="padding: 10px" class="admin-content">
    <div class="panel panel-default">
        <div class="panel-heading">学生信息详情</div>
        <div class="panel-body">
            <div class="admin-detail clearfix">
                <div class="detail detail-readmodule">
                    <div class="detail-title">新生信息id：</div>
                    <div class="detail-content">${map.xinshengxinxiid}</div>
                </div>
                <div class="detail detail-textuser">
                    <div class="detail-title">用户名：</div>
                    <div class="detail-content">${map.yonghuming}</div>
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
                    <div class="detail-title">性别：</div>
                    <div class="detail-content">${map.xingbie}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">联系方式：</div>
                    <div class="detail-content">${map.lianxifangshi}</div>
                </div>
                <div class="detail detail-text">
                    <div class="detail-title">所在宿舍号：</div>
                    <div class="detail-content">${map.suozaisushehao}</div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">学院：</div>
                    <div class="detail-content">
                        <ssm:sql var="mapxueyuan7" type="find"> SELECT xueyuanmingcheng,id FROM xueyuan where id='${map.xueyuan}' </ssm:sql>${mapxueyuan7.xueyuanmingcheng}
                    </div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">专业：</div>
                    <div class="detail-content">
                        <ssm:sql var="mapzhuanye8" type="find"> SELECT zhuanyemingcheng,id FROM zhuanye where id='${map.zhuanye}' </ssm:sql>${mapzhuanye8.zhuanyemingcheng}
                    </div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">班级：</div>
                    <div class="detail-content">
                        <ssm:sql var="mapbanji9" type="find"> SELECT banjimingcheng,id FROM banji where id='${map.banji}' </ssm:sql>${mapbanji9.banjimingcheng}
                    </div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">是否分配宿舍：</div>
                    <div class="detail-content">${map.shifoufenpeisushe}</div>
                </div>
                <div class="detail detail-select">
                    <div class="detail-title">是否已缴学费：</div>
                    <div class="detail-content">${map.shifouyijiaoxuefei}</div>
                </div>
                <div class="detail detail-textarea">
                    <div class="detail-title">学生简介：</div>
                    <div class="detail-content">${map.xueshengjianjie}</div>
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

