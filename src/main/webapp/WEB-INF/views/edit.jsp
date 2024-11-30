<%@ page import="org.example.assignment6.bean.PoolVO" %>
<%@ page import="org.example.assignment6.dao.PoolDAO" %><%--
  Created by IntelliJ IDEA.
  User: khm38
  Date: 2024-11-16
  Time: 오후 8:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!--jstl setting-->
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
        window.onload = function () {
            let valG = '${poolVO.gender}';
            let valT = '${poolVO.type}';
            let selT = document.querySelector("select[name=type]").options;
            let selG = document.querySelector("select[name=gender]").options;
            for (let i = 0; i < selG.length; i++) {
                if (selG[i].value === valG) selG[i].selected = true;
            }
            for (let i = 0; i < selT.length; i++) {
                if (selT[i].value === valT) selT[i].selected = true;
            }
        };


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

<jsp:include page="/WEB-INF/views/header.jsp"/>

<%--@elvariable id="poolVO" type="org.example.assignment6.bean.PoolVO"--%>
<form:form action="../editok" method="POST" onsubmit="return validateForm()" class="input-box" modelAttribute="poolVO">
    <h3>Edit Member</h3>
    <form:hidden path="id"/>

    <label for="name">Name</label>
    <form:input path="name" id="name" class="custom-input" placeholder="Enter name"/>

    <label for="age">Age</label>
    <form:input path="age" id="age" class="custom-input" placeholder="Enter age"/>

    <label for="phonenum">Phone Number</label>
    <form:input path="phonenum" id="phonenum" class="custom-input" placeholder="Enter phone number"/>

    <label for="email">E-mail</label>
    <form:input path="email" id="email" class="custom-input" placeholder="Enter email"/>

    <label for="gender">Gender</label>
    <form:select path="gender" id="gender" class="custom-input" name="gender">
        <option value="m">Male</option>
        <option value="f">Female</option>
    </form:select>


    <label for="type">Type</label>
    <form:select path="type" id="type" class="custom-input" name="type">
        <option value="child">Child</option>
        <option value="student">Student</option>
        <option value="adult">Adult</option>
        <option value="senior">Senior</option>
    </form:select>


    <br><br>

    <label for="scannedID">Scanned ID</label>
    <br>
    <input type="file" name="scannedID" id="scannedID">
    <br/><br/>

    <button type="submit">Save</button>
</form:form>

<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
