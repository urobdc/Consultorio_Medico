<%@page import="java.io.IOException"%>
<%@page import="javax.swing.JOptionPane"%>
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
        <form action="InsertConsulta.jsp" method="post">
            <%
                ConexaoMySQL.getConexaoMySQL();
                String sqlStr = "";
                ResultSet rset;
            %>

            <fieldset>

                <div id="Consulta">

                    <legend>Cadastro de Consultas</legend><br>
                    <br><label>Paciente:</label>
                    <%
                        sqlStr = "SELECT * FROM  Consultorio_Paciente";

                        out.println(sqlStr);

                        rset = ConexaoMySQL.stmConection().executeQuery(sqlStr);

                        while (rset.next()) {
                            out.println(rset.getString("nome"));
                            out.println("<br>");
                            out.println("<option value='" + rset.getString("id") + "'>" + rset.getString("nome") + "</option>");
                        }
                    %>
                    <br><label>Servico:</label>
                    <%
                        sqlStr = "SELECT * FROM  Consultorio_Servico";

                        out.println(sqlStr);

                        rset = ConexaoMySQL.stmConection().executeQuery(sqlStr);

                        while (rset.next()) {
                            out.println(rset.getString("descricao"));
                            out.println("<br>");
                            out.println(rset.getString("vlr"));
                            out.println("<option value='" + rset.getString("id") + "'>" + rset.getString("descricao") + "</option>");
                        }
                    %>
                    <br><label>Convenio:</label>
                    <%
                        sqlStr = "SELECT * FROM  Consultorio_Convenio";

                        out.println(sqlStr);

                        rset = ConexaoMySQL.stmConection().executeQuery(sqlStr);

                        while (rset.next()) {
                            out.println(rset.getString("descricao"));
                            out.println("<br>");                            
                            out.println("<option value='" + rset.getString("id") + "'>" + rset.getString("descricao") + "</option>");
                        }
                    %>
                    <input type="text" name="id_servico" required=""><br>
                    <br><label>Data da Consulta:</label>
                    <input type="text" name="dt_consulta" required=""><br>        
                    <br><label>Hora da Consulta:</label>
                    <input type="text" name="hr_consulta" required=""><br>        

                    <button class="but" type="submit" value="Inserir">Inserir</button>
                    <button  id="botao2" class="but" type="reset" value="Reset">Limpar</button>

                    </body>
                    </html>
            </fieldset>