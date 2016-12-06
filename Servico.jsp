<%@page import="java.sql.*"%>
<%@page import="conexao.ConexaoMySQL"%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Convenio</title>
        <style>
        </style>
    </head>
    <body> 
        <form action="InsertServico.jsp" method="post">
            <%
                ConexaoMySQL.getConexaoMySQL();
                String sqlStr = "";
                int recordUpdated = 0;
                ResultSet rset;
            %>
            <fieldset>

                <div id="Servico">

                    <legend>Cadastro de Servico</legend><br>
                    <br><label>Descricao do Servico:</label><br>
                    <input type="text" name="descricao" required=""><br>        
                    <br><label>Valor do Servico:</label><br>
                    <input type="text" name="vlr" required=""><br><br>       
                    
                    <button class="but" type="submit" value="Inserir">Inserir</button>
                    <button  id="botao2" class="but" type="reset" value="Reset">Limpar</button>
                    <br><br><br><a href="Main.jsp">Menu Inicial</a>

                    </body>
                    </html>
</fieldset>