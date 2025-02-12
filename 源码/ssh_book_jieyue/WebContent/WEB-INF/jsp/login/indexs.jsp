﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8"/>
    <title>网站后台管理系统 </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="${ctx}/resource/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${ctx}/resource/assets/css/font-awesome.min.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" href="${ctx}/resource/assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <link rel="stylesheet" href="${ctx}/resource/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${ctx}/resource/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="${ctx}/resource/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="${ctx}/resource/css/style.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${ctx}/resource/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${ctx}/resource/assets/js/ace-extra.min.js"></script>
    <!--[if lt IE 9]>
    <script src="${ctx}/resource/assets/js/html5shiv.js"></script>
    <script src="${ctx}/resource/assets/js/respond.min.js"></script>
    <![endif]-->
    <!--[if !IE]> -->
    <script src="${ctx}/resource/js/jquery-1.9.1.min.js"></script>
    <!-- <![endif]-->
    <!--[if IE]>
    <script type="text/javascript">window.jQuery || document.write("<script src='${ctx}/resource/assets/js/jquery-1.10.2.min.js'>" + "<" + "script>");</script>
    <![endif]-->
    <script type="text/javascript">
        if ("ontouchend" in document) document.write("<script src='${ctx}/resource/assets/js/jquery.mobile.custom.min.js'>" + "<" + "script>");
    </script>
    <script src="${ctx}/resource/assets/js/bootstrap.min.js"></script>
    <script src="${ctx}/resource/assets/js/typeahead-bs2.min.js"></script>
    <!--[if lte IE 8]>
    <script src="${ctx}/resource/assets/js/excanvas.min.js"></script>
    <![endif]-->
    <script src="${ctx}/resource/assets/js/ace-elements.min.js"></script>
    <script src="${ctx}/resource/assets/js/ace.min.js"></script>
    <script src="${ctx}/resource/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${ctx}/resource/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="${ctx}/resource/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="${ctx}/resource/assets/layer/layer.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            var cid = $('#nav_list> li>.submenu');
            cid.each(function (i) {
                $(this).attr('id', "Sort_link_" + i);

            })
        })
        jQuery(document).ready(function () {
            $.each($(".submenu"), function () {
                var $aobjs = $(this).children("li");
                var rowCount = $aobjs.size();
                var divHeigth = $(this).height();
                $aobjs.height(divHeigth / rowCount);
            });
            //初始化宽度、高度

            $("#main-container").height($(window).height() - 76);
            $("#iframe").height($(window).height() - 140);

            $(".sidebar").height($(window).height() - 99);
            var thisHeight = $("#nav_list").height($(window).outerHeight() - 173);
            $(".submenu").height();
            $("#nav_list").children(".submenu").css("height", thisHeight);

            //当文档窗口发生改变时 触发
            $(window).resize(function () {
                $("#main-container").height($(window).height() - 76);
                $("#iframe").height($(window).height() - 140);
                $(".sidebar").height($(window).height() - 99);

                var thisHeight = $("#nav_list").height($(window).outerHeight() - 173);
                $(".submenu").height();
                $("#nav_list").children(".submenu").css("height", thisHeight);
            });
            $(document).on('click', '.iframeurl', function () {
                var cid = $(this).attr("name");
                var cname = $(this).attr("title");
                $("#iframe").attr("src", cid).ready();
                $("#Bcrumbs").attr("href", cid).ready();
                $(".Current_page a").attr('href', cid).ready();
                $(".Current_page").attr('name', cid);
                $(".Current_page").html(cname).css({"color": "#333333", "cursor": "default"}).ready();
                $("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display", "none").ready();
                $("#parentIfour").html('').css("display", "none").ready();
            });


        });
        /******/
        $(document).on('click', '.link_cz > li', function () {
            $('.link_cz > li').removeClass('active');
            $(this).addClass('active');
        });
        /*******************/
        //jQuery( document).ready(function(){
        //	  $("#submit").click(function(){
        //	// var num=0;
        //     var str="";
        //     $("input[type$='password']").each(function(n){
        //          if($(this).val()=="")
        //          {
        //              // num++;
        //			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
        //                title: '提示框',
        //				icon:0,
        //          });
        //             // layer.msg(str+=""+$(this).attr("name")+"不能为空！\r\n");
        //             layer.close(index);
        //          }
        //     });
        //})
        //	});

        /*********************点击事件*********************/
        $(document).ready(function () {
            $('#nav_list,.link_cz').find('li.home').on('click', function () {
                $('#nav_list,.link_cz').find('li.home').removeClass('active');
                $(this).addClass('active');
            });
//时间设置
            function currentTime() {
                var d = new Date(), str = '';
                str += d.getFullYear() + '年';
                str += d.getMonth() + 1 + '月';
                str += d.getDate() + '日';
                str += d.getHours() + '时';
                str += d.getMinutes() + '分';
                str += d.getSeconds() + '秒';
                return str;
            }

            setInterval(function () {
                $('#time').html(currentTime)
            }, 1000);
//修改密码
            $('.change_Password').on('click', function () {
                layer.open({
                    type: 1,
                    title: '修改密码',
                    area: ['300px', '300px'],
                    shadeClose: true,
                    content: $('#change_Pass'),
                    btn: ['确认修改'],
                    yes: function (index, layero) {
                        if ($("#password").val() == "") {
                            layer.alert('原密码不能为空!', {
                                title: '提示框',
                                icon: 0,

                            });
                            return false;
                        }
                        if ($("#Nes_pas").val() == "") {
                            layer.alert('新密码不能为空!', {
                                title: '提示框',
                                icon: 0,

                            });
                            return false;
                        }

                        if ($("#c_mew_pas").val() == "") {
                            layer.alert('确认新密码不能为空!', {
                                title: '提示框',
                                icon: 0,

                            });
                            return false;
                        }
                        if (!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val()) {
                            layer.alert('密码不一致!', {
                                title: '提示框',
                                icon: 0,

                            });
                            return false;
                        }
                        else {
                            layer.alert('修改成功！', {
                                title: '提示框',
                                icon: 1,
                            });
                            layer.close(index);
                        }
                    }
                });
            });
            $('#Exit_system').on('click', function () {
                layer.confirm('是否确定退出系统？', {
                            btn: ['是', '否'],//按钮
                            icon: 2,
                        },
                        function () {
                            location.href = "login.jsp";

                        });
            });
        });
        function link_operating(name, title) {
            var cid = $(this).name;
            var cname = $(this).title;
            $("#iframe").attr("src", cid).ready();
            $("#Bcrumbs").attr("href", cid).ready();
            $(".Current_page a").attr('href', cid).ready();
            $(".Current_page").attr('name', cid);
            $(".Current_page").html(cname).css({"color": "#333333", "cursor": "default"}).ready();
            $("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display", "none").ready();
            $("#parentIfour").html('').css("display", "none").ready();


        }
    </script>
