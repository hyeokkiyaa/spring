<%@ page import="org.example.assignment6.bean.PoolVO" %>
<%@ page import="org.example.assignment6.dao.PoolDAO" %><%--
  Created by IntelliJ IDEA.
  User: khm38
  Date: 2024-11-16
  Time: 오후 8:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Edit Member</title>
    <style>
        .custom-input {
            width: 80%;
            margin: auto;
            display: block;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            margin-left: 5px;
        }

        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .input-box {
            margin-left: 10px;
        }
    </style>
    <script>
        function validateForm() {
            var name = document.getElementById("name").value.trim();
            var age = parseInt(document.getElementById("age").value.trim());
            var phoneNum = document.getElementById("phonenum").value.trim();
            var email = document.getElementById("email").value.trim();
            var gender = document.getElementById("gender").value;
            var type = document.getElementById("type").value;

            if (name === "") {
                alert("Name must be filled out");
                return false;
            }

            if (isNaN(age) || age <= 0) {
                alert("Age must be a positive number");
                return false;
            }

            if (!/^\d{11}$/.test(phoneNum)) {
                alert("Phone number without alphabets and dashes. Only 11 numbers!");
                return false;
            }

            if (email === "") {
                alert("Please enter a valid email address");
                return false;
            }

            if (gender === "") {
                alert("Please select a gender");
                return false;
            }

            if (type === "") {
                alert("Please select a member type");
                return false;
            }

            return true;
        }

    </script>
</head>
<body>
<%
    int memberID = Integer.parseInt(request.getParameter("id"));
%>
<jsp:include page="/views/header.jsper.jsp"/>
<% PoolDAO poolDAO = new PoolDAO();
    PoolVO vo = null;
    try {
        vo = poolDAO.selectPoolMemberById(memberID);
    } catch (Exception e) {
        e.printStackTrace();
    }
    if (vo != null) {
%>

<form action="edit_ok.jsp" method="POST" onsubmit="return validateForm()" class="input-box" enctype="multipart/form-data">
    <h3>Edit Member</h3>

    <input type="hidden" name="id" id="id" value="<%= vo.getId()%>">

    <label for="name">Name</label>
    <input type="text" name="name" id="name" class="custom-input" placeholder="Enter name" value="<%= vo.getName()%>">

    <label for="age">Age</label>
    <input type="number" name="age" id="age" class="custom-input" placeholder="Enter age" value="<%= vo.getAge()%>">

    <label for="phonenum">Phone Number</label>
    <input type="text" name="phonenum" id="phonenum" class="custom-input" placeholder="Enter phone number"
           value="<%= vo.getPhonenum()%>">

    <label for="email">E-mail</label>
    <input type="email" name="email" id="email" class="custom-input" placeholder="Enter email"
           value="<%= vo.getEmail()%>">

    <label for="gender">Gender</label>
    <select name="gender" id="gender" class="custom-input">
        <option value="">Select Gender</option>
        <option value="m" <%= vo.getGender().equals("m") ? "selected" : "" %>>Male</option>
        <option value="f" <%= vo.getGender().equals("f") ? "selected" : "" %>>Female</option>
    </select>


    <label for="type">Type</label>
    <select name="type" id="type" class="custom-input">
        <option value="">Select Type</option>
        <option value="child" <%= vo.getType().equals("child") ? "selected" : "" %>>Child</option>
        <option value="student" <%= vo.getType().equals("student") ? "selected" : "" %>>Student</option>
        <option value="adult" <%= vo.getType().equals("adult") ? "selected" : "" %>>Adult</option>
        <option value="senior" <%= vo.getType().equals("senior") ? "selected" : "" %>>Senior</option>
    </select>
    <br><br>

    <input type="hidden" name="oldfilename" id="oldfilename" value="<%= vo.getFilename()%>">
    <label for="scannedID">Scanned ID</label>
    <br>
    <input type="file" name="scannedID" id="scannedID">
    <br>
    <div id="currentFile">
        <% if (vo.getFilename() != null && !vo.getFilename().isEmpty()) { %>
        Current File: <a href="upload/<%= vo.getFilename() %>" target="_blank"><%= vo.getFilename() %></a>
        <% } else { %>
        No file uploaded.
        <% } %>
    </div>
    <br/><br/>
    <button type="submit">Edit</button>
</form>
<% } else {
%>
<h6> ERROR <h6>
        <%
        }
    %>

    <jsp:include page="/views/footer.jsper.jsp"/>
</body>
</html>
