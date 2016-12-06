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
            String sqlStr = "";
            int recordUpdated = 0;
            ResultSet rs;
            //String descricao = "";

            String id = (String) session.getAttribute("id");

            //String id= request.getParameter("id");
            sqlStr = ("select id, nome,dt_nasc,telefone,email,senha from Consultorio_Paciente where id= '" + id + "' ;");
            //out.println("--    "+ sqlStr);
            rs = ConexaoMySQL.stmConection().executeQuery(sqlStr);

            String nome = "";
            String dt_nasc = "";
            String telefone = "";
            String email = "";
            String senha = "";
            String id_existente="";

            while (rs.next()) {
                nome = rs.getString("nome");
                dt_nasc = rs.getString("dt_nasc");
                telefone = rs.getString("telefone");
                email = rs.getString("email");
                senha = rs.getString("senha");
                id_existente = rs.getString("id");
            }

            //session.setAttribute("ID_ANIMAL", id_animal2);
            ConexaoMySQL.FecharConexao();
        %>
        <form action="UpdatePaciente.jsp" method="post">
            <fieldset>

                <div id="Paciente">

                    <legend>Cadastro de Paciente</legend><br>
                    <br><label>Nome:</label><br>
                    <input type="text" name="nome" required="" value="<%out.println(nome);%>"><br>                    
                    <br><label>Data Nascimento: (dd/mm/aaaa)</label><br>
                    <input type="text" name="dt_nasc" required="" value="<%out.println(dt_nasc);%>"><br>
                    <br><label>Telefone: (somente numeros)</label><br>
                    <input type="text" name="telefone" required="" value="<%out.println(telefone);%>"><br>
                    <br><label>Email:</label><br>
                    <input type="text" name="email" required="" value="<%out.println(email);%>"><br>                                       
                    <br><label>Senha: </label><br>
                    <input type="password" name="senha" required="" value="<%out.println(senha);%>"><br>                                                           
                </div>

                <button class="but" type="submit" value="Inserir">Inserir</button>
                <button  id="botao2" class="but" type="reset" value="Reset">Limpar</button>
                <br><br><br><a href="Login.jsp">Menu Inicial</a>
        </form>
    </body>
</html>