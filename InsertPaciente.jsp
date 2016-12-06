<%@page import="conexao.ConexaoMySQL"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
    String id = (String) session.getAttribute("id");    

    //conecta com o banco
    ConexaoMySQL.getConexaoMySQL();

    String nome = request.getParameter("nome");
    String dt_nasc = request.getParameter("dt_nasc");
    String telefone = request.getParameter("telefone");
    String email = request.getParameter("email");
    String id_convenio = request.getParameter("id_convenio");
    String  senha = request.getParameter("senha");

    String sqlStr;
    int recordUpdated;    

        //Inserir no BD
        sqlStr = "Insert into Consultorio_Paciente(nome,dt_nasc,telefone,email,id_convenio,adm_permissao,senha)  values ('" + nome + "','" + dt_nasc + "','" + telefone + "','" + email + "'," + id_convenio + ","+ 0 +",'" + senha + "')";

        recordUpdated = ConexaoMySQL.stmConection().executeUpdate(sqlStr);
        out.println("Registro Inserido com sucesso");    

    //Fechar Conexao
    ConexaoMySQL.FecharConexao();
    request.getRequestDispatcher("Main.jsp").forward(request, response); // Direciona a pagina home 
%>