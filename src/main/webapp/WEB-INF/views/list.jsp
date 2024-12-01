<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>

<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .custom-table {
            width: 80%;
            margin: auto;
        }

        @media (max-width: 768px) {
            .custom-table {
                width: 90%;
                margin-left: 5%;
                margin-right: 5%;
            }

        }
    </style>
    <script>
        function searchByName() {
            const name = document.getElementById("namesearch").value.trim();
            if (name) {
                location.href = "poolsearch?name=" + encodeURIComponent(name);
            } else {
                alert("Please enter a name to search.");
            }
        }

        function delete_item(id) {
            if (confirm("Do you want to delete the member?")) {
                location.href = 'deleteok/' + id;
            } else {
                alert("cancel deleting");
            }
        }

        function update_item(id) {
            if (confirm("Do you want to update the member?")) {
                location.href = 'edit/' + id;
            } else {
                alert("cancel editing");
            }
        }

        // Function to handle sort button click
        function sortByName() {
            location.href = "<%= request.getContextPath() %>/sort";
        }
    </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="custom-table">
    <h6 class="custom-table">Total number of members: ${totalMembers}</h6>
    <br>
    <nav class="navbar navbar-expand-lg custom-table">
        <div class="container-fluid">
            <h3>List of members</h3>

            <form id="sortForm" class="d-flex" method="GET">
                <input type="hidden" name="sort" value="">
                <button class="btn btn-outline-success" type="button" onclick="sortByName()">
                    <img src="<%= request.getContextPath() %>/img/sort-alpha-down.svg"/>
                </button>
            </form>

            <div class="d-flex">
                <a class="btn btn-outline-success" href="add">
                    <img src="<%= request.getContextPath() %>/img/plus-lg.svg" alt="plus sign"/>
                </a>
                <input class="form-control me-2 ms-2" type="search" placeholder="Search" name="namesearch" id="namesearch">
                <button class="btn btn-outline-success" onclick="searchByName()">Search</button>
            </div>
        </div>
    </nav>
    <table class="table custom-table table-bordered">
        <thead class="table-info">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Age</th>
            <th scope="col">Phone No.</th>
            <th scope="col">E-Mail</th>
            <th scope="col">Gender</th>
            <th scope="col">Type</th>
            <th scope="col">Scanned ID</th>
            <th scope="col">Edit/Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${not empty list}">
            <c:forEach items="${list}" var="u">

                <tr>
                    <th scope="row">${u.id} </th>
                    <td><a href="view/${u.id}">${u.name}</a></td>
                    <td>${u.age}</td>
                    <td>${u.phonenum}</td>
                    <td>${u.email}</td>
                    <td>${u.gender}</td>
                    <td>${u.type}</td>
                    <td><a onclick="download_file(${u.id} )"><img
                            src="<%= request.getContextPath() %>/img/paperclip.svg" alt="attachment.svg"></a></td>
                    <td class="d-flex mt-1">
                        <a onclick="update_item(${u.id} )"> <img src="<%= request.getContextPath() %>/img/pencil.svg"
                                                                 alt="edit image"></a>
                        <a onclick="delete_item(${u.id} )"> <img src="<%= request.getContextPath() %>/img/trash3.svg"
                                                                 alt="delete" class="ms-2"></a>
                    </td>
                </tr>

            </c:forEach>
        </c:if>


        <c:if test="${empty list}">
            <tr>
                <td colspan="8">No data found.</td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
