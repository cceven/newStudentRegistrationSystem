<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%@ page import="com.spring.util.*" %>
 <%@ page import="java.text.SimpleDateFormat" %>
 <%@ page import="java.util.*" %>
 <%@ taglib prefix="ssm" uri="http://ssm" %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>Title</title>
        <link rel="stylesheet" href="css.css" />
        <script src="js/jquery.js"></script>
        <script src="js/jquery.validate.js"></script>
        <link rel="stylesheet" href="js/layer/theme/default/layer.css" />
        <script src="js/layer/layer.js"></script>
    </head>
    <body>
        <% if (Request.get("step", "1").equals("1")) { %>

        <form action="xinsheng_import.do" method="get" name="form1" id="form1" style="padding: 10px; background: #ffffff">
            <div class="" style="padding: 15px; background: #9d1511; color: #ffffff">
                <a
                    href="xinsheng_importfile.do"
                    download="download"
                    style="font-size: 18px; color: #000000; display: inline-block; padding: 5px 10px; border: 1px solid #dedede; background: #f5f8ff"
                    target="_blank"
                    >点我下载导入模版</a
                >
                系统导入必须按此模版进行导入，导入只限xls后缀文件
            </div>

            <table class="table table-bordered">
                <tbody>
                    <tr>
                        <td>上传文件</td>
                        <td>
                            <input type="hidden" name="step" value="2" />
                            <input name="xls" id="xls" type="text" />
                            <input
                                type="button"
                                value="上传"
                                onclick="layer.open({type:2,title:'上传文件',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=xls'});"
                            />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <input type="submit" value="提交" style="padding: 5px 15px" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
        <script>
            $(function () {
                $("#form1").validate();
            });
        </script>
        <%// 上传文件后到达第二步
    }else if(Request.get("step" , "1").equals("2")){ %> <% if (Request.get("xls").equals("")) { %>

        <script>
            alert("没有找到文件");
            history.go(-1);
        </script>
        <%out.close();
return;
} %> <%
         List<HashMap> list = null;
         // 生成execl 实列
         Execl xls = new Execl();
         // 添加execl 列
         xls.addCol("xuehao", "学号");
         xls.addCol("mima", "密码");
         xls.addCol("xingming", "姓名");
         xls.addCol("xingbie", "性别");
         xls.addCol("shengyuandi", "生源地");
         xls.addColSelect("xueyuan", "学院", "xueyuan", "id", "xueyuanmingcheng", 0);
         xls.addColSelect("zhuanye", "专业", "zhuanye", "id", "zhuanyemingcheng", 0);
         xls.addColSelect("banji", "班级", "banji", "id", "banjimingcheng", 0);
         xls.addCol("lianxifangshi", "联系方式");
         xls.addCol("xueshengjianjie", "学生简介");
         xls.addCol("shifoufenpeisushe", "是否分配宿舍");
         xls.addCol("suozaisushehao", "所在宿舍号");
         xls.addCol("chuangweihao", "床位号");
         xls.addCol("shifouyijiaoxuefei", "是否已缴学费");
         xls.addCol("sushejiaofei", "宿舍缴费");
         list = xls.imports(Request.get("xls"), request);
         %>


        <form action="xinsheng_import.do?step=3" method="post" id="form1" name="form1">
            <input style="padding: 5px 10px" type="submit" value="提交" />
            <div class="list-table">
                <table width="100%" border="1" class="table table-bordered table-hover" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF">
                    <thead>
                        <tr>
                            <th>学号</th>
                            <th>密码</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>生源地</th>
                            <th>学院</th>
                            <th>专业</th>
                            <th>班级</th>
                            <th>联系方式</th>
                            <th>学生简介</th>
                            <th>是否分配宿舍</th>
                            <th>所在宿舍号</th>
                            <th>床位号</th>
                            <th>是否已缴学费</th>
                            <th>宿舍缴费</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        int i = 0;
                        for (Map mmm : list) {
                            i++;
                            request.setAttribute("mmm", mmm);
                        %>


                        <tr>
                            <td>
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入学号"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写学号"
                                    remote="checkno.do?checktype=update&id=${mmm.id}&table=xinsheng&col=xuehao"
                                    data-msg-remote="内容重复了"
                                    id="xuehao"
                                    name="xuehao"
                                    value="${Info.html(mmm.xuehao)}"
                                />
                            </td>
                            <td>
                                <input
                                    type="password"
                                    class="form-control"
                                    placeholder="输入密码"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写密码"
                                    id="mima"
                                    name="mima"
                                    value="${Info.html(mmm.mima)}"
                                />
                            </td>
                            <td>
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入姓名"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写姓名"
                                    id="xingming"
                                    name="xingming"
                                    value="${Info.html(mmm.xingming)}"
                                />
                            </td>
                            <td>
                                <select
                                    class="form-control class_xingbie4"
                                    data-value="${Info.html(mmm.xingbie)}"
                                    data-rule-required="true"
                                    data-msg-required="请填写性别"
                                    id="xingbie"
                                    name="xingbie"
                                    style="width: 250px"
                                >
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                                <script>
                                    $(".class_xingbie4").val($(".class_xingbie4").attr("data-value"));
                                </script>
                            </td>
                            <td>
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入生源地"
                                    style="width: 150px"
                                    data-rule-required="true"
                                    data-msg-required="请填写生源地"
                                    id="shengyuandi"
                                    name="shengyuandi"
                                    value="${Info.html(mmm.shengyuandi)}"
                                />
                            </td>
                            <td>
                                <select
                                    class="form-control class_xueyuan5"
                                    data-value="${Info.html(mmm.xueyuan)}"
                                    data-rule-required="true"
                                    data-msg-required="请填写学院"
                                    id="xueyuan"
                                    name="xueyuan"
                                    style="width: 250px"
                                >
                                    <ssm:sql var="select" type="select"> SELECT * FROM xueyuan ORDER BY id desc </ssm:sql>
                                    <c:forEach items="${select}" var="m"
                                        ><c:set var="m" value="${m}" scope="request" />
                                        <option value="${m.id}">${m.xueyuanmingcheng}</option>
                                    </c:forEach>
                                </select>
                                <script>
                                    $(".class_xueyuan5").val($(".class_xueyuan5").attr("data-value"));
                                </script>
                            </td>
                            <td>
                                <select
                                    class="form-control class_zhuanye6"
                                    data-value="${Info.html(mmm.zhuanye)}"
                                    data-rule-required="true"
                                    data-msg-required="请填写专业"
                                    id="zhuanye"
                                    name="zhuanye"
                                    style="width: 250px"
                                >
                                    <ssm:sql var="select" type="select"> SELECT * FROM zhuanye ORDER BY id desc </ssm:sql>
                                    <c:forEach items="${select}" var="m"
                                        ><c:set var="m" value="${m}" scope="request" />
                                        <option value="${m.id}">${m.zhuanyemingcheng}</option>
                                    </c:forEach>
                                </select>
                                <script>
                                    $(".class_zhuanye6").val($(".class_zhuanye6").attr("data-value"));
                                </script>
                            </td>
                            <td>
                                <select
                                    class="form-control class_banji7"
                                    data-value="${Info.html(mmm.banji)}"
                                    data-rule-required="true"
                                    data-msg-required="请填写班级"
                                    id="banji"
                                    name="banji"
                                    style="width: 250px"
                                >
                                    <ssm:sql var="select" type="select"> SELECT * FROM banji ORDER BY id desc </ssm:sql>
                                    <c:forEach items="${select}" var="m"
                                        ><c:set var="m" value="${m}" scope="request" />
                                        <option value="${m.id}">${m.banjimingcheng}</option>
                                    </c:forEach>
                                </select>
                                <script>
                                    $(".class_banji7").val($(".class_banji7").attr("data-value"));
                                </script>
                            </td>
                            <td>
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入联系方式"
                                    style="width: 150px"
                                    id="lianxifangshi"
                                    name="lianxifangshi"
                                    value="${Info.html(mmm.lianxifangshi)}"
                                />
                            </td>
                            <td>
                                <textarea style="width: 80%; height: 120px" class="form-control" placeholder="输入学生简介" id="xueshengjianjie" name="xueshengjianjie">
${Info.html(mmm.xueshengjianjie)}</textarea
                                >
                            </td>
                            <td>
                                <select
                                    class="form-control class_shifoufenpeisushe8"
                                    data-value="${Info.html(mmm.shifoufenpeisushe)}"
                                    id="shifoufenpeisushe"
                                    name="shifoufenpeisushe"
                                    style="width: 250px"
                                >
                                    <option value="是">是</option>
                                    <option value="否">否</option>
                                </select>
                                <script>
                                    $(".class_shifoufenpeisushe8").val($(".class_shifoufenpeisushe8").attr("data-value"));
                                </script>
                            </td>
                            <td>
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入所在宿舍号"
                                    style="width: 150px"
                                    id="suozaisushehao"
                                    name="suozaisushehao"
                                    value="${Info.html(mmm.suozaisushehao)}"
                                />
                            </td>
                            <td>
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入床位号"
                                    style="width: 150px"
                                    id="chuangweihao"
                                    name="chuangweihao"
                                    value="${Info.html(mmm.chuangweihao)}"
                                />
                            </td>
                            <td>
                                <select
                                    class="form-control class_shifouyijiaoxuefei9"
                                    data-value="${Info.html(mmm.shifouyijiaoxuefei)}"
                                    id="shifouyijiaoxuefei"
                                    name="shifouyijiaoxuefei"
                                    style="width: 250px"
                                >
                                    <option value="是">是</option>
                                    <option value="否">否</option>
                                </select>
                                <script>
                                    $(".class_shifouyijiaoxuefei9").val($(".class_shifouyijiaoxuefei9").attr("data-value"));
                                </script>
                            </td>
                            <td>
                                <select
                                    class="form-control class_sushejiaofei10"
                                    data-value="${Info.html(mmm.sushejiaofei)}"
                                    id="sushejiaofei"
                                    name="sushejiaofei"
                                    style="width: 250px"
                                >
                                    <option value="是">是</option>
                                    <option value="否">否</option>
                                </select>
                                <script>
                                    $(".class_sushejiaofei10").val($(".class_sushejiaofei10").attr("data-value"));
                                </script>
                            </td>
                        </tr>

                        <%} %>

                    </tbody>
                </table>
            </div>

            <input style="padding: 5px 10px" type="submit" value="提交" />
        </form>
        <script>
            $(function () {
                $("#form1")
                    .find("select")
                    .each(function () {
                        $(this).val($(this).attr("data-value"));
                    });
                $("#form1").validate();
            });
        </script>
        <%}else if(Request.get("step").equals("3")){ %> <%
         String[] xuehaos = request.getParameterValues("xuehao");
         
         for (int i = 0; i < xuehaos.length; i++) {
             HashMap post = new HashMap();
             String[] xuehaoPost = request.getParameterValues("xuehao");
             post.put("xuehao", xuehaoPost[i]);
             String[] mimaPost = request.getParameterValues("mima");
             post.put("mima", mimaPost[i]);
             String[] xingmingPost = request.getParameterValues("xingming");
             post.put("xingming", xingmingPost[i]);
             String[] xingbiePost = request.getParameterValues("xingbie");
             post.put("xingbie", xingbiePost[i]);
             String[] shengyuandiPost = request.getParameterValues("shengyuandi");
             post.put("shengyuandi", shengyuandiPost[i]);
             String[] xueyuanPost = request.getParameterValues("xueyuan");
             post.put("xueyuan", xueyuanPost[i]);
             String[] zhuanyePost = request.getParameterValues("zhuanye");
             post.put("zhuanye", zhuanyePost[i]);
             String[] banjiPost = request.getParameterValues("banji");
             post.put("banji", banjiPost[i]);
             String[] lianxifangshiPost = request.getParameterValues("lianxifangshi");
             post.put("lianxifangshi", lianxifangshiPost[i]);
             String[] xueshengjianjiePost = request.getParameterValues("xueshengjianjie");
             post.put("xueshengjianjie", xueshengjianjiePost[i]);
             String[] shifoufenpeisushePost = request.getParameterValues("shifoufenpeisushe");
             post.put("shifoufenpeisushe", shifoufenpeisushePost[i]);
             String[] suozaisushehaoPost = request.getParameterValues("suozaisushehao");
             post.put("suozaisushehao", suozaisushehaoPost[i]);
             String[] chuangweihaoPost = request.getParameterValues("chuangweihao");
             post.put("chuangweihao", chuangweihaoPost[i]);
             String[] shifouyijiaoxuefeiPost = request.getParameterValues("shifouyijiaoxuefei");
             post.put("shifouyijiaoxuefei", shifouyijiaoxuefeiPost[i]);
             String[] sushejiaofeiPost = request.getParameterValues("sushejiaofei");
             post.put("sushejiaofei", sushejiaofeiPost[i]);
             post.put("issh", "否");
             post.put("addtime", Info.getDateStr());
             Query.make("xinsheng").insert(post);
         }
         %>

        <script>
            alert("导入成功");
            location.href = "xinsheng_import.do";
        </script>
        <%}else{ %> 系统错误，非法允许程序 <%} %>

    </body>
</html>
