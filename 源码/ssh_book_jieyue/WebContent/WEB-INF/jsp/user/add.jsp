<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link href="${ctx}/resource/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${ctx}/resource/css/style.css"/>
    <link rel="stylesheet" href="${ctx}/resource/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${ctx}/resource/assets/css/font-awesome.min.css" />
    <link href="${ctx}/resource/Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="${ctx}/resource/assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${ctx}/resource/assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="${ctx}/resource/js/jquery-1.9.1.min.js"></script>
    <script src="${ctx}/resource/assets/js/bootstrap.min.js"></script>
    <title>添加产品分类</title>
</head>
<style>
    .form-label{width: 90px}
</style>
<body>
<div class="type_style">
    <div class="type_content">
        <form action="user_save.do" method="post" class="form form-horizontal" id="form-user-add" >
            <div class="Operate_cont clearfix">
                <label class="form-label">登陆名：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" value="" placeholder=""  name="name" id="name">
                </div>
            </div>
            <div class="Operate_cont clearfix">
                <label class="form-label">真实姓名：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" value="" placeholder=""  name="realName" id="realName">
                </div>
            </div>
            <div class="Operate_cont clearfix">
                <label class="form-label">手机号码：</label>
                <div class="formControls ">
                    <input type="number" class="input-text" value="" placeholder=""  name="phone" id="phone">
                </div>
            </div>
            <div class="Operate_cont clearfix">
                <label class="form-label">所属班级：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" value="" placeholder=""  name="bj" id="bj">
                </div>
            </div>
            <div class="Operate_cont clearfix">
                <label class="form-label">所属系：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" value="" placeholder=""  name="ssx" id="ssx">
                </div>
            </div>
            <div class="Operate_cont clearfix">
                <label class="form-label">所属专业：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" value="" placeholder=""  name="zy" id="zy">
                </div>
            </div>
            <div class="Operate_cont clearfix">
                <label class="form-label">学号：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" value="" placeholder=""  name="xh" id="xh">
                </div>
            </div>
            <div class="Operate_cont clearfix">
                <label class="form-label">密码：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" value="" placeholder=""  name="pass" id="pass">
                </div>
            </div>
            <div class="Operate_cont clearfix">
                <label class="form-label">权限：</label>
                <div class="formControls">
                    <select name="role.id" id="ws">
                        <option value="" selected="selected">请选择</option>
                        <c:forEach items="${pagers.datas}" var="c" varStatus="l">
                        <option value="${c.id}">${c.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="">
                <div class="" style=" text-align:center">
                    <input class="btn btn-primary radius" type="button" value="提交" onclick="sub()" >
                </div>
            </div>
        </form>
    </div>
</div>
</div>
<script type="text/javascript" src="${ctx}/resource/Widget/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="${ctx}/resource/assets/layer/layer.js"></script>
<script type="text/javascript" src="${ctx}/resource/js/H-ui.js"></script>
<script type="text/javascript" src="${ctx}/resource/js/H-ui.admin.js"></script>
<script type="text/javascript">
    function sub() {
        var name = $('#name').val();
        var realName = $('#realName').val();
        var number = $('#number').val();
        var phone = $('#phone').val();
        var xy = $('#xy').val();
        var bj = $('#bj').val();
        var pass = $('#pass').val();
        var ws = $('#ws').val();
        var bj = $('#bj').val();
        var xh = $('#xh').val();
        var ssx = $('#ssx').val();
        var zy = $('#zy').val();
        if (name == null || name == ""){
            msg("请输入登陆名");
            return false;
        } else if (realName == null || realName == ""){
            msg("请输入真实姓名");
            return false;
        } else  if (phone == null || phone == "") {
            msg("请输入电话");
            return false;
        } else  if (bj == null || bj == "") {
            msg("请输入班级");
            return false;
        } else  if (ssx == null || ssx == ""){
            msg("请输入所属系");
            return false;
        } else  if (zy == null || zy == "") {
            msg("请输入所属专业");
            return false;
        }  else  if (xh == null || xh == "") {
            msg("请输入学号");
            return false;
        } else  if (pass == null || pass == ""){
            msg("密码不能为空");
            return false;
        } else  if (ws == null || ws == ""){
            msg("请选择权限");
            return false;
        } else {
            $.ajax({
                cache: false,
                type: "post",
                url: "user_save.do",
                data:$('#form-user-add').serialize(),// 你的formid
                async: false,
                success: function(data){
                    if (data.flag){
                        layer.msg('注册成功', {
                            icon: 1,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        }, function(){
                            window.parent.location.reload();
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                            window.location.href = data.url;
                        });
                    } else {
                        layer.msg('帐号不可用', {
                            icon: 1,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        }, function(){
                        });
                    }
                }
            });
        }
    }
</script>
<script>
    function msg(data) {
        layer.msg(data, {
            icon: 1,
            time: 2000 //2秒关闭（如果不配置，默认是3秒）
        }, function(){
        });
    }
</script>
</body>
</html>