<%@page import="conexao.ConexaoMySQL"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
    ConexaoMySQL.getConexaoMySQL();
//Dados do servico
    String descricao = request.getParameter("descricao");
    String vlr = request.getParameter("vlr");

    String sqlStr;
    int recordUpdated;
    //Inserir no BD
    sqlStr = "Insert into Consultorio_Servico(descricao,vlr)  values (''" + descricao + "','" + vlr + "'')";

    recordUpdated = ConexaoMySQL.stmConection().executeUpdate(sqlStr);
    out.println("Registro Inserido com sucesso");
//Fechar Conexao
    ConexaoMySQL.FecharConexao();
    request.getRequestDispatcher("Main.jsp").forward(request, response);
%>