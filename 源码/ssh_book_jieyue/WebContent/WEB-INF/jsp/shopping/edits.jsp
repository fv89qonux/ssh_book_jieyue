<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>图书详情</title>
    <link type="text/css" href="${ctx}/resource/web/css/css.css" rel="stylesheet" />
    <script type="text/javascript" src="${ctx}/resource/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/resource/AJAX.js"></script>
    <script src="${ctx}/resource/assets/layer/layer.js" type="text/javascript"></script>
    <link rel="shortcut icon" href="../favicon.ico">
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/assets/normalize.css" />
    <!-- common styles -->
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/assets/dialog.css" />
    <!-- individual effect -->
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/assets/dialog-cathy.css" />
    <script src="${ctx}/resource/assets/modernizr.custom.js"></script>
    <%--<script type="text/javascript" src="${ctx}/resource/pl/js/demo.js"></script>--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/pl/style.css" />
    <script charset="utf-8" src="${ctx}/resource/ueditor/ueditor.config.js"></script>
    <script charset="utf-8" src="${ctx}/resource/ueditor/ueditor.all.js"></script>
    <script src="${ctx}/resource/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript" src="${ctx}/resource/vue/vue.min.1.0.24.js"></script>
    <script type="text/javascript" src="${ctx}/resource/vue/vue-resource.js"></script>
</head>
<style>
    td{font-size: 12px}
    th{font-size: 12px}

</style>
<script>
    $(function(){
        // 初始化消息输入框
        var um = UE.getEditor('myEditor');
    })

</script>

<script>
    $(function(){
        //.buyimgBig img
        $(".buyimgBig img:first").fadeIn();
        $(".buyimgsmall li:first").addClass("bsi");
        $(".buyimgsmall li").click(function(){
            $(this).addClass("bsi").siblings("li").removeClass("bsi");
            var bsiindex=$(this).index();
            $(".buyimgBig img").eq(bsiindex).fadeIn().siblings(".buyimgBig img").hide();
        })
    })
</script>
<body style="background-color: white">
<div class="hrader" id="header">
    <div class="top">
        <c:if test="${not empty user.realName}">欢迎会员:  ${user.realName}|<a href="${ctx}/login_tuichu.do" style="color:#C94E13;">退出</a></c:if>
        <c:if test="${empty user.realName}"><a href="##" style="color:#C94E13;">
        <a href="shopping_login.do" style="color:#C94E13;">请登录</a>
        <a href="shopping_zhuce.do">注册</a>
        </c:if>
        <ul class="topNav">
            <li><a href="shopping_list.do">首页</a></li>
            <li><a href="bookloan_list.do">我的图书 </a></li>
            <li class="gouwuche"><a href="bookloan_listls.do">历史借阅</a> </li>
            
            
            <div class="clears"></div>
        </ul><!--topNav/-->
    </div><!--top/-->
</div><!--hrader/-->
<div class="mid">
    <h1 class="logo" style="text-align:left;">
        <a href="index.jsp"><img src="${ctx}/resource/web/images/logo.png" width="304" height="74" /></a>
    </h1>
    <form action="shopping_list.do" method="post" class="subBox">
        <div class="subBox2">
            <input type="text" class="subText" name="name"/>
            <input type="image" src="${ctx}/resource/web/images/sub.jpg" width="95" height="32" class="subImg" />
            <div class="hotci">
            </div><!--hotci/-->
        </div><!--subBox2/-->
    </form><!--subBox/-->
    
</div><!--mid-->
<div class="navBox navBg1">
    <ul class="nav">
        <li><a href="shopping_list.do">首页</a></li>
        <li><a href="bookloan_list.do">我的图书</a></li>
        <li><a href="bookloan_listls.do">历史借阅</a></li>
        <div class="clears"></div>
    </ul><!--nav/-->
