<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新闻集导入</title>
</head>

<!-- Bootstrap -->
<link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="../js/DataTables/datatables1.css" rel="stylesheet" />
<link rel="stylesheet" href="../css/jquery.mloading.css">
<link href="../css/style.css" rel="stylesheet">
<!--<link href="css/main.css" rel="stylesheet">-->

<style type="text/css">
    body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
    #allmap {height:600px; width: 70%;float:left;margin:20px 10px 10px 10px}
    #control{width:100%;}
</style>

<body>
    <div class="location" id="div1" style="height: 50px">
        <button id="text" class="btn btn-primary" style="margin-left: 10px;margin-top: 8px">文本</button>
        <button id="excel" class="btn btn-primary" style="margin-left: 10px;margin-top: 8px">表格</button>
        <button id="database" class="btn btn-primary" style="margin-left: 10px;margin-top: 8px">数据库</button>
        <button id="newsset" class="btn btn-danger" style="margin-left: 750px;margin-top: 8px">新闻集</button>
    </div>
    <div>
        <table class="table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th>URL</th>
                    <th>URL描述</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>http://news.hao123.com</td>
                    <td>热点资讯</td>
                </tr>
                <tr>
                    <td>http://news.sina.com.cn</td>
                    <td>新浪新闻</td>
                </tr>
                <tr>
                    <td>http://news.sohu.com</td>
                    <td>搜狐新闻</td>
                </tr>
                <tr>
                    <td>http://news.qq.com</td>
                    <td>腾讯新闻</td>
                </tr>
                <tr>
                    <td>http://news.163.com</td>
                    <td>网易新闻</td>
                </tr>
                <tr>
                    <td>http://news.ifeng.com</td>
                    <td>凤凰资讯</td>
                </tr>
                <tr>
                    <td>http://www.xinhuanet.com</td>
                    <td>新华网</td>
                </tr>
                <tr>
                    <td>http://www.people.com.cn</td>
                    <td>人民网</td>
                </tr>
                <tr>
                    <td>http://www.chinanews.com</td>
                    <td>中国新闻网</td>
                </tr>
                <tr>
                    <td>http://news.cctv.com</td>
                    <td>央视新闻</td>
                </tr>
                <tr>
                    <td>http://www.huanqiu.com</td>
                    <td>环球网</td>
                </tr>
                <tr>
                    <td>http://news.baidu.com</td>
                    <td>百度新闻</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>