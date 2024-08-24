<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="head.jsp" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>Title</title>
<link rel="stylesheet" href="css/style.css">
<script src="js/datepicker/WdatePicker.js"></script>

<script src="js/highcharts/highcharts.js"></script>
<script src="js/highcharts/modules/exporting.js"></script>
<script src="js/highcharts/modules/series-label.js"></script>
<script src="js/highcharts/modules/oldie.js"></script>
<%@ include file="head.jsp" %>
<html>
    <head>
        <title>新生报道注册网站</title>
        <LINK href="images/style.css" type=text/css rel=stylesheet>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <style type="text/css">
            <!--
            body, td, th {
                font-size: 12px;
            }

            -->
        </style>
    </head>
    <body leftMargin="5" topMargin="5" rightMargin="5" style="margin-top: 40px; ">
    <h1 style="text-align: center" colspan="4" “><strong style="color:#000000">欢迎进入新生报道注册网站</strong></h1>
        <p>&nbsp;</p>
        <table width="100%" height="193" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#D9E9FF" style="text-align: center;  border-collapse: collapse; ">
            <tbody>
                <tr align="middle" bgcolor="#ffffff">
                    <td colspan="2" bgcolor="#CADCEA"><strong>新生报道注册网站</strong></td>
                </tr>
                <c:choose> <c:when test="${'新生' == sessionScope.cx }">

                <tr align="middle" bgcolor="#ffffff">
                    <td width="10%">所在宿舍号：</td>
                    <td width="41%"><font class="t4"><%=request.getSession().getAttribute("suozaisushehao") %></font></td>
                </tr>
                <tr align="middle" bgcolor="#ffffff">
                    <td width="10%" >床位号：</td>
                    <td width="41%" ><font class="t4"><%=request.getSession().getAttribute("chuangweihao") %></font></td>
                </tr>
                <tr align="middle" bgcolor="#ffffff">
                    <td width="10%">学费缴费：</td>
                    <td width="41%"><font class="t4"><%=request.getSession().getAttribute("shifouyijiaoxuefei") %></font></td>
                </tr>
                <tr align="middle" bgcolor="#ffffff">
                    <td width="10%" >宿舍缴费：</td>
                    <td width="41%" ><font class="t4"><%=request.getSession().getAttribute("sushejiaofei") %></font></td>
                </tr>
                </c:when></c:choose>
                <tr align="middle" bgcolor="#ffffff">
                    <td width="10%" >当前用户：</td>
                    <td width="41%" ><font class="t4"><%=request.getSession().getAttribute("username") %></font></td>
                </tr>
                <tr align="middle" bgcolor="#ffffff">
                    <td width="10%" >您的权限：</td>
                    <td width="41%" ><font class="t4"><%=request.getSession().getAttribute("cx") %></font></td>
                </tr>
                <tr align="middle" bgcolor="#ffffff">
                    <td width="10%" >系统作者：</td>
                    <td width="41%" ><font class="t4">张三</font></td>
                </tr>
                <tr align="middle" bgcolor="#ffffff">
                    <td >指导老师：</td>
                    <td >王五</td>
                </tr>
                <tr align="middle" bgcolor="#ffffff">
                    <td >联系方式：</td>
                    <td><font class="t41">13132935517</font></td>
                </tr>
            </tbody>
        </table>
        <p>&nbsp;</p>

    <c:choose> <c:when test="${'管理员' == sessionScope.cx }">
        <%
            String where = "1=1";
            if (!Request.get("kaishiriqi").equals("")) {
                where += " and addtime>='"+Request.get("kaishiriqi")+" 00:00:00' ";
            }
            if (!Request.get("jieshuriqi").equals("")) {
                where += " and addtime<='"+Request.get("jieshuriqi")+" 23:59:59' ";
            }
            List<HashMap> list = Query.make("xinsheng").field(" COUNT(*) count , issh")
                    .where(where)
                    .group("issh")
                    .order("COUNT(*) desc")
                    .select();

            List<HashMap> list1 = Query.make("xinsheng").field(" COUNT(*) count , xingbie")
                    .where(where)
                    .group("xingbie")
                    .order("COUNT(*) desc")
                    .select();

            List<HashMap> list2 = Query.make("xinsheng").field(" COUNT(*) count , shengyuandi")
                    .where(where)
                    .group("shengyuandi")
                    .order("COUNT(*) desc")
                    .select();

            List<HashMap> list3 = Query.make("xinsheng").field(" COUNT(*) count , xueyuan")
                    .where(where)
                    .group("xueyuan")
                    .order("COUNT(*) desc")
                    .select();

            List<HashMap> list4 = Query.make("xinsheng").field(" COUNT(*) count , zhuanye")
                    .where(where)
                    .group("zhuanye")
                    .order("COUNT(*) desc")
                    .select();

            List<HashMap> list5 = Query.make("xinsheng").field(" COUNT(*) count , banji")
                    .where(where)
                    .group("banji")
                    .order("COUNT(*) desc")
                    .select();
        %>

        <div class="row" >
            <div class="col-sm-6">
                <div id="container" style="height:350px"></div>
            </div>
            <div class="col-sm-6">
                <div id="container1" style="height:350px"></div>
            </div>
            <div class="col-sm-6">
                <div id="container2" style="height:350px"></div>
            </div>
            <div class="col-sm-6">
                <div id="container3" style="height:350px"></div>
            </div>
            <div class="col-sm-6">
                <div id="container4" style="height:350px"></div>
            </div>
            <div class="col-sm-6">
                <div id="container5" style="height:350px"></div>
            </div>
        </div>

        <script>
            Highcharts.chart('container', {
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
                    text: '新生是否注册可视化'
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
                            name :'<%=map.get("issh")%>',
                            y: <%=map.get("count")%>,
                        },
                        <% } %>

                    ]
                }]
            });
        </script>

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
                    text: '新生性别可视化分析'
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
                    data: [ <%for (HashMap map:list1)  {%>
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
                    text: '新生生源地可视化分析'
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
                    data: [ <%for (HashMap map:list2)  {%>
                        {
                            name :'<%=map.get("shengyuandi")%>',
                            y: <%=map.get("count")%>,
                        },
                        <% } %>

                    ]
                }]
            });
        </script>

        <script>
            var chart = Highcharts.chart('container3', {
                credits: {
                    enabled: false , // 禁用版权信息
                    text: 'HCharts.cn',
                    href: 'http://www.hcharts.cn'
                },
                chart: {
                    type: 'bar'
                },

                title: {
                    text: '各学院新生数量可视化'
                },
                subtitle: {
                    text: ''
                },

                yAxis: {
                    title: {
                        text: '人数',
                        align: 'high'
                    },
                    labels: {
                        overflow: 'justify'
                    }
                },
                tooltip: {
                    valueSuffix: ' 人'
                },
                xAxis:{
                    title:{
                        text:'学院'
                    },

                    categories:[
                        <% for(HashMap map : list3){ %>
                        ' <% Map mapcangkufenlei = Query.make("xueyuan").where("id" , map.get("xueyuan")).find(); %><%=mapcangkufenlei.get("xueyuanmingcheng")%>',
                        <% } %>

                    ]

                },
                /*
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle'
                },
                */
                plotOptions: {
                    series: {
                        label: {
                            connectorAllowed: false
                        },
                        // pointStart: 2010
                    }
                },
                series: [{
                    name: '人数',
                    data: [
                        <% for(HashMap map : list3){ %>
                        <%=map.get("count")%>,
                        <% } %>
                    ]
                }],
                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 500
                        },
                        chartOptions: {
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign: 'bottom'
                            }
                        }
                    }]
                }
            });
        </script>

        <script>
            var chart = Highcharts.chart('container4', {
                credits: {
                    enabled: false , // 禁用版权信息
                    text: 'HCharts.cn',
                    href: 'http://www.hcharts.cn'
                },
                chart: {
                    type: ''
                },

                title: {
                    text: '各专业新生数量可视化'
                },
                subtitle: {
                    text: ''
                },

                yAxis: {
                    title: {
                        text: '人数',
                        align: 'high'
                    },
                    labels: {
                        overflow: 'justify'
                    }
                },
                tooltip: {
                    valueSuffix: ' 人'
                },
                xAxis:{
                    title:{
                        text:'专业'
                    },

                    categories:[
                        <% for(HashMap map : list4){ %>
                        ' <% Map mapcangkufenlei = Query.make("zhuanye").where("id" , map.get("zhuanye")).find(); %><%=mapcangkufenlei.get("zhuanyemingcheng")%>',
                        <% } %>

                    ]

                },
                /*
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle'
                },
                */
                plotOptions: {
                    series: {
                        label: {
                            connectorAllowed: false
                        },
                        // pointStart: 2010
                    }
                },
                series: [{
                    name: '人数',
                    data: [
                        <% for(HashMap map : list4){ %>
                        <%=map.get("count")%>,
                        <% } %>
                    ]
                }],
                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 500
                        },
                        chartOptions: {
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign: 'bottom'
                            }
                        }
                    }]
                }
            });
        </script>

        <script>
            var chart = Highcharts.chart('container5', {
                credits: {
                    enabled: false , // 禁用版权信息
                    text: 'HCharts.cn',
                    href: 'http://www.hcharts.cn'
                },
                chart: {
                    type: 'column'
                },

                title: {
                    text: '各班级新生数量可视化'
                },
                subtitle: {
                    text: ''
                },

                yAxis: {
                    title: {
                        text: '人数',
                        align: 'high'
                    },
                    labels: {
                        overflow: 'justify'
                    }
                },
                tooltip: {
                    valueSuffix: ' 人'
                },
                xAxis:{
                    title:{
                        text:'班级'
                    },

                    categories:[
                        <% for(HashMap map : list5){ %>
                        ' <% Map mapcangkufenlei = Query.make("banji").where("id" , map.get("banji")).find(); %><%=mapcangkufenlei.get("banjimingcheng")%>',
                        <% } %>

                    ]

                },
                /*
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle'
                },
                */
                plotOptions: {
                    series: {
                        label: {
                            connectorAllowed: false
                        },
                        // pointStart: 2010
                    }
                },
                series: [{
                    name: '人数',
                    data: [
                        <% for(HashMap map : list5){ %>
                        <%=map.get("count")%>,
                        <% } %>
                    ]
                }],
                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 500
                        },
                        chartOptions: {
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign: 'bottom'
                            }
                        }
                    }]
                }
            });
        </script>
        <div class="button-list mt10">
            <div class="">

                <button type="button" class="btn btn-default" onclick="window.print()">打印报表</button>
            </div>
        </div>
    </c:when></c:choose>








        <p align="right">&nbsp;</p>
    </body>
</html>
