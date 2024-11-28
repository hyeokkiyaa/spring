<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.assignment5.dao.PoolDAO" %>
<%@ page import="org.example.assignment5.file.FileUpload" %>
<%@ page import="org.example.assignment5.bean.PoolVO" %>

<% request.setCharacterEncoding("utf-8");
  PoolDAO poolDAO = new PoolDAO();
  FileUpload upload = new FileUpload();
  PoolVO u = upload.uploadFile(request,1);
  int i = poolDAO.insertPoolmember(u);
  String msg = "Data added!";
  if (i == 0) msg = "Addition Failed";
%>
<script>
  alert('<%=msg%>');
  location.href = 'index.jsp';
</script>