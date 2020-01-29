<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
            <h3>
                <i class="fa fa-arrow-left" onclick="window.history.go(-1)" style="cursor: pointer;"></i>
                更新
            </h3>
            <!-- BASIC FORM ELELEMNTS -->
            <div class="row mt">
                <div class="col-lg-12">
                    <div class="form-panel">
                        <h4 class="mb"><i class="fa fa-angle-right"></i> 表单数据</h4>
                        <form:form class="form-horizontal style-form"
                                   action="admin/update.html"
                                   method="post" modelAttribute="admin">
                            <!-- 模型对象中包含的属性可以使用form:hidden -->
                            <form:hidden path="id"/>
                            <!-- 模型对象中没有的属性不能使用form:hidden -->
                            <input type="hidden" name="pageNum" value="${param.pageNum }"/>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">登录账号</label>
                                <div class="col-sm-10">
                                    <form:input path="loginAccount" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">登录密码</label>
                                <div class="col-sm-10">
                                    <form:input path="userPassword" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">用户昵称</label>
                                <div class="col-sm-10">
                                    <form:input path="userName" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">邮箱地址</label>
                                <div class="col-sm-10">
                                    <form:input path="email" cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label"></label>
                                <button type="submit" class="btn btn-success">
                                    <i class="glyphicon glyphicon-edit"></i> 更新
                                </button>
                                <button type="reset" class="btn btn-danger">
                                    <i class="glyphicon glyphicon-refresh"></i> 重置
                                </button>
                            </div>
                        </form:form>
                    </div>
                </div>
                <!-- col-lg-12-->
            </div>
            <!-- /row -->
        </section>
        <!-- /wrapper -->
    </section>
    <!--main content end-->

    <!--尾部-->
<%@include file="/WEB-INF/include-tail.jsp" %>