</head>
<body>
<div class="navbar navbar-default" id="navbar">
    <script type="text/javascript">
        try {
            ace.settings.check('navbar', 'fixed')
        } catch (e) {
        }
    </script>
    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small>
                    <img src="${ctx}/resource/images/logo.png" width="470px">
                </small>
            </a><!-- /.brand -->
        </div><!-- /.navbar-header -->
        <div class="navbar-header operating pull-left">

        </div>
        <div class="navbar-header pull-right" role="navigation" style="width: 700px">
            <ul class="nav ace-nav">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <span class="time"><em id="time"></em></span><span class="user-info"><small>欢迎光临,</small>
                        ${user.realName}</span>
                        <i class="icon-caret-down"></i>
                    </a>
                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li class="divider"></li>
                         <li><a target="_blank" href="shopping_list.do" ><i class="icon-off"></i>去首页</a></li>
                        <li><a href="login_tuichu.do" id="Exit_system"><i class="icon-off"></i>退出</a></li>
                    </ul>
                </li>


            </ul>
            <!-- <div class="right_info">

               <div class="get_time" ><span id="time" class="time"></span>欢迎光临,管理员</span></div>
                <ul class="nav ace-nav">
                    <li><a href="javascript:ovid(0)" class="change_Password">修改密码</a></li>
                    <li><a href="javascript:ovid(0)" id="Exit_system">退出系统</a></li>

                </ul>
            </div>-->
        </div>
    </div>
