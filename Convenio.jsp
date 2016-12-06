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
       
            <%
                ConexaoMySQL.getConexaoMySQL();
                String sqlStr = "";
                int recordUpdated = 0;
                ResultSet rset;
            %>
          <form action="InsertConvenio.jsp?id=id" method="post">
            <fieldset>
                <form
                <div id="Convenio">

                    <legend>Cadastro de Convenio</legend><br>
                    <br><label>Nome do Convenio:</label><br>
                    <input type="text" name="descricao" required=""><br><br>      
                    
                    <button class="but" type="submit" value="Inserir">Inserir</button>
                    <button  id="botao2" class="but" type="reset" value="Reset">Limpar</button>
                    <br><br><br><a href="Main.jsp">Menu Inicial</a>

                    </body>
                    </html>
</fieldset>