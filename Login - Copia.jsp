<%@page import="conexao.ConexaoMySQL"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>


<%
    ConexaoMySQL.getConexaoMySQL();

    ResultSet rs;
    String nome = request.getParameter("nome");
    String senha = request.getParameter("senha");

    String sqlStr = "";
    String nome_existente = "";
    String senha_existente = "";
    String id = "";

    if (request.getParameter("nome") != "" && request.getParameter("senha") != "") {

        sqlStr = ("select id,nome,senha from Consultorio_Paciente where nome='"+nome+"' and senha='"+senha+"';");
        out.println(sqlStr);

        rs = ConexaoMySQL.stmConection().executeQuery(sqlStr);
        
        while (rs.next())
        {
            nome_existente = rs.getString("nome");
            out.println(nome_existente);
            senha_existente = rs.getString("senha");
            id = rs.getString("id");
            out.println(id);
        }

        if (nome_existente.equals(nome))// && senha_existente.equals(senha))
        {
            out.println("Cadastro Encontrado");
            out.println("Bem Vindo " + nome_existente);
            session.setAttribute("id", id);
            session.setAttribute("nome", nome_existente);
            //session.setAttribute("senha_existente", senha_existente);
            request.getRequestDispatcher("Main.jsp").forward(request, response);
        }
        ConexaoMySQL.FecharConexao();
    } else {
        out.println("erro");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tela Login</title>
    </head>


    <body>

        <form method="get" action="Main.jsp" name="formulario">
            <center><br><br> Usuario <input type="login" name="login"><br><br><br>
                Senha <input type="password" value="" name="senha"><br><br><br>
                Não é Cadastrado? <a href="Paciente.jsp"> Inscreva-se </a>


                <br><br><input type="submit" name="botao" value="Entrar">
                </form>
                </body>
                </html>
