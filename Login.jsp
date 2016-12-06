<%@page import="conexao.ConexaoMySQL"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>


<%
    ConexaoMySQL.getConexaoMySQL();

    ResultSet rs;
    String nome1 = request.getParameter("nome");
    String senha2 = request.getParameter("senha");
    

    String sqlStr = "";    
    String nome_existente = "";
    String senha_existente = "";
    String id_existente="";
    
    String dt_nasc = request.getParameter("dt_nasc");
    String telefone = request.getParameter("telefone");
    String email = request.getParameter("email");
    
    

    if (request.getParameter("nome") != "" && request.getParameter("senha") != "") {

        sqlStr = ("select id,nome,dt_nasc,telefone,email,senha from Consultorio_Paciente where nome='" +nome1+ "' and senha ='" +senha2+ "';");
        out.println (sqlStr);
        
        rs = ConexaoMySQL.stmConection().executeQuery(sqlStr);
        
        while (rs.next()) {
            nome_existente = rs.getString("nome");
            senha_existente = rs.getString("senha");
            id_existente = rs.getString("id");
            dt_nasc = rs.getString("dt_nasc");
            telefone = rs.getString("telefone");
            
            email = rs.getString("email");
            
        }

        if (nome_existente.equals(nome1))
        {
            
            session.setAttribute("id", id_existente);
            session.setAttribute("nome", nome_existente);
            session.setAttribute("senha", senha_existente);
            request.getRequestDispatcher("Main.jsp").forward(request, response);
        }
        ConexaoMySQL.FecharConexao();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tela Login</title>]</head>
<body>
    
    <form method="post" action="Login.jsp">
        <center><br><br> Usuario <input name="nome"><br><br><br>
            Senha <input type="password"name="senha"><br><br><br>
            Não é Cadastrado? <a href="Paciente.jsp"> Inscreva-se </a>
            

        <br><br><input type="submit" name="botao" value="Entrar">
        </form>
  </body>
</html>
