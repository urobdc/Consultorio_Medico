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
                ResultSet rset;
            %>

            <fieldset>

                <div id="orcamento">

                    <legend>Emissao de Orcamento</legend><br>

                    <br><label>Data:</label>                    
                    <input type="text" name="data" required=""><br>
                    <br><label>Hora:</label>
                    <input type="text" name="hora" required=""><br>
                    <br><label>Paciente:</label>                    
                    <%/*
                        sqlStr = "SELECT * FROM Consultorio_Paciente";

                        out.println(sqlStr);

                        rset = ConexaoMySQL.stmConection().executeQuery(sqlStr);

                        while (rset.next()) {
                            out.println(rset.getString("nome"));
                            out.println("<br>");
                            out.println("<option value='" + rset.getString("id") + "'>" + rset.getString("nome") + "</option>");
                        }
                        */
                    %>

                    <br><label>Servico:</label>
                    <%
                        /*
                        try{
                        sqlStr = "SELECT * FROM  Consultorio_Servico";

                        out.println(sqlStr);

                        rset = ConexaoMySQL.stmConection().executeQuery(sqlStr);

                        while (rset.next()) {
                            out.println(rset.getString("descricao"));
                            out.println("<br>");
                            out.println("vlr");
                            out.println("<option value='" + rset.getString("id") + "'>" + rset.getString("descricao") + "</option>");
                        }
                          }catch(IOException ex){
                            System.out.println("erro: "+ex.getMessage());
                        }
                        */
                    %>
                    <br><label>Convenio:</label>
                    <%
                        /*
                        try{
                        sqlStr = "SELECT * FROM  Consultorio_Convenio";

                        out.println(sqlStr);

                        rset = ConexaoMySQL.stmConection().executeQuery(sqlStr);

                        while (rset.next()) {
                            out.println(rset.getString("descricao"));
                            out.println("<br>");                            
                            out.println("<option value='" + rset.getString("id") + "'>" + rset.getString("descricao") + "</option>");
                        }
                          }catch(IOException ex){
                            System.out.println("erro: "+ex.getMessage());
                        }
                        */
                    %>
                </div>
                <button class="but" type="submit" value="Inserir">Inserir</button>
                <button  id="botao2" class="but" type="reset" value="Reset">Limpar</button>

                </body>
                </html>