</div>
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>
    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>
        <div class="sidebar" id="sidebar">
            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'fixed')
                } catch (e) {
                }
            </script>
            <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                    <a class="btn btn-success">
                        <i class="icon-signal"></i>
                    </a>

                    <a class="btn btn-info">
                        <i class="icon-pencil"></i>
                    </a>

                    <a class="btn btn-warning">
                        <i class="icon-group"></i>
                    </a>

                    <a class="btn btn-danger">
                        <i class="icon-cogs"></i>
                    </a>
                </div>

                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                    <span class="btn btn-success"></span>

                    <span class="btn btn-info"></span>

                    <span class="btn btn-warning"></span>

                    <span class="btn btn-danger"></span>
                </div>
            </div><!-- #sidebar-shortcuts -->
            <div id="menu_style" class="menu_style">
                <ul class="nav nav-list" id="nav_list">
                    <li class="home"><a href="javascript:void(0)" name="user_list.do" class="iframeurl" title=""><i
                            class="icon-home"></i><span class="menu-text"> 系统首页 </span></a></li>
                        <li><a href="#" class="dropdown-toggle"><i class="icon-group"></i><span
                                class="menu-text"> 用户管理 </span><b class="arrow icon-angle-down"></b></a>
                            <ul class="submenu">
                        <c:if test="${role == 'admin'}">
                                <li class="home">
                                    <a href="javascript:void(0)" name="user_list.do" title="用户管理" class="iframeurl">
                                        <i class="icon-double-angle-right"></i>用户列表</a>
                                </li>
                        </c:if>
                                <li class="home">
                                    <a href="javascript:void(0)" name="user_edits.do" title="用户管理" class="iframeurl">
                                        <i class="icon-double-angle-right"></i>个人信息修改</a>
                                </li>
                            </ul>
                        </li>
<c:if test="${role == 'admin'}">
                        <li><a href="#" class="dropdown-toggle"><i class="icon-desktop"></i><span
                                class="menu-text"> 分类管理 </span><b class="arrow icon-angle-down"></b></a>
                            <ul class="submenu">
                                <li class="home">
                                    <a href="javascript:void(0)" name="itemtype_list.do" title="分类管理列表"
                                       class="iframeurl">
                                        <i class="icon-double-angle-right"></i>一级分类管理</a>
                                </li>
                                <li class="home">
                                    <a href="javascript:void(0)" name="itemtypesecondary_list.do" title="分类管理列表"
                                       class="iframeurl">
                                        <i class="icon-double-angle-right"></i>二级分类管理</a>
                                </li>
                            </ul>
                        </li>
</c:if>
                        <li><a href="#" class="dropdown-toggle"><i class="icon-desktop"></i><span
                                class="menu-text"> 图书管理 </span><b class="arrow icon-angle-down"></b></a>
                            <ul class="submenu">
                                <li class="home">
                                    <a href="javascript:void(0)" name="goods_list.do" title="图书管理列表" class="iframeurl">
                                        <i class="icon-double-angle-right"></i>图书管理</a>
                                </li>
<c:if test="${role == 'admin'}">
                                <li class="home">
                                    <a href="javascript:void(0)" name="goods_shlist.do" title="图书管理列表" class="iframeurl">
                                        <i class="icon-double-angle-right"></i>图书审核</a>
                                </li>
</c:if>
                            </ul>
                        </li>
                        <li><a href="#" class="dropdown-toggle"><i class="icon-desktop"></i><span
                                class="menu-text"> 图书借阅管理 </span><b class="arrow icon-angle-down"></b></a>
                            <ul class="submenu">
                                 
                               
<c:if test="${role == 'admin'}">
                                <li class="home">
                                    <a href="javascript:void(0)" name="goods_tjlist.do" title="图书借阅管理" class="iframeurl">
                                        <i class="icon-double-angle-right"></i>借阅统计</a>
                                </li>
