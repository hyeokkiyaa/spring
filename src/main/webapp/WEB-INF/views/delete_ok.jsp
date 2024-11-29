<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.assignment5.dao.PoolDAO"%>
<%@ page import="org.example.assignment5.bean.PoolVO"%>
<%@ page import="org.example.assignment5.file.FileUpload"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    PoolDAO pool = new PoolDAO();

    pool.deletePoolMember(id);
    response.sendRedirect("index.jsp");
%>