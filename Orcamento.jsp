<%@page import="java.io.IOException"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@page import="conexao.ConexaoMySQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Emissão de Orçamento</title>
        <style>

        </style>
    </head>
    <body>

        <form action="InsertOrcamento.jsp" method="post">
            <%
                ConexaoMySQL.getConexaoMySQL();
                String sqlStr = "";
                int recordUpdated = 0;
                ResultSet rset;
            %>

            <fieldset>

                <div id="orcamento">

                    <legend>Emissao de Orcamento</legend><br>

                    <br><label>Data: (dd/mm/aaaa)</label><br>
                    <input type="text" name="data" required=""><br>
                    <br><label>Hora: (hh:mm)</label><br>
                    <input type="text" name="hora" required=""><br>
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
                    </select><br><br>

                </div>

                <button class="but" type="submit" value="Inserir">Inserir</button>
                <button  id="botao2" class="but" type="reset" value="Reset">Limpar</button>
                <br><br><br><a href="Main.jsp">Menu Inicial</a>
                </body>
                </html>
