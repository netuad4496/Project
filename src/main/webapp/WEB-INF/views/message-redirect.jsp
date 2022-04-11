<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
</head>
<body>
<form <c:if test = "${params != null}"/> name="dataForm" action="${redirectUri}" method="${method}"  style="display: none;">
    <input <c:forEach var = "key" items="${params.keySet()}" /> type="hidden" name="${key}" value="${params.get(key)}" />
</form>

    <script>
        window.onload = function() {
            var message = "${message}";
            if (message != null && message != "") {
                alert(message);
            }
            var params = "${params}";
            if (params != null && params != "") {
                document.dataForm.submit();
            } else {
                var redirectUri = "${redirectUri}";
                location.href = redirectUri;
            }
        }
    </script>

</body>
</html>