<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%> <%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>  <%-- for Struts2 --%> 

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="UTF-8">
  <script src="../../dist/list.js"></script>
  <link rel="stylesheet" href="style.css" />
</head>
<body>

<img src="http://qr-official.line.me/L/8jlgOkH75B.png">

  <script>
    var options = {
      valueNames: [
        'name',
        'born',
        { data: ['id'] },
        { attr: 'src', name: 'image' },
        { attr: 'href', name: 'link' },
        { attr: 'data-timestamp', name: 'timestamp' }
      ]
    };
    var userList = new List('users', options);
    userList.add({ name: 'Leia', born: '1954', image: 'leia.jpeg', id: 5, timestamp: '67893' });
  </script>
</body>
</html>
