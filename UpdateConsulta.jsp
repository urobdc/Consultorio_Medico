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
    String dt_consulta = request.getParameter("dt_consulta");
    String hr_consulta = request.getParameter("hr_consulta");

    sqlStr = "UPDATE Consultorio_Consulta SET id_paciente = " + id_paciente + ",id_servico=" + id_servico + ",id_convenio="+id_convenio+",dt_consulta='"+dt_consulta+"',hr_consulta='"+hr_consulta+"' WHERE id_paciente = '"+id_paciente + "'";
    ConexaoMySQL.stmConection().executeUpdate(sqlStr);

    request.getRequestDispatcher("Main.jsp").forward(request, response);

%>
