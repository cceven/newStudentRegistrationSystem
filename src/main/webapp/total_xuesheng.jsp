
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.spring.util.Request" %>
<%@ page import="com.spring.util.Query" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="head.jsp" %>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/datepicker/WdatePicker.js"></script>

    <script src="js/highcharts/highcharts.js"></script>
    <script src="js/highcharts/modules/exporting.js"></script>
    <script src="js/highcharts/modules/series-label.js"></script>
    <script src="js/highcharts/modules/oldie.js"></script>
</head>
<body>






<%
    //if (Request.get("kaishiriqi").equals("") && !Request.get("jieshuriqi").equals("")){
%>
<div class="pa10 bg-warning">
    <form class="form-inline" id="formSearch" action="?">
        <!-- form 标签开始 -->

        <div class="form-group">
            <i class="glyphicon glyphicon-search"></i>
        </div>


        <div class="form-group">
            学院

            <select class="form-control class_xueyuan3" data-value="${param.xueyuan}" id="xueyuan" name="xueyuan">
                <option value="">请选择</option>
                <ssm:sql var="select" type="select"> SELECT * FROM xueyuan ORDER BY id desc </ssm:sql>
                <c:forEach items="${select}" var="m"
                ><c:set var="m" value="${m}" scope="request" />
                    <option value="${m.id}">${m.xueyuanmingcheng}</option>
                </c:forEach>
            </select>
            <script>
                $(".class_xueyuan3").val($(".class_xueyuan3").attr("data-value"));
            </script>
        </div>
        <div class="form-group">
            专业

            <select class="form-control class_zhuanye4" data-value="${param.zhuanye}" id="zhuanye" name="zhuanye">
                <option value="">请选择</option>
                <ssm:sql var="select" type="select"> SELECT * FROM zhuanye ORDER BY id desc </ssm:sql>
                <c:forEach items="${select}" var="m"
                ><c:set var="m" value="${m}" scope="request" />
                    <option value="${m.id}">${m.zhuanyemingcheng}</option>
                </c:forEach>
            </select>
            <script>
                $(".class_zhuanye4").val($(".class_zhuanye4").attr("data-value"));
            </script>
        </div>


        <button type="submit" class="btn btn-default">搜索</button>

        <!--form标签结束-->
    </form>
</div>
<%
    String where = "1=1";
    if (!Request.get("xueyuan").equals("")) {
        where += " AND xueyuan ='" + Request.get("xueyuan") + "' ";
    }
    if (!Request.get("zhuanye").equals("")) {
        where += " AND zhuanye ='" + Request.get("zhuanye") + "' ";
    }
    List<HashMap> list = Query.make("xueshengxinxi").field(" COUNT(*) count , xueyuan,zhuanye,xingbie")
            .where(where)
            .group("xingbie")
            .order("COUNT(*) desc")
            .select();
%>



<div class="row" >
    <div class="col-sm-6">
        <div id="container1" style="height:350px"></div>
    </div>
    <div class="col-sm-6">
        <div id="container2" style="height:350px"></div>
    </div>
    <div class="col-sm-6">
        <div id="container3" style="height:350px"></div>
    </div>
</div>
<div id="container" style="max-width:800px;height:400px"></div>
<script>
    Highcharts.chart('container1', {
        credits: {
            enabled: false , // 禁用版权信息
            text: 'HCharts.cn',
            href: 'http://www.hcharts.cn'
        },
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: '学生性别比率'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: 'Brands',
            colorByPoint: true,
            data: [ <%for (HashMap map:list)  {%>
                {
                    name :'<%=map.get("xingbie")%>',
                    y: <%=map.get("count")%>,
                },
                <% } %>

            ]
        }]
    });
</script>
<script>
    Highcharts.chart('container2', {
        credits: {
            enabled: false , // 禁用版权信息
            text: 'HCharts.cn',
            href: 'http://www.hcharts.cn'
        },
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: '学生学院比率'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: 'Brands',
            colorByPoint: true,
            data: [ <%for (HashMap map:list)  {%>
                {
                    name :' <%  Map mapcangkufenlei = Query.make("xueyuan").where("id" , map.get("xueyuan")).find(); %><%=mapcangkufenlei.get("xueyuanmingcheng")%>',
                    y: <%=map.get("count")%>,
                },
                <% } %>

            ]
        }]
    });
</script>
<script>
    Highcharts.chart('container3', {
        credits: {
            enabled: false , // 禁用版权信息
            text: 'HCharts.cn',
            href: 'http://www.hcharts.cn'
        },
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: '学生专业比率'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: 'Brands',
            colorByPoint: true,
            data: [ <%for (HashMap map:list)  {%>
                {
                    name :'  <% Map mapcangkufenlei2 = Query.make("zhuanye").where("id" , map.get("zhuanye")).find(); %><%=mapcangkufenlei2.get("zhuanyemingcheng")%>',
                    y: <%=map.get("count")%>,
                },
                <% } %>

            ]
        }]
    });
</script>
<% //} %>
</body>
</html>