</div><!--navBox/-->
<div class="bn"><img src="${ctx}/resource/web/images/dingzhi.jpg" width="972" height="167" /></div>
<div class="buyinfo">
    <div class="buyDtl">
        <div class="buyDtlLeft">
            <div class="buyimgBig">
                <img src="${ctx}${bean.fileName1}" width="360" height="360" />
                <img src="${ctx}${bean.fileName2}" width="360" height="360" />
                <img src="${ctx}${bean.fileName3}" width="360" height="360" />
                <img src="${ctx}${bean.fileName4}" width="360" height="360" />
                <img src="${ctx}${bean.fileName5}" width="360" height="360" />
            </div><!--buyimgBig/-->
            <ul class="buyimgsmall">
                <li><img src="${ctx}${bean.fileName1}" width="50" height="50" /></li>
                <li><img src="${ctx}${bean.fileName2}" width="50" height="50" /></li>
                <li><img src="${ctx}${bean.fileName3}" width="50" height="50" /></li>
                <li><img src="${ctx}${bean.fileName4}" width="50" height="50" /></li>
                <li><img src="${ctx}${bean.fileName5}" width="50" height="50" /></li>
            </ul><!--buyimgsmall/-->
        </div><!--buyDtlLeft/-->
        <div class="buyDtlRight">
            <h3>${bean.name}</h3>
            <table class="buyTable">
                <tr>
                    <th width="70" >图书编号</th>
                    <td>${bean.id}</td>
                </tr>
                <tr>
                    <th width="70">图书类型</th>
                    <td>
                        <ul class="buyji">
                            <li>${bean.itemTypeSecondary.name}</li>
                            <div class="clears"></div>
                        </ul><!--buyji/-->
                    </td>
                </tr>
                <tr>
                    <th width="70">借阅次数</th>
                    <td>
                        ${bean.count}
                    </td>
                </tr>
                <tr>
                    <th width="70">所有人</th>
                    <td>
                        ${bean.user.realName}
                    </td>
                </tr>
                <tr>
                    <th width="70">评价次数</th>
                    <td>
                        ${bean.user.pjcs}
                    </td>
                </tr>
            </table><!--buyTable/-->
            <div class="goumai">
                    <a href="##" onclick="addG(${bean.id})" class="buy-gou">立即借阅</a>
            </div><!--goumai/-->
        </div><!--buyDtlRight/-->
        <div class="clears"></div>
    </div><!--buyDtl/-->

    <div class="buyDtl2">
        <ul class="buydel2Eq">
            <li onclick="onShow(1)" style="background-color: #00a0e9; color: white" id="buydlList2">图书描述</li>
            <li onclick="onShow(2)" id="buydlList3">评论</li>
            <div class="clears"></div>
        </ul>
        <div class="buydlList2" style="display: block">
            <table cellpadding="0" cellspacing="1" width="100%" border="0" class="Ptable">
                <tr>
                <tr><tr><td class="tdTitle">图书编号</td>
                <td>${bean.id}</td>
            </tr>
                <tr>
                    <td class="tdTitle">图书类型</td>
                    <td>${bean.itemTypeSecondary.name}</td>
                </tr>
                <tr>
                    <td class="tdTitle">图书描述</td>
                    <td>${bean.js}</td>
                </tr>
                </table>
            <img src="${ctx}${bean.fileName1}" alt=""/>
            <img src="${ctx}${bean.fileName2}" alt=""/>
            <img src="${ctx}${bean.fileName3}" alt=""/>
            <img src="${ctx}${bean.fileName4}" alt=""/>
            <img src="${ctx}${bean.fileName5}" alt=""/>
        </div>
        <%--评论--%>
        <div class="buydlList3" style="display: none">
            <%--评论开始--%>
            <div id="list">
                <div class="box clearfix" v-for="item in comments">
                    <a class="close" href="javascript:;">×</a>
                    <img class="head" src="${ctx}/resource/pl/images/1.jpg" alt=""/>
                    <div class="content">
                        <div class="main">
                            <p class="txt">
                                <span class="user">{{item.jyUser.realName}}：</span>
                                <span v-html="item.nr"></span>
                            </p>
                            <%--<img class="pic" src="${ctx}/resource/pl/images/img1.jpg" alt=""/>--%>
                        </div>
                        <div class="info clearfix">
                            <span class="time">{{item.time.time | time}}</span>
                        </div>
                        <div class="{{item.id}}a">
                            <div class="comment-list" v-for="items in replyComments" v-if="item.id == items.comments.id">
                            <div class="comment-box clearfix" user="self">
                                <img class="myhead" src="${ctx}/resource/pl/images/my.jpg" alt=""/>
                                <div class="comment-content">
                                    <p class="comment-text"><span class="user">{{items.user.realName}}：</span><span v-html="items.nr"></span></p>
                                    <p class="comment-time">
                                        {{items.time.time | time}}
                                        <%--<a href="javascript:;" class="comment-operate">删除</a>--%>
                                    </p>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--评论结束--%>
        </div>
    </div>
