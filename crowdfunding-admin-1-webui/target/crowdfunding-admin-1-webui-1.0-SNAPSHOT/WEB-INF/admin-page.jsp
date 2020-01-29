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
        <div class="col-sm-12 col-md-12 main" style="margin-top: 20px">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
                </div>
                <div class="panel-body">
                    <form action="admin/query.html" class="form-inline" role="form" style="float:left;">
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <div class="input-group-addon">查询条件</div>
                                <input name="keyword" class="form-control has-success" type="text"
                                       placeholder="请输入查询条件">
                            </div>
                        </div>
                        <button type="submit" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询
                        </button>
                    </form>
                    <button type="button"
                            id="batchRemoveBtn"
                            class="btn btn-danger" style="float:right;margin-left:10px;"><i
                            class=" glyphicon glyphicon-remove"></i> 删除
                    </button>
                    <a href="admin/add.html" class="btn btn-primary" style="float: right;">
                        <i class="glyphicon glyphicon-plus"></i>新增
                    </a>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <table class="table  table-bordered">
                            <thead>
                            <tr>
                                <th width="30">#</th>
                                <th width="30"><input id="summaryBox" type="checkbox"></th>
                                <th>账号</th>
                                <th>名称</th>
                                <th>邮箱地址</th>
                                <th width="100">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${empty requestScope['PAGE-INFO'].list}">
                                    <tr>
                                        <td style="text-align: center;" colspan="6">抱歉！没有符合你要求的结果！</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${requestScope['PAGE-INFO'].list}" var="admin"
                                               varStatus="myStatus">
                                        <tr>
                                            <td width="50px">${myStatus.count}</td>
                                            <td><input adminId="${admin.id }" class="itemBox" type="checkbox"/></td>
                                            <td>${admin.loginAccount}</td>
                                            <td>${admin.userName}</td>
                                            <td>${admin.email}</td>
                                            <td>
                                                <a href="assign/role/page.html?adminId=${admin.id }&pageNum=${requestScope['PAGE-INFO'].pageNum}"
                                                   class="btn btn-success btn-xs">
                                                    <i class=" glyphicon glyphicon-check"
                                                       style="width: 12px;height: 16px;"></i>
                                                </a>
                                                <a href="admin/edit.html?adminId=${admin.id }&pageNum=${requestScope['PAGE-INFO'].pageNum}"
                                                   class="btn btn-primary btn-xs">
                                                    <i style="width: 12px;height: 16px;"
                                                       class=" glyphicon glyphicon-pencil"></i>
                                                </a>
                                                <button adminId="${admin.id}"
                                                        type="button"
                                                        class="btn btn-danger btn-xs uniqueRemoveBtn">
                                                    <i class="glyphicon glyphicon-remove"
                                                       style="width: 12px;height: 16px;"></i></button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="6" align="center">
                                    <div id="Pagination" class="pagination">
                                        <!-- 这里显示分页 -->
                                    </div>
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</section>
<!--main content end-->
<script type="text/javascript" src="lib/my-admin/my-admin.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        // 初始化全局变量
        window.totalRecord = ${requestScope['PAGE-INFO'].total};
        window.pageSize = ${requestScope['PAGE-INFO'].pageSize};
        window.pageNum = ${requestScope['PAGE-INFO'].pageNum};
        window.keyword = "${param.keyword}";

        // 对分页导航条显示进行初始化
        initPagination();

        $("#summaryBox").click(function () {
            // 获取当前#summaryBox的勾选状态(this.checked)
            // this代表当前多选框对象（DOM对象）
            // checked属性为true时表示被勾选，为false时表示没有被勾选
            // 使用checkStatus设置.itemBox的状态
            $(".itemBox").prop("checked", this.checked);
        });

        $("#batchRemoveBtn").click(function () {
            // 创建数组对象：存储adminId
            var adminArray = new Array();
            // 创建数组对象：存储loginAcct
            var loginAcctArray = new Array();

            $(".itemBox:checked").each(function () {
                var adminId = $(this).attr("adminId");
                adminArray.push(adminId);

                var loginAcct = $(this)				// 当前checkbox对象
                    .parent("td")	// 包含checkbox的td
                    .next()			// 当前td的下一个兄弟元素，也就是下一个td
                    .text();		// 下一个td的标签内部的文本
                loginAcctArray.push(loginAcct);
            });

            // 检查adminIdArray是否包含有效数据
            if (adminArray.length == 0) {
                // 给出提示
                alert("请勾选您要删除的记录！");
                // 函数停止执行
                return;
            }

            // 给出确认提示，让用户确认是否真的删除记录
            var confirmResult = confirm("您真的要删除这" + loginAcctArray + "信息吗？");

            // 如果用户点击了取消，那么让函数停止执行
            if (!confirmResult) {
                return;
            }

            doBatchRemove(adminArray);
        });

        // 给单条删除按钮绑定单击响应函数
        $(".uniqueRemoveBtn").click(function () {
            // 获取当前adminId值
            var adminId = $(this).attr("adminId");
            // 获取当前记录的loginAcct
            var loginAcct = $(this).parents("tr").children("td:eq(2)").text();

            var confirmResult = confirm("您真的要删除" + loginAcct + "这条记录吗？");
            if (!confirmResult) {
                return;
            }
            // 为了能够使用批量删除的操作，将adminId存入数组
            var adminIdArray = new Array();
            adminIdArray.push(adminId);

            // 调用专门封装的函数，执行批量删除
            doBatchRemove(adminIdArray);
        });
    })
</script>
<!--尾部-->
<%@include file="/WEB-INF/include-tail.jsp" %>