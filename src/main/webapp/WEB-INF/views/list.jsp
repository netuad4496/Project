<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <title>List page</title>
    <link rel="stylesheet" href="../css/style.css" type="text/css">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>

<nav class="navbar" style="background-color: darkslategray">
    <div class="container-fluid">
        <a class="navbar-brand text-white" href="#">BoardList</a>
    </div>
</nav>

<div class="table-responsive clearfix">
    <div class="main-content" style="text-align: center">

        <div id="adv-search" class="input-group" style="margin-bottom: 30px">
        <form action="/board/list.do">
            <select class="form-control" style="width: 100px;" name="searchType">
                <option value="title" <c:if test="${search.searchType eq 'title'}"> selected </c:if>>제목</option>
                <option value="writer" <c:if test="${search.searchType eq 'writer'}"> selected </c:if>>작성자</option>
                <option value="content" <c:if test="${search.searchType eq 'content'}"> selected </c:if>>내용</option>
            </select>
            <input type="text" name="searchKeyword" style="width:300px" class="form-control" value="${search.searchKeyword}"/>
            <input type="submit" class="btn btn-outline-secondary" value="검색"/>
        </form>
        </div>

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
                        <td><a href="/board/view.do${params.paginationInfo.criteria.makeQueryString(params.paginationInfo.criteria.currentPageNo)}&idx=${list.idx}">${list.title}</a></td>
                        <td>${list.writer}</td>
                        <td>${list.insertTime}</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty boardlist}">
                    <tr>
                        <td colspan="4">조회된 결과가 없습니다.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
        <div class="btn_wrap text-right">
            <a href="/board/write.do" class="btn btn-primary waves-effect waves-light">등록</a>
        </div>
        <jsp:include page="fragments/common.jsp"></jsp:include>
    </div>
</div>
</body>
<script>

    function movePage(queryString) {
        location.href = queryString;
        console.log(location.href);
    }

</script>
</html>

