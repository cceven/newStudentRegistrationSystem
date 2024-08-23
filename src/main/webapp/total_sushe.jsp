
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.spring.util.Request" %>
<%@ page import="com.spring.util.Query" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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

<form action="?" method="get">
    开始日期:<input sype="text" name="kaishiriqi" readonly="readonly" value="<%=Request.get("kaishiriqi")%>" onclick="WdatePicker({dateFmt:'yyyy-MM',lang:'zh-cn'})">
    结束日期:<input sype="text" name="jieshuriqi" readonly="readonly" value="<%=Request.get("jieshuriqi")%>" onclick="WdatePicker({dateFmt:'yyyy-MM',lang:'zh-cn'})">
    <button type="submit">提交</button>
</form>




<%
    //if (Request.get("kaishiriqi").equals("") && !Request.get("jieshuriqi").equals("")){
%>

<%
    String where = "1=1 ";
    if (!Request.get("kaishiriqi").equals("")) {
        where += " and yuefen>='"+Request.get("kaishiriqi")+" ' ";
    }
    if (!Request.get("jieshuriqi").equals("")) {
        where += " and yuefen<='"+Request.get("jieshuriqi")+" ' ";
    }
    List<HashMap> list = Query.make("xinshengxinxi").field("sushehao , COUNT(*) count , SUM(zongfeiyong) zongfeiyong ")
            .where(where)
            .group("sushehao")
            .order("SUM(zongfeiyong) desc")
            .select();
%>


<table class="table">
    <thead>
    <tr>
        <th>宿舍号</th>
        <th>累计费用</th>

    </tr>
    </thead>
    <tbody>
    <%for (HashMap map:list)  {%>
    <tr>

        <td><%=map.get("sushehao")%></td>

        <td><%=map.get("zongfeiyong")%></td>
    </tr>
    <% } %>
    </tbody>



</table>
<div id="container" style="max-width:800px;height:400px"></div>
<script>
    var chart = Highcharts.chart('container', {

        chart: {
            type: 'column'
        },

        title: {
            text: '各宿舍费用统计分析'
        },
        subtitle: {
            text: ''
        },

        yAxis: {
            title: {
                text: '￥',
                align: 'high'
            },
            labels: {
                overflow: 'justify'
            }
        },
        tooltip: {
            valueSuffix: ' ￥'
        },
        xAxis:{
            title:{
                text:'宿舍号'
            },

            categories:[
                <% for(HashMap map : list){ %>
                ' <%=map.get("sushehao")%>',
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
            name: '费用',
            data: [
                <% for(HashMap map : list){ %>
                <%=map.get("zongfeiyong")%>,
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

<% //} %>
</body>
</html>
