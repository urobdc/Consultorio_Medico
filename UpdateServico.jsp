<%@page import="java.sql.ResultSet"%>
<%@page import="conexao.ConexaoMySQL"%>

<%
    ConexaoMySQL.getConexaoMySQL();
    String sqlStr;
    int recordUpdated;
    ResultSet rset;
   
    String id =(String) session.getAttribute("id");   
    String descricao  = request.getParameter("descricao");
    String vlr  = request.getParameter("vlr");
    
    
sqlStr = "UPDATE Consultorio_Servico SET descricao = '"+descricao+"', vlr = '"+vlr+"' WHERE id = '"+id+"'";
    ConexaoMySQL.stmConection().executeUpdate(sqlStr);
  
 request.getRequestDispatcher("ConsultaServico.jsp").forward(request, response);


%>
