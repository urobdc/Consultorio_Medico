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
                int recordUpdated = 0;
                ResultSet rset;
            %>

            <fieldset>

                <div id="Consulta">

                    <legend><h3>Cadastro de Consultas</h3></legend><br>
                    <br><label>Paciente:</label><br>
                    <select name="id_paciente">
                        <%
                            sqlStr = "SELECT * FROM  Consultorio_Paciente";
                            out.println(sqlStr);

                            rset = ConexaoMySQL.stmConection().executeQuery(sqlStr);

                            while (rset.next()) {
                                out.println("<option value='" + rset.getString("id") + "'>" + rset.getString("nome") + "</option>");
                            }
                        %>
                    </select><br>
                    <br><label>Servico:</label><br>
                    <select name="id_servico">
                        <%
                            sqlStr = "SELECT * FROM  Consultorio_Servico";                        
                            out.println(sqlStr);
                        
                        rset = ConexaoMySQL.stmConection().executeQuery(sqlStr);
                        
                        while (rset.next()) {
                            out.println("<option value='" + rset.getString("id") + "'>"+rset.getString("descricao")+"</option>");
                        }                            
                        %>
                    </select><br>
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
                    </select><br>
                    <br><label>Data da Consulta: (dd/mm/aaaa)</label><br>
                    <input type="text" name="dt_consulta" required=""><br>        
                    <br><label>Hora da Consulta: (hh:mm)</label><br>
                    <input type="text" name="hr_consulta" required=""><br><br>
                    
                    <button class="but" type="submit" value="Inserir">Inserir</button>
                    <button  id="botao2" class="but" type="reset" value="Reset">Limpar</button>
                    <br><br><br><a href="Main.jsp">Menu Inicial</a>
                    
                    </body>
                    </html>
            </fieldset>
