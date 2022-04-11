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
        <a class="navbar-brand text-white" href="#">View</a>
    </div>
</nav>

<div class="table-responsive clearfix">
    <div class="main-content">
        <div class="card-content">
            <form class="form-horizontal form-view">
                <div class="form-group">
                    <label class="col-sm-2 control-label">제목</label>
                    <div class="col-sm-10">
                        <p class="form-control">${boardview.title}</p>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">내용</label>
                    <div class="col-sm-10">
                        <p class="form-control">${boardview.content}</p>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">작성자</label>
                    <div class="col-sm-10">
                        <p class="form-control">${boardview.writer}</p>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">등록일</label>
                    <div class="col-sm-10">
                        <p class="form-control">${boardview.insertTime}</p>
                    </div>
                </div>
            </form>
            <div class="btn_wrap text-center">
                <a href="/board/list.do" class="btn btn-default waves-effect waves-light">뒤로가기</a>
<%--                <input type="button" onclick="deleteDemo(${demo.idx});" class="btn btn-danger waves-effect waves-light" value="삭제하기"></input>--%>
                <a href="/board/write.do?idx=${boardview.idx}" class="btn btn-primary waves-effect waves-light">수정하기</a>
            </div>
        </div>
    </div>
</div>
</body>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</html>

