<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="com.spring.util.*" %>
<%@page import="com.jntoo.db.*" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!-- Remove Tap Highlight on Windows Phone IE -->
    <meta name="msapplication-tap-highlight" content="no"/>

    <title>新生报道注册网站</title>

    <!-- additional styles for plugins -->

    <!-- uikit -->
    <link rel="stylesheet" href="assets/js/uikit/css/uikit.almost-flat.min.css" media="all"/>

    <!-- altair admin -->
    <link rel="stylesheet" href="assets/css/main.min.css" media="all"/>

    <!-- matchMedia polyfill for testing media queries in JS -->
    <style>
        /*“新生报道注册网站”的鼠标悬浮效果*/
        .uk-button-dropdown:hover, #sidebar_main_toggle:hover, .user_action_image:hover, .sidebar_logo .sSidebar_hide:hover{
            text-shadow: 10px 10px 10px black;
            transition: 0.2s;
            transform: scale(1.2);
            overflow: visible;
        }
    </style>
</head>
<body class="sidebar_main_open sidebar_main_swipe">
<!-- main header -->
<header id="header_main" style="background-image: url(assets/img/banner-bg.png); background-position: center; height: 89px;;">
    <div class="header_main_content" >
        <nav class="uk-navbar">
            <!-- main sidebar switch -->
                <a href="#" id="sidebar_main_toggle" class="sSwitch sSwitch_left" style="margin-top: 33px; ">
                <span class="sSwitchIcon"></span>
            </a>

            <div id="menu_top_dropdown" class="uk-float-left uk-hidden-small">
                <div class="uk-button-dropdown">
                    <a href="main.jsp" class="top_menu_toggle"><i class="material-icons md-24" >&#xE8F0;</i> 新生报道注册网站</a>
                </div>
            </div>

            <!-- secondary sidebar switch -->
            <div class="uk-navbar-flip">
                <ul class="uk-navbar-nav user_actions">
                    <li data-uk-dropdown="{mode:'click',pos:'bottom-right'}">
                        <a href="#" class="user_action_image" style="margin-top: 21px">
                            <img class="md-user-image" src="assets/img/avatars/avatar_11_tn.png" alt=""/>
                            ${sessionScope.username}
                        </a>
                        <div class="uk-dropdown uk-dropdown-small">
                            <ul class="uk-nav js-uk-prevent">

                                <li><a href="logout.do">退出系统</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>
<!-- main header end -->
<!-- main sidebar -->
<aside id="sidebar_main">
    <div class="sidebar_main_header">
        <div class="sidebar_logo" style="transform: translateX(15px)translateY(15px);">
            <a href="./" class="sSidebar_show"><img src="assets/img/logo_main.png" alt="" height="15" width="71"/></a>
            <a href="./" class="sSidebar_hide"><img src="assets/img/logo_main_small.png" title="点击返回登陆页面" style="margin-top: 5px;
    margin-left: 1px;" height="32" width="32"/></a>
        </div>
    </div>

    <div class="menu_section">
        <ul>
            <c:choose> <c:when test="${'管理员' == sessionScope.cx }">
                <%@ include file="left_guanliyuan.jsp" %>
            </c:when></c:choose>
            <c:choose> <c:when test="${'新生' == sessionScope.cx }">
                <%@ include file="left_xinsheng.jsp" %>
            </c:when></c:choose>
        </ul>
    </div>
</aside>
<!-- main sidebar end -->

<div id="page_content" style="height: calc(100vh - 48px); padding-top: 30px; ">
    <div id="page_content_inner">
        <iframe class="iframe" name="main" src="sy.do"></iframe>
    </div>
</div>

<!-- common functions -->
<script src="assets/js/common.min.js"></script>
<!-- uikit functions -->
<script src="assets/js/uikit_custom.min.js"></script>
<!-- altair common functions/helpers -->
<script src="assets/js/altair_admin_common.min.js"></script>

<!-- page specific plugins -->

<script>
    $(function () {
        // enable hires images
        altair_helpers.retina_images();
        // fastClick (touch devices)
        if (Modernizr.touch) {
            FastClick.attach(document.body);
        }
    });
</script>

<script>
    $(function () {
        var $switcher = $("#style_switcher"),
            $switcher_toggle = $("#style_switcher_toggle"),
            $theme_switcher = $("#theme_switcher"),
            $mini_sidebar_toggle = $("#style_sidebar_mini"),
            $boxed_layout_toggle = $("#style_layout_boxed"),
            $body = $("body");

        $switcher_toggle.click(function (e) {
            e.preventDefault();
            $switcher.toggleClass("switcher_active");
        });

        $theme_switcher.children("li").click(function (e) {
            e.preventDefault();
            var $this = $(this),
                this_theme = $this.attr("data-app-theme");

            $theme_switcher.children("li").removeClass("active_theme");
            $(this).addClass("active_theme");
            $body.removeClass("app_theme_a app_theme_b app_theme_c app_theme_d app_theme_e app_theme_f app_theme_g").addClass(this_theme);

            if (this_theme == "") {
                localStorage.removeItem("altair_theme");
            } else {
                localStorage.setItem("altair_theme", this_theme);
            }
        });

        // hide style switcher
        $document.on("click keyup", function (e) {
            if ($switcher.hasClass("switcher_active")) {
                if (!$(e.target).closest($switcher).length || e.keyCode == 27) {
                    $switcher.removeClass("switcher_active");
                }
            }
        });

        // get theme from local storage
        if (localStorage.getItem("altair_theme") !== null) {
            $theme_switcher.children("li[data-app-theme=" + localStorage.getItem("altair_theme") + "]").click();
        }

        // toggle mini sidebar

        // change input's state to checked if mini sidebar is active
        if ((localStorage.getItem("altair_sidebar_mini") !== null && localStorage.getItem("altair_sidebar_mini") == "1") || $body.hasClass("sidebar_mini")) {
            $mini_sidebar_toggle.iCheck("check");
        }

        $mini_sidebar_toggle
            .on("ifChecked", function (event) {
                $switcher.removeClass("switcher_active");
                localStorage.setItem("altair_sidebar_mini", "1");
                location.reload(true);
            })
            .on("ifUnchecked", function (event) {
                $switcher.removeClass("switcher_active");
                localStorage.removeItem("altair_sidebar_mini");
                location.reload(true);
            });

        // toggle boxed layout

        // change input's state to checked if mini sidebar is active
        if ((localStorage.getItem("altair_layout") !== null && localStorage.getItem("altair_layout") == "boxed") || $body.hasClass("boxed_layout")) {
            $boxed_layout_toggle.iCheck("check");
            $body.addClass("boxed_layout");
            $(window).resize();
        }

        // toggle mini sidebar
        $boxed_layout_toggle
            .on("ifChecked", function (event) {
                $switcher.removeClass("switcher_active");
                localStorage.setItem("altair_layout", "boxed");
                location.reload(true);
            })
            .on("ifUnchecked", function (event) {
                $switcher.removeClass("switcher_active");
                localStorage.removeItem("altair_layout");
                location.reload(true);
            });
    });
</script>

</body>
</html>
