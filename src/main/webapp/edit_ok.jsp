<%@ page import="org.example.assignment5.dao.PoolDAO" %>
<%@ page import="org.example.assignment5.file.FileUpload" %>
<%@ page import="org.example.assignment5.bean.PoolVO" %><%--
  Created by IntelliJ IDEA.
  User: khm38
  Date: 2024-11-16
  Time: 오후 8:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Edit_ok</title>
</head>
<body>
<h3>Update data</h3>

<script>
  if (!confirm("Do you want to save the edit?")){
    location.href = "index.jsp";

  }
</script>

<%
  request.setCharacterEncoding("utf-8");
  PoolDAO poolDAO = new PoolDAO();
  FileUpload upload = new FileUpload();
  PoolVO u = upload.uploadFile(request , 2);
  String msg;
  int i = poolDAO.updatePoolMember(u);
  msg = "Data edited";
  if (i == 0) msg = "Failed editing data";
%>

<script>
  alert('<%=msg%>');
  location.href = "index.jsp";
</script>

</body>
</html>