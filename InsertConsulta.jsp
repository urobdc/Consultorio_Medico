<%@page import="conexao.ConexaoMySQL"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orçamento</title>
        <style>

        </style>
    </head>
    <body>
        <%
            ConexaoMySQL.getConexaoMySQL();

            String id_paciente = request.getParameter("id_paciente");
            String id_servico = request.getParameter("id_servico");
            String id_convenio = request.getParameter("id_convenio");
            String dt_consulta = request.getParameter("dt_consulta");
            String hr_consulta = request.getParameter("hr_consulta");
            int situacao=1;

            String sqlStr;
            int recordUpdated;

                //Inserir no BD
                sqlStr = "Insert into Consultorio_Consulta(id_paciente,id_servico,dt_consulta,hr_consulta,id_convenio,situacao)  values ('" + id_paciente + "','" + id_servico + "','" + dt_consulta + "','" + hr_consulta + "','" + id_convenio + "','" + situacao +"')";                

                recordUpdated = ConexaoMySQL.stmConection().executeUpdate(sqlStr);
                out.println("Registro Inserido com sucesso");

                ConexaoMySQL.FecharConexao();
                request.getRequestDispatcher("Main.jsp").forward(request, response); // Direciona a pagina home 
        %>

    </body>
</html>