</c:if>
                                <li class="home">
                                    <a href="javascript:void(0)" name="usercomments_list.do" title="图书借阅管理" class="iframeurl">
                                        <i class="icon-double-angle-right"></i>评价管理</a>
                                </li>
                                    <%--<li class="home">--%>
                                    <%--<a href="javascript:void(0)" name="laboratory_list2.do" title="实验室列表" class="iframeurl">--%>
                                    <%--<i class="icon-double-angle-right"></i>实验室预约</a>--%>
                                    <%--</li>--%>
                                    <%--<li class="home">--%>
                                    <%--<a href="javascript:void(0)" name="laboratorylog_list.do" title="实验室列表记录" class="iframeurl">--%>
                                    <%--<i class="icon-double-angle-right"></i>实验室预约记录</a>--%>
                                    <%--</li>--%>
                            </ul>
                        </li>
                    <%--<c:if test="${role == 'system'}">--%>
                        <%--<li><a href="#" class="dropdown-toggle"><i class="icon-cogs"></i><span--%>
                                <%--class="menu-text"> 支付管理 </span><b class="arrow icon-angle-down"></b></a>--%>
                            <%--<ul class="submenu">--%>
                                <%--<li class="home"><a href="javascript:void(0)" name="system_list.do" title="支付管理"--%>
                                                    <%--class="iframeurl"><i class="icon-double-angle-right"></i>支付管理</a>--%>
                                <%--</li>--%>
                            <%--</ul>--%>
                        <%--</li>--%>

                        <%--<li>--%>
                            <%--<a href="#" class="dropdown-toggle"><i class="icon-list"></i><span--%>
                                    <%--class="menu-text"> 转账管理 </span><b class="arrow icon-angle-down"></b></a>--%>
                            <%--<ul class="submenu">--%>
                                <%--<li class="home"><a href="javascript:void(0)" name="repair_repairlist.do" title="转账管理"--%>
                                                    <%--class="iframeurl"><i class="icon-double-angle-right"></i>转账管理</a>--%>
                                <%--</li>--%>
                            <%--</ul>--%>
                        <%--</li>--%>
                    <%--</c:if>--%>
                    <%--<li><a href="#" class="dropdown-toggle"><i class="icon-cogs"></i><span--%>
                            <%--class="menu-text"> 消息通知 </span><b class="arrow icon-angle-down"></b></a>--%>
                        <%--<ul class="submenu">--%>
                            <%--<li class="home"><a href="javascript:void(0)" name="" onclick="websocket('${role}')" title="消息通知"--%>
                                                <%--class="iframeurl"><i class="icon-double-angle-right"></i>消息通知</a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                </ul>
            </div>
            <script type="text/javascript">
                function websocket(name) {
                    if (name != null && name != ""){
                        layer.open({
                            type: 2,
                            area: ['900px', '800px'],
                            offset: ['50px', '300px'],
                            scrollbar: true,
                            content: ['user_webSocket.do', 'yes']  //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                        });
                    } else {
                        layer.msg('请先登陆', {icon: 5});
                    }
                }

                $("#menu_style").niceScroll({
                    cursorcolor: "#888888",
                    cursoropacitymax: 1,
                    touchbehavior: false,
                    cursorwidth: "5px",
                    cursorborder: "0",
                    cursorborderradius: "5px"
                });
            </script>
            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
                   data-icon2="icon-double-angle-right"></i>
            </div>
            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'collapsed')
                } catch (e) {
                }
            </script>
        </div>

        <div class="main-content">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="indexs.jsp">首页</a>
                    </li>
                    <li class="active"><span class="Current_page iframeurl"></span></li>
                    <li class="active" id="parentIframe"><span class="parentIframe iframeurl"></span></li>
                    <li class="active" id="parentIfour"><span class="parentIfour iframeurl"></span></li>
                </ul>
            </div>

            <iframe id="iframe" style="border:0; width:100%; background-color:#FFF;" name="iframe" frameborder="0"
                    src="user_list.do"></iframe>


            <!-- /.page-content -->
        </div><!-- /.main-content -->

        <div class="ace-settings-container" id="ace-settings-container">
            <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                <i class="icon-cog bigger-150"></i>
            </div>

            <div class="ace-settings-box" id="ace-settings-box">
                <div>
                    <div class="pull-left">
                        <select id="skin-colorpicker" class="hide">
                            <option data-skin="default" value="#438EB9">#438EB9</option>
                            <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                            <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                            <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                        </select>
                    </div>
                    <span>&nbsp; 选择皮肤</span>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar"/>
                    <label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl"/>
                    <label class="lbl" for="ace-settings-rtl">切换到左边</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container"/>
                    <label class="lbl" for="ace-settings-add-container">
                        切换窄屏
                        <b></b>
                    </label>
                </div>
            </div>
        </div><!-- /#ace-settings-container -->
    </div><!-- /.main-container-inner -->

</div>
<!--底部样式-->

<div class="footer_style" id="footerstyle">
    <script type="text/javascript">try {
        ace.settings.check('footerstyle', 'fixed')
    } catch (e) {
    }</script>
</div>
<!--修改密码样式-->
<div class="change_Pass_style" id="change_Pass">
    <ul class="xg_style">
        <li><label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label><input name="原密码" type="password" class=""
                                                                          id="password"></li>
        <li><label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label><input name="新密码" type="password" class=""
                                                                          id="Nes_pas"></li>
        <li><label class="label_name">确认密码</label><input name="再次确认密码" type="password" class="" id="c_mew_pas"></li>
    </ul>
</div>
<!-- /.main-container -->
<!-- basic scripts -->
</body>
</html>

