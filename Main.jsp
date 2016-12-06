<%@page import="conexao.ConexaoMySQL"%>

<%
    ConexaoMySQL.getConexaoMySQL();

    String id = (String) session.getAttribute("id");
    String nome_existente = (String) session.getAttribute("nome");

    //String username = null;
    //String usuario = "";
    //String id="0";
    //id = session.getAttribute("ID") + ""; //Conversao implicita
    /*
    if ((String) session.getAttribute("NOME") != null) {
        username = (String) session.getAttribute("NOME");
        usuario = (String) session.getAttribute("Usuario");
        id = session.getAttribute("ID") + ""; //Conversao implicita
    }*/
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width">
        <title>JS Bin</title>
    </head>
    <body>

        <style>
            a {
                display: block;

                margin: 5px 0 5px 0
            }

            .container {
                width: 32%;
                box-sizing: border-box;
                padding: 10px;
                display: inline-block;

            }


            .centered {
                text-align: center;
            }

        </style>

        <div class="container">
            <h2><%out.println("Bem Vindo " + nome_existente);%><br><%
                out.println("Seu codigo é: " + id);
                %></h2>
            <h1 class="centered">Cadastros</h1>
            <%if (session.getAttribute("nome").equals("root")) {%>
            <a class="centered" href="Convenio.jsp">Cadastro de Convenios</a>
            <a class="centered" href="Servico.jsp">Cadastros de Servicos</a>
            <%}%>
            <a class="centered" href="Paciente.jsp">Cadastros de Paciente</a>
            <a class="centered" href="Orcamento.jsp">Emissao Orcamento</a>
            <a class="centered" href="Consulta.jsp">Marcar Consulta</a>    
        </div>  

        <div class="container">
            <h1 class="centered">Edicoes</h1>
            <%if (session.getAttribute("nome").equals("root")) {%>
            <a class="centered" href="EditarConvenio.jsp">Editar Convenios</a>
            <a class="centered" href="EditarServicos.jsp">Editar Servicos</a>
            <%}%>
            <a class="centered" href="EditarPaciente.jsp">Editar Paciente</a>
            <a class="centered" href="EditarOrcamento.jsp">Alterar Orcamento</a>
            <a class="centered" href="EditarConsulta.jsp">Alterar Consulta</a>    
        </div>

        <div class="container">
            <h1 class="centered">Eclusoes</h1>
            <a class="centered" href="DeletePaciente.jsp">Excluir Paciente</a>
            <a class="centered" href="DeleteOrcamento.jsp">Excluir Orcamento</a>
            <a class="centered" href="DeleteConsulta.jsp">Excluir Consulta</a>    
        </div>
        <br><br><br><br><br>

        <a class="centered" href="Login.jsp">Sair</a>  
    </body>
</html>