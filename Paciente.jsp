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
                int recordUpdated = 0;
                ResultSet rset;
            %>

            <fieldset>

                <div id="Paciente">

                    <legend>Cadastro de Paciente</legend><br>
                    <br><label>Nome:</label><br>
                    <input type="text" name="nome" required=""><br>                    
                    <br><label>Data Nascimento: (dd/mm/aaaa)</label><br>
                    <input type="text" name="dt_nasc" required=""><br>
                    <br><label>Telefone: (somente numeros)</label><br>
                    <input type="text" name="telefone" required=""><br>
                    <br><label>Email:</label><br>
                    <input type="text" name="email" required=""><br>                                       
                    <br><label>Senha: </label><br>
                    <input type="password" name="senha" required=""><br>                   
                    <br><label>Convenio:</label><br>
                    <select name="id_convenio">
                        <%
                            sqlStr = "SELECT * FROM  Consultorio_Convenio";                        
                            out.println(sqlStr);
                        
                        rset = ConexaoMySQL.stmConection().executeQuery(sqlStr);
                        
                        while (rset.next()) {
                            out.println("<option value='" + rset.getString("id") + "'>"+rset.getString("descricao")+"</option>");
                        }                            
                        %>
                    </select><br><br>
                </div>

                <button class="but" type="submit" value="Inserir">Inserir</button>
                <button  id="botao2" class="but" type="reset" value="Reset">Limpar</button>
                <br><br><br><a href="Login.jsp">Logoff</a>

                </body>
                </html>
