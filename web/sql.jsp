<%-- 
    Document   : sql
    Created on : 2018-12-9, 9:24:21
    Author     : Kmitle
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
    String action = request.getParameter("action");
    Connection conn = null;
    PreparedStatement prst = null;
    ResultSet rs = null;
    String url = "jdbc:derby://localhost:1527/sample";
    String driver = "org.apache.derby.jdbc.ClientDriver";
    String user = "app";
    String pwd = "app";
    Class.forName(driver);
    conn = DriverManager.getConnection(url,user,pwd);
    if(action==null || action.equals("")){
        try{
            String sid = request.getParameter("sid");
            String name = request.getParameter("name");
            String rank = request.getParameter("rank");
            String sql = "insert into NETCLASS(SID,NAME,RANK) values(?,?,?)";
            prst = conn.prepareStatement(sql);
            prst.setString(1,sid);
            prst.setString(2,name);
            prst.setString(3,rank);
            prst.executeUpdate();
        }
        finally{
            prst.close();
            conn.close();
            response.sendRedirect("index.jsp");
        }
    }
    else if(action.equals("delete")){
        try{
            String sid = request.getParameter("sid");
            String sql = "delete from NETCLASS where sid=?";
            prst = conn.prepareStatement(sql);
            prst.setString(1,sid);
            prst.executeUpdate();
        }finally{
            prst.close();
            conn.close();
            response.sendRedirect("index.jsp");
        }
    }
    else if(action.equals("update")){
        try{
            String sid = request.getParameter("sid");
            String name = request.getParameter("name");
            String rank = request.getParameter("rank");
            String sql = "update NETCLASS set name=?,rank=? where sid=?";
            prst = conn.prepareStatement(sql);
            prst.setString(1,name);
            prst.setString(2,rank);
            prst.setString(3,sid);
            prst.executeUpdate();
        }
        finally{
            prst.close();
            conn.close();
            response.sendRedirect("index.jsp");
        }
    }
    else{
        response.sendRedirect("index.jsp");
    }
%>
