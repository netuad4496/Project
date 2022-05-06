<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
        <%--페이징--%>
        <nav>
            <ul class="pagination" id="pageInfo">
                <li <c:if test="${params.paginationInfo.hasPreviousPage == true}">><a href="javascript:void(0)" onclick="movePage('${params.paginationInfo.criteria.makeQueryString(1)}')">&laquo;</a></c:if></li>
                <li <c:if test="${params.paginationInfo.hasPreviousPage == true}">><a href="javascript:void(0)" onclick="movePage('${params.paginationInfo.criteria.makeQueryString(params.paginationInfo.firstPage - 1)}')">&lsaquo;</a></c:if></li>

                <c:forEach var="pageNum" begin="${params.paginationInfo.firstPage}" end="${params.paginationInfo.lastPage}">
                    <li class="${params.paginationInfo.criteria.currentPageNo == pageNum ?  "active":"" }"><a href="javascript:void(0)" onclick="movePage('${params.paginationInfo.criteria.makeQueryString(pageNum)}')">${pageNum}</a></li>
                </c:forEach>

                <li <c:if test="${params.paginationInfo.hasNextPage == true}">><a href="javascript:void(0)" onclick="movePage('${params.paginationInfo.criteria.makeQueryString(params.paginationInfo.lastPage + 1)}')">&rsaquo;</a></c:if></li>
                <li <c:if test="${params.paginationInfo.hasNextPage == true}">><a href="javascript:void(0)" onclick="movePage('${params.paginationInfo.criteria.makeQueryString(params.paginationInfo.totalPageCount)}')">&raquo;</a></c:if></li>
            </ul>
        </nav>
    </div>
</div>
</body>

</html>