<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
            location.href = "<%= request.getContextPath() %>/list";
        }
    </script>
</head>
<body>

<jsp:include page="/WEB-INF/views/header.jsp"/>

<div class="big-box">
    <h3>Member Information</h3>
    <c:if test="${poolVO != null}">
    <c:set var="u" value="${poolVO}"/>
    <h4>Name</h4>
    <br/>
    <div class="custom-table info-box">${u.name}
    </div>
    <br/><br/>

    <h4>Age</h4>
    <br/>
    <div class="custom-table info-box">${u.age}
    </div>
    <br/><br/>

    <h4>Phone number</h4>
    <br/>
    <div class="custom-table info-box">${u.phonenum}
    </div>
    <br/><br/>

    <h4>E-mail</h4>
    <br/>
    <div class="custom-table info-box">${u.email}
    </div>
    <br><br/>

    <h4>Gender</h4>
    <br/>
    <div class="custom-table info-box">${u.gender}
    </div>
    <br><br/>

    <h4>Type</h4>
    <br/>
    <div class="custom-table info-box">${u.type}
    </div>
    <br><br/>

    <button type="button" class="btn btn-primary for-button" onclick="goback()"> Go back to List</button>
</div>

</c:if>

<c:if test="${poolVO == null}">
    <p>NO DATA FOUND</p>
</c:if>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>