<%--
  Created by IntelliJ IDEA.
  User: 81507
  Date: 2018/4/11
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <style>
        html, body{
            width:100%;
            height:100%;
            margin: 0;
            padding: 0;
        }
        .divcss0
        {
            height: 100%;
            width: 100%;
            position: fixed;
            background: url('pictures/p2.jpg');
            background-size:cover;
        }
        .divcss1{
            text-align: center;
            position: absolute;
            left: 70%;
            top: 50%;
            transform: translate(-50%,-50%);}
        .divcss2{
            color: #fff;
            text-align: center;
            position: absolute;
            left:28%;
            top: 45%;
            transform: translate(-50%,-50%);
            font-size: 360%;
            font-family:微软雅黑;
            font-style: italic;
        }
        .divcss5{width:100%; height:50%;overflow:hidden;}
        .divcss6 {width:35%;height: auto ;filter: }
    </style>
</head>
<body>
<div class="divcss0">
</div>
<div class="divcss2">
    <p>欢迎使用</p>
</div>
<div class="divcss1">
<div class="divcss5">
    <p><a href="views/main_Indian.jsp"><img src="pictures/india.jpg" class="divcss6" alt="印度" width=auto; hight=auto; style="border-radius:10%;"/></a>
        <a href="views/main_Japan.jsp"><img src="pictures/japan.jpg" class="divcss6" alt="日本" width=auto; hight=auto; style="border-radius:10%; margin-left:10%"/></a></p>
</div>
</div>
</body>
</html>
