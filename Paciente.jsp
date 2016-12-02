<%@page import="java.io.IOException"%>
<%@page import="java.sql.*"%>
<%@page import="conexao.ConexaoMySQL"%>   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Paciente</title>
        <style>

        </style>
    </head>
    <body>

        <form action="InsertPaciente.jsp" method="post">
            <%
                ConexaoMySQL.getConexaoMySQL();
                String sqlStr = "";               
                ResultSet rset;
            %>

            <fieldset>

                <div id="Paciente">

                    <legend>Cadastro de Paciente</legend><br>
                    <br><label>Nome:</label>
                    <input type="text" name="nome" required=""><br>                    
                    <br><label>Data Nascimento:</label>
                    <input type="text" name="dt_nasc" required=""><br>
                    <br><label>Telefone:</label>
                    <input type="text" name="telefone" required=""><br>
                    <br><label>Email:</label>
                    <input type="text" name="email" required=""><br>                   
                    <br><label>Convenio:</label>
                    <%                      
                        sqlStr = "SELECT descricao FROM  Consultorio_Convenio";
                        
                        out.println(sqlStr);
                        
                        rset = ConexaoMySQL.stmConection().executeQuery(sqlStr);
                        
                        while (rset.next()) {
                            out.println(rset.getString("descricao"));
                            out.println("<br>");
                            out.println("<option value='" + rset.getString("id") + "'>" + rset.getString("descricao") + "</option>");
                        }
                    %>

                </div>

                <button class="but" type="submit" value="Inserir">Inserir</button>
                <button  id="botao2" class="but" type="reset" value="Reset">Limpar</button>

                </body>
                </html>
