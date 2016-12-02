<%@page import="conexao.ConexaoMySQL"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>


<%
    ConexaoMySQL.getConexaoMySQL();

    ResultSet rs;
    String login = request.getParameter("login");
    String password = request.getParameter("senha");

    String sqlStr = "";    
    String login_existente = "";
    String pass_existente = "";

    

    if (request.getParameter("login") != "" && request.getParameter("password") != "") {

        sqlStr = ("select usuario,senha from Consultorio_Login where USUARIO='" + login + "' and senha ='" + password + "';");
      
        //out.println(sqlStr);
        rs = ConexaoMySQL.stmConection().executeQuery(sqlStr);

        while (rs.next()) {
            login_existente = rs.getString("usuario");
            pass_existente = rs.getString("senha");            
        }

        if (login_existente.equals(login)) 
        {
            out.println("Cadastro Encontrado");            
            out.println("Bem Vindo "+ login_existente);
            request.getRequestDispatcher("Main.jsp").forward(request, response);
        }
        ConexaoMySQL.FecharConexao();
    }

%>

<body>
    
    <form method="get" action="Login.jsp">
        <center><br><br> Usuario <input type='login' name='login'><br><br><br>
            Senha <input type='password' value='' name="senha"><br><br><br>
            Não é Cadastrado? <a href="Paciente.jsp"> Inscreva-se </a>
            

        <br><br><input type='submit' name='botao' value='Entrar'>
        </body>
        </html>
