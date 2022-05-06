<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>

<nav class="navbar" style="background-color: darkslategray">
    <div class="container-fluid">
        <a class="navbar-brand text-white" href="#">Write</a>
    </div>
</nav>
<div class="container">
    <form class="form-horizontal" action="RegisApi" name="ListupForm" method="post">
        <input type="hidden"
        <c:if test="${params != null}"></c:if> name="idx" value="${param.idx}">
        <div class="form-group">
            <div class="col-sm-8" style="margin-top: 10px;">
                <p class="col-md-8">공지글 여부 <input type="checkbox" name="noticeYn" value="Y" <c:if
                        test="${params.noticeYn eq 'Y'}"> checked </c:if> /></p>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-8" style="margin-top: 10px;">
                <p class="col-md-8">제목 <input type="text" class="form-control" aria-describedby="basic-addon3"
                                              name="title" value="${params.title}"/>
                </p>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-8" style="margin-top: 10px;">
                <p class="col-md-8">내용 <input type="text" class="form-control" aria-describedby="basic-addon3"
                                              name="content" value="${params.content}"/>
                </p>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-8" style="margin-top: 10px;">
                <p class="col-md-8">작성자 <input type="text" class="form-control" aria-describedby="basic-addon3"
                                               name="writer" value="${params.writer}"/>
                </p>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-8" style="margin-top: 10px;">
                <a href="/board/list.do?currentPageNo=${param.currentPageNo}&recordsPerPage=${param.recordsPerPage}&pageSize=${param.pageSize}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}"
                   class="btn btn-default waves-effect waves-light">뒤로가기</a>
                <input type="submit" class="btn btn-primary waves-effect waves-light" value="저장"/>
            </div>
        </div>
    </form>
</div>
</body>
<script>
</script>
</html>