</div>
<div class="container">
    <div class="content">
        <div id="somedialog" class="dialog">
            <div class="dialog__overlay"></div>
            <div class="dialog__content">
                <h2><strong id="xinxi"></strong></h2><div>
                <a href="" id="tiaoz"><button class="action buy-mai" data-dialog-close>关闭</button></a>
            </div>
            </div>
        </div>
    </div><!-- /content -->
</div>
<div class="button-wrap" style="display: none">
    <button data-dialog="somedialog" class="buy-mai" id="somedialogs"></button>
</div>
<script src="${ctx}/resource/assets/classie.js"></script>
<script src="${ctx}/resource/assets/dialogFx.js"></script>
<script>
    Vue.filter('time', function (value) {
        function add0(m) {
            return m < 10 ? '0' + m : m
        }
        var time = new Date(parseInt(value));
        var y = time.getFullYear();
        var m = time.getMonth() + 1;
        var d = time.getDate();
        var f = time.getMinutes();
        var mm = time.getSeconds();
        return y + '年' + add0(m) + '月' + add0(d) + "日 " + add0(f) + "分" + add0(mm) + "秒";
    })

    var demo2 = new Vue({
        el: 'body',
        data () {
            return {
                goodsId:${bean.id},
                comments: [],
                replyComments: [],
                url: 'comments_list.do',
                user:'',
                styles:'text-box',
                nr:'评论…',
            }
        },
        ready: function () {
            this.$nextTick(function () {
                this.form()
            })
        },
        methods: {
            plus: function () {
                if (this.styles == 'text-box'){
                    this.styles = 'text-box text-box-on'
                    this.nr = ''
                } else {
                    this.styles = 'text-box'
                    this.nr = '评论...'
                }
            },
            form: function () {
                this.$http.get(this.url, {goodsId: this.goodsId}).then(function (response) {
                    this.comments = response.data.list
                    this.replyComments = response.data.reply
                    this.user = response.data.user
                }).catch(function (response) {
                })
            },
            edit: function () {
                var pf = $('#pf').val();
                var nr  = UE.getEditor('myEditor').getContent().trim();
                if (nr != null && nr != "" && pf != null && pf != ""){
                    this.$http.get("comments_save.do", {goodsId: this.goodsId, nr:nr, pfs:pf}).then(function (response) {
                        layer.msg('发表评论成功', {offset: '400px'});
                        this.comments.push(response.data.bean)
                        this.user = false
                    }).catch(function (response) {
                    })
                } else {
                    layer.msg('请填写完整信息', {offset: '400px'});
                }
            },
            save: function (id) {
                var nr  = $("#" + id).val();
                if (nr != null && nr != ""){
                    this.$http.get("comments_saves.do", {commentsId: id, nrs:nr}).then(function (response) {
                        this.$nextTick(function () {
                            this.form()
                        })
                        layer.msg('发表评论成功', {offset: '400px'});
                    }).catch(function (response) {
                    })
                } else {
                    layer.msg('请填写评论', {offset: '400px'});
                }

            },
        },
    })
</script>
<script>


    function onShow(type) {
        if(type == 1){
            $(".buydlList2").show();
            $(".buydlList3").hide();
            $("#buydlList2").css("background-color", "#00a0e9");
            $("#buydlList2").css("color", "white");
            $("#buydlList3").css("background-color", "#f2f2f2");
            $("#buydlList3").css("color", "black");
        } else {
            $(".buydlList2").hide();
            $(".buydlList3").show();
            $("#buydlList3").css("background-color", "#00a0e9");
            $("#buydlList3").css("color", "white");
            $("#buydlList2").css("background-color", "#f2f2f2");
            $("#buydlList2").css("color", "black");
        }
    }
</script>
<script>
    function addG(id) {
        $.ajax({
            cache: false,
            type: "post",
            url: "goods_loan.do",
            data:{id: id},// 你的formid
            async: false,
            success: function(data){
                if (!data.flag){
                    $('#somedialogs').click();
                    $('#xinxi').html("请先登陆");
                    $('#tiaoz').attr("href","shopping_login.do");
                } else {
                    $('#somedialogs').click();
                    $('#xinxi').html("借阅成功")
                    $('#tiaoz').attr("href","bookloan_list.do");
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                }
            }
        });
    }

    (function() {
        var dlgtrigger = document.querySelector( '[data-dialog]' ),
                somedialog = document.getElementById( dlgtrigger.getAttribute( 'data-dialog' ) ),
                dlg = new DialogFx( somedialog );
        dlgtrigger.addEventListener( 'click', dlg.toggle.bind(dlg) );

    })();
</script>
</body>
</html>
