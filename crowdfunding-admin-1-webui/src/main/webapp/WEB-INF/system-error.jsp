<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
<head>
    <meta charset="utf-8">
    <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <title>众筹网-错误提示界面</title>

    <!-- Favicons -->
    <link href="img/favicon.png" rel="icon">
    <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Bootstrap core CSS -->
    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--external css-->
    <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet">

</head>

<body>
<!-- **********************************************************************************************************************************************************
    MAIN CONTENT
    *********************************************************************************************************************************************************** -->
<div class="container">
    <div class="row">
        <div class="col-lg-6 col-lg-offset-3 p404 centered">
            <img src="img/500.png" alt="">
            <h1>错误页面</h1>
            <h3>Oh!! Something Went Wrong!</h3>
            <br>
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <input type="text" readonly value="错误信息：${requestScope.exception.message }" class="form-control"/>
                    <button id="bakcBtn" class="btn btn-theme mt">返回上一步</button>
                </div>
            </div>
            <h5 class="mt">你好,也许你对下面的页面感兴趣:</h5>
            <p><a href="back/index.html">后台主页</a> | <a href="admin/query.html">用户维护</a>
        </div>
    </div>
</div>
<!-- js placed at the end of the document so the pages load faster -->
<script src="lib/jquery/jquery.min.js"></script>
<script src="lib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#bakcBtn").click(function () {
            window.history.back();
        });
    });
</script>
</body>

</html>
