<%@page import="java.sql.ResultSet"%>
<%@page import="conexao.ConexaoMySQL"%>

<%
    ConexaoMySQL.getConexaoMySQL();
    String sqlStr;
    int recordUpdated;
    ResultSet rset;

    String id_paciente = (String) session.getAttribute("id");
    String id_servico = request.getParameter("id_servico");
    String id_convenio = request.getParameter("id_convenio");
    String data = request.getParameter("data");
    String hora = request.getParameter("hora");

    sqlStr = "UPDATE Consultorio_Orcamento SET id_paciente = " + id_paciente + ",id_servico=" + id_servico + ",id_convenio="+id_convenio+",data='"+data+"',hora='"+hora+"' WHERE id_paciente = '"+id_paciente + "'";
    ConexaoMySQL.stmConection().executeUpdate(sqlStr);

    request.getRequestDispatcher("Main.jsp").forward(request, response);

%>
