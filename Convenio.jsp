<%@page import="java.sql.*"%>
<%@page import="conexao.ConexaoMySQL"%>   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Convenio</title>
        <style>
        </style>
    </head>
    <body> 
        <form action="InsertConvenio.jsp" method="post">
            <%
                ConexaoMySQL.getConexaoMySQL();
                String sqlStr = "";
                int recordUpdated = 0;
                ResultSet rset;
            %>
            <fieldset>

                <div id="Convenio">

                    <legend>Cadastro de Convenio</legend><br>
                    <br><label>Nome do Convenio:</label>
                    <input type="text" name="descricao" required=""><br>        

                    <button class="but" type="submit" value="Inserir">Inserir</button>
                    <button  id="botao2" class="but" type="reset" value="Reset">Limpar</button>

                    </body>
                    </html>
            </fieldset>