<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <title>后台 - 众筹网后台</title>

    <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>

    <!-- Favicons -->
    <link href="img/favicon.png" rel="icon">
    <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Bootstrap core CSS -->
    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--external css-->
    <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="lib/gritter/css/jquery.gritter.css"/>
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet">

    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/pagination.css">
    <link rel="stylesheet" href="ztree/zTreeStyle.css"/>

    <!-- js -->
    <script src="lib/chart-master/Chart.js"></script>
    <script src="lib/jquery/jquery-3.3.1.min.js"></script>

    <script src="lib/bootstrap/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="lib/jquery.dcjqaccordion.2.7.js"></script>
    <script src="lib/jquery.scrollTo.min.js"></script>
    <script src="lib/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="lib/jquery.sparkline.js"></script>
    <!--common script for all pages-->
    <script src="lib/common-scripts.js"></script>
    <script type="text/javascript" src="lib/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="lib/gritter-conf.js"></script>
    <!--script for this page-->
    <script src="lib/sparkline-chart.js"></script>
    <script src="lib/zabuto_calendar.js"></script>

    <script src="lib/docs.min.js"></script>
    <script src="ztree/jquery.ztree.all-3.5.min.js"></script>
</head>

<body>
<section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
        </div>
        <!--logo start-->
        <a href="back/index.html" class="logo">
            <b>
                <span>众筹网</span>-后台系统
            </b>
        </a>
        <!--logo end-->
        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li><a class="logout" href="back/security/logout.html">退出系统</a></li>
            </ul>
        </div>
    </header>
    <!--header end-->

    <!-- **********************************************************************************************************************************************************
    MAIN SIDEBAR MENU
    *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
        <div id="sidebar" class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">
                <p class="centered">
                    <img src="img/admin.jpg" class="img-circle" width="80">
                </p>
                <h5 class="centered">
                    <!-- 通过访问当前对象的principal.originalAdmin.userName属性可以获取用户的昵称 -->
                    <security:authentication property="principal.originalAdmin.userName"/>
                </h5>

