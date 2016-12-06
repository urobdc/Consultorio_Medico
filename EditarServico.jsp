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

        <%
            ConexaoMySQL.getConexaoMySQL();            
            int recordUpdated = 0;
            ResultSet rs;
            String descricao = "";
            String vlr_servico="";
            String sqlStr = "";

            ConexaoMySQL.getConexaoMySQL();

            String id = (String) session.getAttribute("id");        

            //String id= request.getParameter("id");
            sqlStr = ("select id,descricao,vlr from Consultorio_Convenio where id= '" + id + "' ;");
            //out.println("--    "+ sqlStr);
            
            rs = ConexaoMySQL.stmConection().executeQuery(sqlStr);

            
            while (rs.next()) {
                descricao = rs.getString("descricao");                
                vlr_servico = rs.getString("vlr");
            }
            
            //session.setAttribute("id", id_convenio);
            
            //session.setAttribute("ID_ANIMAL", id_animal2);
            ConexaoMySQL.FecharConexao();

        %>
        <form action="UpdateConvenio.jsp" method="post">
            <fieldset>

                <div id="Convenio">

                    <legend>Cadastro de Convenio</legend><br>
                    <br><label>Nome do Convenio:</label><br>
                    <input type="text" name="descricao" required="" value="<%out.println(descricao);%>"><br><br>      

                    <button class="but" type="submit" value="Inserir">Inserir</button>
                    <button  id="botao2" class="but" type="reset" value="Reset">Limpar</button>
                    <br><br><br><a href="Main.jsp">Menu Inicial</a>

                    </body>
                    </html>
            </fieldset>