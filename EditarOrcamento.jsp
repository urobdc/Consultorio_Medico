<%
                ConexaoMySQL.getConexaoMySQL();
                int recordUpdated = 0;
                ResultSet rs;
                String id_paciente = "";
                String id_servico = "";
                String id_convenio = "";
                String data = "";
                String hora = "";
                String sqlStr = "";

                String id = (String) session.getAttribute("id");  

                sqlStr = ("select id_paciente,id_servico,data,hora,id_convenio from Consultorio_Orcamento where id= '" + id + "' ;");
                
                rs = ConexaoMySQL.stmConection().executeQuery(sqlStr);

                while (rs.next()) {
                    id_paciente = rs.getString("id_paciente");
                    id_servico = rs.getString("id_servico");
                    id_convenio = rs.getString("id_convenio");
                    data = rs.getString("data");
                    hora = rs.getString("hora");
                }

            %>


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

        <form action="UpdateOrcamento.jsp" method="post">

            <fieldset>

                <div id="orcamento">

                    <legend>Emissao de Orcamento</legend><br>

                    <br><label>Data: (dd/mm/aaaa)</label><br>
                    <input type="text" name="data" required="" value="<%out.println(data);%>"><br>
                    <br><label>Hora: (hh:mm)</label><br>
                    <input type="text" name="hora" required="" value="<%out.println(hora);%>"><br>
                    
                    <br><label>Servico:</label><br>
                    <select name="id_servico">
                        <%
                            sqlStr = "SELECT * FROM  Consultorio_Servico";                        
                            out.println(sqlStr);
                        
                        rs = ConexaoMySQL.stmConection().executeQuery(sqlStr);
                        
                        while (rs.next()) {
                            out.println("<option value='" + rs.getString("id") + "'>"+rs.getString("descricao")+"</option>");
                        }                            
                        %>
                    </select><br>
                    <br><label>Convenio:</label><br>
                    <select name="id_convenio">
                        <%
                            sqlStr = "SELECT * FROM  Consultorio_Convenio";                        
                            out.println(sqlStr);
                        
                        rs = ConexaoMySQL.stmConection().executeQuery(sqlStr);
                        
                        while (rs.next()) {
                            out.println("<option value='" + rs.getString("id") + "'>"+rs.getString("descricao")+"</option>");
                        }                            
                        %>
                    </select><br><br>

                </div>

                <button class="but" type="submit" value="Inserir">Alterar</button>
                <button  id="botao2" class="but" type="reset" value="Reset">Limpar</button>
                <br><br><br><a href="Main.jsp">Menu Inicial</a>
                </body>
                </html>
