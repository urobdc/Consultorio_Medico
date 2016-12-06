<%@page import="conexao.ConexaoMySQL"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
    //Conecta com o banco
    ConexaoMySQL.getConexaoMySQL();
    String descricao = request.getParameter("descricao");
    String vlr = request.getParameter("vlr");
    
    //out.println(descricao);
    String sqlStr;
    int recordUpdated;
    //Inserir no BD
    sqlStr = "INSERT INTO Consultorio_Servico(descricao,vlr) VALUES ('" + descricao + "','" + vlr + "')";
    recordUpdated = ConexaoMySQL.stmConection().executeUpdate(sqlStr);    
    out.println("Registro Inserido com sucesso");
    //Fechar Conexao
    ConexaoMySQL.FecharConexao();
    request.getRequestDispatcher("Main.jsp").forward(request, response); // Direciona a pagina home 
%>