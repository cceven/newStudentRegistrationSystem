
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.spring.util.Request" %>
<%@ page import="com.spring.util.Query" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <title>Title</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/datepicker/WdatePicker.js"></script>

    <script src="js/highcharts/highcharts.js"></script>
    <script src="js/highcharts/modules/exporting.js"></script>
    <script src="js/highcharts/modules/series-label.js"></script>
    <script src="js/highcharts/modules/oldie.js"></script>
    <%@ include file="head.jsp" %>

<form style="display: none" action="?" method="get">
    开始日期:<input sype="text" name="kaishiriqi" value="<%=Request.get("kaishiriqi")%>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})">
    结束日期:<input sype="text" name="jieshuriqi" value="<%=Request.get("jieshuriqi")%>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})">
    <button type="submit">提交</button>
</form>




<%
    //if (Request.get("kaishiriqi").equals("") && !Request.get("jieshuriqi").equals("")){
%>

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
%>



<div class="row" style="background-color: #bababa">
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
</div>
<script>
    Highcharts.chart('container', {
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
<% //} %>
