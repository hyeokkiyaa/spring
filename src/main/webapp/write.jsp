<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <title>Add Member</title>
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

    .input-box{
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
<jsp:include page="/header.jsp" />

<form action="write_ok.jsp" method="POST" onsubmit="return validateForm()" class="input-box" enctype="multipart/form-data">
  <h3>Add New Member</h3>

  <label for="name">Name</label>
  <input type="text" name="name" id="name" class="custom-input" placeholder="Enter name">

  <label for="age">Age</label>
  <input type="number" name="age" id="age" class="custom-input" placeholder="Enter age">

  <label for="phonenum">Phone Number</label>
  <input type="text" name="phonenum" id="phonenum" class="custom-input" placeholder="Enter phone number">

  <label for="email">E-mail</label>
  <input type="email" name="email" id="email" class="custom-input" placeholder="Enter email">

  <label for="gender">Gender</label>
  <select name="gender" id="gender" class="custom-input">
    <option value="">Select Gender</option>
    <option value="m">Male</option>
    <option value="f">Female</option>
  </select>

  <label for="type">Type</label>
  <select name="type" id="type" class="custom-input">
    <option value="">Select Type</option>
    <option value="child">Child</option>
    <option value="student">Student</option>
    <option value="adult">Adult</option>
    <option value="senior">Senior</option>
  </select>
  <br><br>

  <label for="scannedID">Scanned ID</label>
  <br>
  <input type="file" name="scannedID" id="scannedID">
  <br/><br/>

  <button type="submit">Add</button>
</form>

<jsp:include page="/footer.jsp" />
</body>
</html>