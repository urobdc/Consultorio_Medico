<%@page import="conexao.ConexaoMySQL"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>


<%
    //conexao com o banco
    ConexaoMySQL.getConexaoMySQL();

    String usuario = request.getParameter("usuario");
    String senha = request.getParameter("senha");

    ResultSet rs;
    String sqlStr = "";    
    String usuario_existente = "";
    String senha_existente = "";

    //validacao p/ usuario e senha
    if (request.getParameter("usuario") != "" && request.getParameter("senha") != "") {

        sqlStr = ("select usuario from Consultorio_Login where usuario='" + usuario + "' and senha='" + senha + "';");
        rs = ConexaoMySQL.stmConection().executeQuery(sqlStr);
        
        while (rs.next()) {
            usuario_existente = rs.getString("usuario");
            senha_existente = rs.getString("senha");            
        }
        
        if (usuario_existente.equals(usuario)) {
            out.println("Cadastro Encontrado");            
            session.setAttribute("login: ", usuario_existente);
            request.getRequestDispatcher("Main.jsp").forward(request, response);
        }
        ConexaoMySQL.FecharConexao();
    }    

%>

<body>
    
    <form method="get" action="Login.jsp">
    <center><br><br> Usuario <input type='login' name='login'>
        Senha <input type='password' value=''>

        <br><br><input type='submit' name='botao' value='Entrar'>
        </body>
        </html>
