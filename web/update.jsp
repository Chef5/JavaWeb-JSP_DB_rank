<%-- 
    Document   : update.jsp
    Created on : 2018-12-9, 10:42:58
    Author     : Kmitle
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
    String sid = request.getParameter("sid");
    Connection conn = null;
    PreparedStatement prst = null;
    ResultSet rs = null;
    String url = "jdbc:derby://localhost:1527/sample";
    String driver = "org.apache.derby.jdbc.ClientDriver";
    String user = "app";
    String pwd = "app";
    Class.forName(driver);
    conn = DriverManager.getConnection(url,user,pwd);
    String sql = "select * from NETCLASS where sid=?";
    prst = conn.prepareStatement(sql);
    prst.setString(1,sid);
    rs = prst.executeQuery();
    rs.next();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>增加人选</h3>
        <form action="sql.jsp" method="post">
            <input type="hidden" name="action" value="update"/>
            <input type="hidden" name="sid" value="<%=rs.getString("sid") %>"/>
            学号：<%=rs.getString("sid") %><br>
            姓名：<input type="text" name="name" value="<%=rs.getString("name") %>"/><br>
            NB指数：<input type="text" name="rank" value="<%=rs.getString("rank") %>"/><br>
            <input type="submit" value="提交" /><br>
        </form>
    </body>
    <% 
        rs.close();
        prst.close();
        conn.close();
    %>
</html>
