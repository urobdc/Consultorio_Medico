<%@page import="java.sql.ResultSet"%>
<%@page import="conexao.ConexaoMySQL"%>

<%
    ConexaoMySQL.getConexaoMySQL();
    String sqlStr;
    int recordUpdated;
    ResultSet rset;
   
    String id_convenio =(String) session.getAttribute("id");   
    String descricao  = request.getParameter("descricao");
    
    
sqlStr = "UPDATE Consultorio_Convenio SET descricao = '"+descricao+"' WHERE id = '"+id_convenio+"'";
    ConexaoMySQL.stmConection().executeUpdate(sqlStr);
  
 request.getRequestDispatcher("Main.jsp").forward(request, response);


%>
