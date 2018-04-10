<%--
  Created by IntelliJ IDEA.
  User: zhangyuxuan
  Date: 18/4/9
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
    <link href="css/jquery-accordion-menu.css" rel="stylesheet" type="text/css"/>
    <link href="css/font-awesome.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery-accordion-menu.js" type="text/javascript"></script>
    <title>google earth test</title>
    <style type="text/css">
        #map {
            height: 100%;
            width: 100%;
        }

        html, body {
            height: 100%;
            width: 100%;
            margin: 0;
            padding: 0;
        }

        #left {
            width: 15%;
            left: 0.67%;
            top: 9.2%;
            position: absolute
        }

        #demo-list a {
            overflow: hidden;
            text-overflow: ellipsis;
            -o-text-overflow: ellipsis;
            white-space: nowrap;
            width: 100%;
        }

        #information {
            display: none;
            width: 30%;
            height: 35%;
            background-color: #292929;
            opacity: 0.8;
            position: absolute;
            right: 2.7%;
            bottom: 0;
            color: #f0f0f0;
            box-shadow: 0 20px 50px #333;
        }

        #title {
            left: 35%;
            position: relative;
            font-size: 20px;
        }

        #detail {
            left: 0%;
            position: relative;
            font-size: 12px;
        }

        #minInf {
            display: block;
            width: 30%;
            height: 3.5%;
            background-color: #292929;
            opacity: 0.8;
            position: absolute;
            right: 2.7%;
            bottom: 0;
            color: #f0f0f0;
            box-shadow: 0 20px 50px #333;
        }

        #minInf i {
            left: 35%;
            position: relative;
            font-size: 20px;
        }
    </style>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery("#jquery-accordion-menu").jqueryAccordionMenu();

        });
        $(function () {
            //顶部导航切换
            $("#demo-list li").click(function () {
                $("#demo-list li.active").removeClass("active")
                $(this).addClass("active");
            })
        })
    </script>
</head>
<body>
<div id="map"></div>
<div>
    <script>
        //定义保留小数点后四位的函数
        function decimal4(value) {
            var value = Math.round(parseFloat(value) * 10000) / 10000;
            var s = value.toString();
            var rs = s.indexOf('.');
            if (rs < 0) {
                rs = s.length;
                s += '.';
            }
            while (s.length <= rs + 4) {
                s += '0';
            }
            return s;
        }
        function initMap() {
            //center 属性指示 API 将地图的中心定在何处。
            //zoom 属性指定地图的缩放比例。 Zoom：0 是最低缩放比例，显示整个地球。 将缩放值设置得更高可以更高分辨率放大地球。
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 7,
                center: {lat: 32.03, lng: 118.85},
                minZoom: 4
            });
            $.getJSON("tag.json", function (data) {
                $.each(data, function (i) {
                    var Position = {lat: data[i].Lat, lng: data[i].Lng};
                    var marker = new google.maps.Marker({
                        //position 属性设置标记的位置。
                        position: Position,
                        map: map,
                        name: data[i].Name
                    });
                    marker.addListener('click', function () {
                        map.setZoom(8);
                        map.setCenter(marker.getPosition());
                        var temp1 = document.getElementById("minInf");
                        temp1.style.display = "none";
                        var temp2 = document.getElementById("information");
                        temp2.style.display = "block";
                        $("#detail").html("&nbsp&nbsp名称：" + marker.name + "<br>")
                        $("#detail").append("&nbsp&nbsp位置：纬度--" + decimal4(marker.getPosition().lat()) + "&nbsp&nbsp&nbsp&nbsp经度--" + decimal4(marker.getPosition().lng()) + "<br>");
                    });
                });
            });
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#information").click(function () {
                var temp1 = document.getElementById("information");
                temp1.style.display = "none";
                var temp2 = document.getElementById("minInf");
                temp2.style.display = "block";
            });
        });
    </script>
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC80PLDzjYCDIyZ5hkBOf7jSaA-yKaDtQ8&callback=initMap">
        /*
         script 从指定网址加载 API。
         callback 参数在 API 加载完毕后执行 initMap 函数。
         async 属性允许浏览器在 API 加载的同时继续渲染页面的其余内容。
         key 参数包含 API 密钥。*/
    </script>
</div>
<div class="content" id="left">
    <div id="jquery-accordion-menu" class="jquery-accordion-menu black">
        <div class="jquery-accordion-menu-header" id="form"></div>
        <ul id="demo-list">
            <li class="active"><a href="#"><i class="fa fa-home"></i>电力系统基础信息采集</a>
                <ul class="submenu">
                    <li><a href="#">深层网络与聚焦网络爬虫</a></li>
                    <li><a href="#">数据时空自动采集分析 </a></li>
                    <li><a href="#">基于深度神经网络的语义分析</a></li>
                </ul>
            </li>
            <li><a href="#"><i class="fa fa-glass"></i>基于图像的目标识别</a>
                <ul class="submenu">
                    <li><a href="#">目标特征识别</a></li>
                </ul>
            </li>
            <li><a href="#"><i class="fa fa-file-image-o"></i>电力系统网络拓扑</a>
                <ul class="submenu">
                    <li><a href="#">地区电网的地理接线图</a></li>
                    <li><a href="#">发电机数据</a></li>
                    <li><a href="#">变压器数据</a></li>
                    <li><a href="#">线路数据</a></li>
                    <li><a href="#">负荷数据</a></li>
                </ul>
            </li>
            <li><a href="#"><i class="fa fa-cog"></i>电力系统评价模型</a>
                <ul class="submenu">
                    <li><a href="#">打击目标影响因素分析</a></li>
                    <li><a href="#">目标决策评估指标体系</a></li>
                    <li><a href="#">打击目标决策问题建模</a></li>
                </ul>
            </li>
        </ul>
        <div class="jquery-accordion-menu-footer">
        </div>
    </div>
</div>
<div id="minInf">
    <i>电力系统信息</i>
</div>
<div id="information">
    <div id="title"><i>电力系统信息</i><br></div>
    <div id="detail"></div>
</div>
</body>
</html>
