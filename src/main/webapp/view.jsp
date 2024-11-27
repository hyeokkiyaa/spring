<%@ page import="org.example.assignment5.dao.PoolDAO" %>
<%@ page import="org.example.assignment5.bean.PoolVO" %><%--
  Created by IntelliJ IDEA.
  User: khm38
  Date: 2024-11-16
  Time: 오후 8:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View</title>
    <style>
        .custom-table {
            width: 80%;
            margin: auto;
        }

        .info-box {
            background-color: #e0ffff;
            padding: 30px;
            margin-bottom: 0;
        }

        .big-box {
            margin-left: 10%;
        }

        .for-button {
            margin-left: 10%;

            width: 80%;
        }
    </style>
    <script>
        function goback() {
            location.href = "index.jsp";
        }
    </script>
</head>
<body>
<%
    int memberID = Integer.parseInt(request.getParameter("id"));
%>
<jsp:include page="header.jsp"/>
<% PoolDAO poolDAO = new PoolDAO();
    PoolVO vo = null;
    try {
        vo = poolDAO.selectPoolMemberById(memberID);
    } catch (Exception e) {
        e.printStackTrace();
    }
    if (vo != null) {
%>
<div class="big-box">
    <h3>Member Information</h3>

    <h4>Name</h4>
    <br/>
    <div class="custom-table info-box"><%= vo.getName()%>
    </div>
    <br/><br/>

    <h4>Age</h4>
    <br/>
    <div class="custom-table info-box"><%= vo.getAge()%>
    </div>
    <br/><br/>

    <h4>Phone number</h4>
    <br/>
    <div class="custom-table info-box"><%= vo.getPhonenum()%>
    </div>
    <br/><br/>

    <h4>E-mail</h4>
    <br/>
    <div class="custom-table info-box"><%= vo.getEmail()%>
    </div>
    <br><br/>

    <h4>Gender</h4>
    <br/>
    <div class="custom-table info-box"><%= vo.getGender()%>
    </div>
    <br><br/>

    <h4>Type</h4>
    <br/>
    <div class="custom-table info-box"><%=vo.getType()%>
    </div>
    <br><br/>
    <div id="currentFile">
        <% if (vo.getFilename() != null && !vo.getFilename().isEmpty()) { %>
        <h4>Scanned ID</h4>
        <div class="custom-table info-box"><a href="upload/<%= vo.getFilename() %>"
                                              target="_blank"><%= vo.getFilename() %>
        </a>
        </div>
        <% } else { %>
        No file uploaded.
        <% } %>
    </div>
    <br/><br/>
    <button type="button" class="btn btn-primary for-button" onclick="goback()"> Go back to List</button>
</div>
<% } else {
%>
<h6> ERROR <h6>
        <%
        }
    %>

    <jsp:include page="footer.jsp"/>
</body>
</html>