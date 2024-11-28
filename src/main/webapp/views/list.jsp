<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.assignment5.dao.PoolDAO" %>
<%@ page import="org.example.assignment5.bean.PoolVO" %>
<%@ page import="java.util.ArrayList" %>
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
  </style>
  <script>
    function delete_item(id) {
      if (confirm("Do you want to delete the member?")) {
        location.href = 'delete_ok.jsp?id=' + id;
      } else {
        alert("cancel deleting");
      }
    }
    function update_item(id) {
      if (confirm("Do you want to update the member?")) {
        location.href = 'edit.jsp?id=' + id;
      } else {
        alert("cancel editing");
      }
    }

    function download_file(id){
      location.href = 'filedownload.jsp?id=' + id;
    }

    // Function to handle sort button click
    function sortByName() {
      var form = document.getElementById('sortForm');
      form.sort.value = 'name';
      form.submit();
    }
  </script>
</head>
<body>
<%
  PoolDAO dao = new PoolDAO();
  int size = dao.totalNum();
%>
<h6 class="custom-table">Total number of members: <%= size %></h6>
<br>
<nav class="navbar navbar-expand-lg custom-table">
  <div class="container-fluid">
    <h3>List of members</h3>

    <form id="sortForm" class="d-flex" action="index.jsp" method="GET">
      <input type="hidden" name="sort" value="">
      <button class="btn btn-outline-success" type="button" onclick="sortByName()">
        <img src="img/sort-alpha-down.svg" />
      </button>
    </form>

    <form class="d-flex" action="index.jsp" method="GET" role="search">
      <a class="btn btn-outline-success" href="write.jsp">
        <img src="img/plus-lg.svg" alt="plus sign" />
      </a>
      <input class="form-control me-2 ms-2" type="search" placeholder="Search" name="name" value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>">
      <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
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
  <%
    PoolDAO poolDAO = new PoolDAO();
    ArrayList<PoolVO> lists = null;
    String name = request.getParameter("name");
    String sort = request.getParameter("sort");

    try {
      if (name != null && !name.isEmpty()){
        lists = poolDAO.selectPoolMemberByName(name);
      } else if ("name".equals(sort)) {
        lists = poolDAO.selectAllPoolSortedByName();
      } else {
        lists = poolDAO.selectAllPool();
      }
    } catch (Exception e) {
      e.printStackTrace();
    }

    if (lists != null && !lists.isEmpty()) {
      for (PoolVO vo : lists) {
  %>
  <tr>
    <th scope="row"><%= vo.getId() %></th>
    <td><a href="view.jsp?id=<%= vo.getId() %>"><%= vo.getName() %></a></td>
    <td><%= vo.getAge() %></td>
    <td><%= vo.getPhonenum() %></td>
    <td><%= vo.getEmail() %></td>
    <td><%= vo.getGender() %></td>
    <td><%= vo.getType() %></td>
    <td><a onclick="download_file(<%= vo.getId() %>)"><img src="img/paperclip.svg" alt="attachment.svg"></a></td>
    <td class="d-flex mt-1">
      <a onclick="update_item(<%= vo.getId() %>)"> <img src="img/pencil.svg" alt="edit image"></a>
      <a onclick="delete_item(<%= vo.getId() %>)"> <img src="img/trash3.svg" alt="delete" class="ms-2"></a>
    </td>
  </tr>
  <%
    }
  } else {
  %>
  <tr>
    <td colspan="8">No data found.</td>
  </tr>
  <%
    }
  %>
  </tbody>
</table>
</body>
</html>
