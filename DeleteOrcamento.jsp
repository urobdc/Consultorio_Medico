<%@page import="java.sql.ResultSet"%>
<%@page import="conexao.ConexaoMySQL"%>
<%
     String id_paciente = request.getParameter("id");
    
    ConexaoMySQL.getConexaoMySQL();
    String sqlStr;
    int recordUpdated;
    ResultSet rs;
    
     sqlStr = "DELETE from Consultorio_Orcamento WHERE id_paciente = '"+id_paciente+"'  ";
     out.println(sqlStr);
    ConexaoMySQL.stmConection().execute(sqlStr);
    
     ConexaoMySQL.FecharConexao();
    
    request.getRequestDispatcher("Main.jsp").forward(request, response);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
