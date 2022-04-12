<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <title>List page</title>
    <link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>

<nav class="navbar" style="background-color: darkslategray">
    <div class="container-fluid">
        <a class="navbar-brand text-white" href="#">BoardList</a>
    </div>
</nav>

<div class="table-responsive clearfix">
    <div class="main-content" style="text-align: center">

        <select class="form-select" id="floatingSelect" aria-label="Floating label select example">
            <option selected>Open this select menu</option>
            <option value="1">One</option>
            <option value="2">Two</option>
            <option value="3">Three</option>
        </select>
        <label for="floatingSelect">Works with selects</label>

        <div class="box-content">
            <table class="table table-striped table-hover">
                <tbody>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col" style="width: 20%">등록일</th>
                </tr>
                <c:forEach var="list" items="${boardlist}" step="1">
                <tr>
                    <td>
                    <c:choose>
                        <c:when test="${list.noticeYn eq 'Y'}">공지</c:when>
                        <c:when test="${list.noticeYn eq 'N'}">${list.idx}</c:when>
                    </c:choose>
                        </td>
                    <td> <a href="/board/view.do?idx=${list.idx}">${list.title}</a></td>
                    <td>${list.writer}</td>
                    <td>${list.insertTime}</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="btn_wrap text-right">
            <a href="/board/write.do" class="btn btn-primary waves-effect waves-light">등록</a>
        </div>
    </div>
</div>
</body>
</html>