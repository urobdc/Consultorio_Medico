<%@page import="java.sql.*"%>
<%@page import="conexao.ConexaoMySQL"%>   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Serviço</title>
        <style>
        </style>
    </head>
    <body>

        <form action="InsertServico.jsp" method="post">            

            <div id="servico">

                <legend>Cadastro de Servico</legend><br>

                <br><label>Tipo do Servico:</label>
                <input type="text" name="descricao" required=""><br>                    
                <br><label>Valor do Servico:</label>
                <input type="text" name="vlr" required=""><br>
            </div>

            <button class="but" type="submit" value="Inserir">Inserir</button>
            <button  id="botao2" class="but" type="reset" value="Reset">Limpar</button>

    </body>
</html>
