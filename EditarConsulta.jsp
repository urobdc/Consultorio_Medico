<%
                ConexaoMySQL.getConexaoMySQL();
                int recordUpdated = 0;
                ResultSet rs;
                String id_paciente = "";
                String id_servico = "";
                String id_convenio = "";
                String dt_consulta = "";
                String hr_consulta = "";
                String sqlStr = "";

                String id = (String) session.getAttribute("id");  

                sqlStr = ("select id_paciente,id_servico,dt_consulta,hr_consulta,id_convenio from Consultorio_Consulta where id= '" + id + "' ;");
                
                rs = ConexaoMySQL.stmConection().executeQuery(sqlStr);

                while (rs.next()) {
                    id_paciente = rs.getString("id_paciente");
                    id_servico = rs.getString("id_servico");
                    id_convenio = rs.getString("id_convenio");
                    dt_consulta = rs.getString("dt_consulta");
                    hr_consulta = rs.getString("hr_consulta");
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
        <title>Convenio</title>
        <style>

        </style>
    </head>
    <body> 
        <form action="UpdateConsulta.jsp" method="post">
            

            <fieldset>

                <div id="Consulta">

                    <legend><h3>Cadastro de Consultas</h3></legend><br>
                    
                    </select><br>
                    <br><label>Servico:</label><br>
                    <select name="id_servico">
                        <%
                            sqlStr = "SELECT * FROM  Consultorio_Servico";
                            out.println(sqlStr);

                            rs = ConexaoMySQL.stmConection().executeQuery(sqlStr);

                            while (rs.next()) {
                                out.println("<option value='" + rs.getString("id") + "'>" + rs.getString("descricao") + "</option>");
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
                                out.println("<option value='" + rs.getString("id") + "'>" + rs.getString("descricao") + "</option>");
                            }
                        %>
                    </select><br>
                    <br><label>Data da Consulta: (dd/mm/aaaa)</label><br>
                    <input type="text" name="dt_consulta" required="" value="<%out.println(dt_consulta);%>"><br>        
                    <br><label>Hora da Consulta: (hh:mm)</label><br>
                    <input type="text" name="hr_consulta" required="" value="<%out.println(hr_consulta);%>"><br><br>

                    <button class="but" type="submit" value="Inserir">Alterar</button>
                    <button  id="botao2" class="but" type="reset" value="Reset">Limpar</button>
                    <br><br><br><a href="Main.jsp">Menu Inicial</a>
            </fieldset>
        </form>
    </body>
</html>
