<%@ page import="org.example.assignment5.dao.PoolDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>File download</title>
    <script>
        function showAlert(message) {
            alert(message);
            history.back();
        }
    </script>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    PoolDAO pool = new PoolDAO();
    String filename = pool.getFileFilename(id);
    String oFilename = filename;

    String savePath = "upload";
    ServletContext context = request.getServletContext();
    String realPath = context.getRealPath(savePath);
    String sFilepath = realPath + "/" + filename;

    File file = new File(sFilepath);

    if (!file.exists()) {
%>
<script>
    showAlert("File does not exist.");
</script>
<%
    } else {
        FileInputStream in = new FileInputStream(file);
        String sMimeType = request.getServletContext().getMimeType(sFilepath);
        if (sMimeType == null) sMimeType = "application/octet-stream";

        response.setContentType(sMimeType);
        response.setHeader("Content-Disposition", "attachment; filename=" + oFilename);
        ServletOutputStream file1 = response.getOutputStream();
        int numRead;
        byte b[] = new byte[4096];

        while ((numRead = in.read(b, 0, b.length)) != -1) {
            file1.write(b, 0, numRead);
        }
        file1.flush();
        file1.close();
        in.close();
    }
%>
</body>
</html>
