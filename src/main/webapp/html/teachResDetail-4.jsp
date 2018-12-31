<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>教学资源-案例库</title>
    <meta charset="utf-8">
    <link rel="icon" href="<c:url value='/images/dgut.jpg'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/style/normal.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/style/teachRes/normal.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/style/teachRes/teachResDetail.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/style/teachRes/teachResDetail-4.css'/>">
    <script type="text/javascript" src="<c:url value='/js/teachRes/teachResDetail-4.js'/>"></script>
</head>
<body>
<div id="top">
    <jsp:include page="/html/top.jsp"/>
</div>

<article class="content">

    <section id="banner">
        <img src="<c:url value='/images/index/abouttop_03.jpg'/>">
    </section>
    <section class="mainWrap relative">
        <div class="detailContent">
            <div class="column_1">
                <section class="leftNav">
                    <jsp:include page="/html/left.jsp"/>
                </section>
            </div>
            <div class="column_2 ">
                <article class="mainContent">
                    <header class="contentNav">
                        <nav class="nav">
                            <a href="index.html">首页</a>·
                            <a href="teachResDetail-1.html">教学资源</a>·
                            <a href="teachResDetail-3.html">案例库</a>
                        </nav>
                        <h1>案例库</h1>
                    </header>

                    <div id="resource">
                        <form class="search" action="" method="post">
                            <input class="searchInput" type="search" name="search">
                            <input class="searchSubmit" type="submit" value="文件搜索">
                        </form>
                        <table class="table" border="0" width="800px" cellpadding="2" cellspacing="1">
                            <tr class="firstRow">
                                <td>序号</td>
                                <td>文件名称</td>
                                <td>文件大小</td>
                                <td>上传时间</td>
                                <td>操作</td>
                            </tr>
                            <%--循环遍历资源--%>
                            <c:set var="trType" scope="session" value="${0}"/>
                            <c:forEach items="${requestScope.resources}"  var="resource">
                                <c:choose>
                                    <c:when test="${trType==0}">
                                        <tr class="trOdd">
                                        <c:set var="trType" scope="session" value="${1}"/>
                                    </c:when>
                                    <c:otherwise>
                                        <tr class="tr">
                                        <c:set var="trType" scope="session" value="${0}"/>
                                    </c:otherwise>
                                </c:choose>
                                <td><c:out value="${resource.id}"/></td>
                                <td><c:out value="${resource.resName}"/></td>
                                <td><c:out value="${10000}"/></td>
                                <td><c:out value="${resource.resTime}"/></td>
                                <td>
                                    <a onclick="Preview(event)"><img src="<c:url value='/images/teachResource/preview.png'/>"></a>
                                    <a href="<c:out value="${resource.resPath}"/>" download="<c:out value="${resource.resName}"/>">
                                        <img src="<c:url value='/images/teachResource/download.png'/>">
                                    </a>
                                </td>

                                </tr>
                            </c:forEach>
                        </table>
                        <div class="tranPage">
                            <table>
                                <tr>
                                    <td><a href="javascript:void(0);" onclick="getOnePage('first','');">首页</a></td>
                                    <td><a href="javascript:void(0);" onclick="getOnePage('pre','');">上一页</a></td>
                                    <td>[${requestScope.pageInformation.page}/${requestScope.pageInformation.totalPageCount}]</td>
                                    <td><a href="javascript:void(0);" onclick="getOnePage('next','');">下一页</a></td>
                                    <td><a href="javascript:void(0);" onclick="getOnePage('last','');">尾页</a></td>
                                </tr>
                            </table>
                        </div>
                        <input type="hidden" name="page" id="page" value="${requestScope.pageInformation.page}">
                        <input type="hidden" name="pageSize" id="pageSize" value="${requestScope.pageInformation.pageSize}">
                        <input type="hidden" name="totalPageCount" id="totalPageCount" value="${requestScope.pageInformation.totalPageCount}">
                        <input type="hidden" name="allRecordCount" id="allRecordCount" value="${requestScope.pageInformation.allRecordCount}">
                        <input type="hidden" name="orderField" id="orderField" value="${requestScope.pageInformation.orderField}">
                        <input type="hidden" name="order" id="order" value="${requestScope.pageInformation.order}">
                        <input type="hidden" name="ids" id="ids" value="${requestScope.pageInformation.ids}">
                        <input type="hidden" name="searchSql" id="searchSql" value="${requestScope.pageInformation.searchSql}">
                        <input type="hidden" name="result" id="result" value="${requestScope.pageInformation.result}">
                        </form>
                    </div>
                </article>
            </div>
        </div>
    </section>
</article>


<div id="bottom">
    <jsp:include page="/html/bottom.jsp"/>
</div>

<div id="copyrights">
    <jsp:include page="/html/bottom.jsp"/>
</div>
</body>
<script>
    var liList=document.getElementById("leftUl").children;
    for(var i=0;i<liList.length;i++){
        if(i==3)
            liList[i].setAttribute("class","current");
    }
</script>
</html>