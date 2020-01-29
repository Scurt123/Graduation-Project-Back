<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--头部-->
<%@include file="/WEB-INF/include-head.jsp" %>
<li class="mt">
    <a href="back/index.html">
        <i class="fa fa-dashboard"></i>
        <span>控制台</span>
    </a>
</li>
<li class="sub-menu">
    <a href="javascript:;">
        <i class="fa fa-desktop"></i>
        <span>UI Elements</span>
    </a>
    <ul class="sub">
        <li><a href="general.html">General</a></li>
        <li><a href="buttons.html">Buttons</a></li>
        <li><a href="panels.html">Panels</a></li>
        <li><a href="font_awesome.html">Font Awesome</a></li>
    </ul>
</li>
<li class="sub-menu">
    <a href="javascript:;">
        <i class="fa fa-cogs"></i>
        <span>Components</span>
    </a>
    <ul class="sub">
        <li><a href="grids.html">Grids</a></li>
        <li><a href="calendar.html">Calendar</a></li>
        <li><a href="gallery.html">Gallery</a></li>
        <li><a href="todo_list.html">Todo List</a></li>
        <li><a href="dropzone.html">Dropzone File Upload</a></li>
        <li><a href="inline_editor.html">Inline Editor</a></li>
        <li><a href="file_upload.html">Multiple File Upload</a></li>
    </ul>
</li>
<li class="sub-menu">
    <a href="javascript:;">
        <i class="fa fa-book"></i>
        <span>Extra Pages</span>
    </a>
    <ul class="sub">
        <li><a href="blank.html">Blank Page</a></li>
        <li><a href="login.html">Login</a></li>
        <li><a href="lock_screen.html">Lock Screen</a></li>
        <li><a href="profile.html">Profile</a></li>
        <li><a href="invoice.html">Invoice</a></li>
        <li><a href="pricing_table.html">Pricing Table</a></li>
        <li><a href="faq.html">FAQ</a></li>
        <li><a href="404.html">404 Error</a></li>
        <li><a href="500.html">500 Error</a></li>
    </ul>
</li>
<li class="sub-menu">
    <a class="active" href="javascript:;">
        <i class="fa fa-tasks"></i>
        <span>权限管理</span>
    </a>
    <ul class="sub">
        <li class="active"><a href="admin/query.html">用户维护</a></li>
        <li><a href="role/page.html">角色维护</a></li>

    </ul>
</li>
<li class="sub-menu">
    <a href="javascript:;">
        <i class="fa fa-th"></i>
        <span>Data Tables</span>
    </a>
    <ul class="sub">
        <li><a href="basic_table.html">Basic Table</a></li>
        <li><a href="responsive_table.html">Responsive Table</a></li>
        <li><a href="advanced_table.html">Advanced Table</a></li>
    </ul>
</li>
<li class="sub-menu">
    <a href="javascript:;">
        <i class=" fa fa-bar-chart-o"></i>
        <span>Charts</span>
    </a>
    <ul class="sub">
        <li><a href="morris.html">Morris</a></li>
        <li><a href="chartjs.html">Chartjs</a></li>
        <li><a href="flot_chart.html">Flot Charts</a></li>
        <li><a href="xchart.html">xChart</a></li>
    </ul>
</li>
</ul>

<!-- sidebar menu end-->
</div>
</aside>
<!--main content start-->
<section id="main-content">
    <section class="wrapper">
        <h3><i class="fa fa-arrow-left" onclick="window.history.go(-1)" style="cursor: pointer;"></i>
            分配角色</h3>
        <div class="col-sm-12 col-md-12 main">
            <div class="panel panel-default">
                <div style="padding: 65px">
                    <form action="assign/role.html" method="post"
                          role="form" class="form-inline" style="padding-left: 18em">
                        <input type="hidden" name="adminId" value="${param.adminId}"/>
                        <input type="hidden" name="pageNum" value="${param.pageNum}"/>

                        <div class="form-group">
                            <label>
                                <h4 style="color: #1da2ff"><b>未分配角色列表</b></h4>
                            </label>
                            <br>
                            <select id="leftSelect"
                                    class="form-control" multiple size="10" style="width:120px;overflow-y:auto;">
                                <c:forEach items="${requestScope.unAssignedRoleList}" var="role">
                                    <option value="${role.id}">${role.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <ul>
                                <li id="rightBtn"
                                    class="btn btn-default glyphicon glyphicon-chevron-right"></li>
                                <br>
                                <li id="leftBtn"
                                    class="btn btn-default glyphicon glyphicon-chevron-left"
                                    style="margin-top:20px;"></li>
                            </ul>
                        </div>
                        <div class="form-group" style="margin-left:40px;">
                            <label>

                                    <h4 style="color: red"><b>已分配角色列表</b></h4>
                            </label>
                            <br>
                            <select id="rightSelect" name="roleIdList"
                                    class="form-control" multiple size="10" style="width:120px;overflow-y:auto;">
                                <c:forEach items="${requestScope.assignedRoleList}" var="role">
                                    <option value="${role.id}">${role.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div style="margin-top:25px;">
                            <button id="submitBtn" type="submit" style="width: 21em"
                                    class="btn btn-success btn-lg btn-block">分配
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</section>

<script type="text/javascript">
    $("#rightBtn").click(function () {
        $("#leftSelect>option:selected").appendTo("#rightSelect");
    });
    $("#leftBtn").click(function () {
        $("#rightSelect>option:selected").appendTo("#leftSelect");
    });
    $("#submitBtn").click(function () {
        $("#rightSelect>option").prop("selected", "selected");
    });
</script>
<!--尾部-->
<%@include file="/WEB-INF/include-tail.jsp" %>