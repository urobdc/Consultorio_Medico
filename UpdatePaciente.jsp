<%@page import="java.sql.ResultSet"%>
<%@page import="conexao.ConexaoMySQL"%>

<%
    String id = (String) session.getAttribute("id");    
    
    ConexaoMySQL.getConexaoMySQL();
    String sqlStr;
    int recordUpdated;
    ResultSet rset;
   
    String nome = request.getParameter("nome");
    String dt_nasc = request.getParameter("dt_nasc");
    String telefone = request.getParameter("telefone");
    String email = request.getParameter("email");
    String id_convenio = request.getParameter("id_convenio");
    String  senha = request.getParameter("senha");
    
    
sqlStr = "UPDATE Consultorio_Paciente SET nome = '"+nome+"', dt_nasc = '"+dt_nasc+"', telefone = '"+ telefone + "', email = '"+email+"', senha = '"+senha+"' WHERE id = '"+id+"'";
    ConexaoMySQL.stmConection().executeUpdate(sqlStr);
  
 request.getRequestDispatcher("Main.jsp").forward(request, response);


%>
