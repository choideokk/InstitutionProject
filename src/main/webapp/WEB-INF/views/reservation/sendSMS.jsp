<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Send SMS</title>
</head>
<body>
    <h1>Send an SMS Message</h1>
    <form action="" method="post">
        <label for="receiverNumber">Phone Number:</label><br>
        <input type="text" id="receiverNumber" name="receiverNumber" placeholder="Enter the receiver's phone number"><br>
        <input type="submit" value="Send SMS">
    </form>
</body>
</html>