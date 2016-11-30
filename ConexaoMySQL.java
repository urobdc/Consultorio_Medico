package conexao;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.SQLException;
import java.sql.Statement;

//Início da classe de conexão//
public class ConexaoMySQL {

    public static String status = "";
    public static Connection connection = null;
    public static Statement stmt = null;
//Método Construtor da Classe//

    public ConexaoMySQL() {

    }
//Método de Conexão//

    public static java.sql.Connection getConexaoMySQL() {

        try {
// Carregando o JDBC Driver padrão
            String driverName = "com.mysql.jdbc.Driver";

            Class.forName(driverName);
// Configurando a nossa conexão com um banco de dados//
            String serverName = "localhost"; //caminho do servidor do BD
            String mydatabase = "mysql"; //nome do seu banco de dados
            String url = "jdbc:mysql://db4free.net:3306/intracker";
            String username = "facfdb"; //nome de um usuário de seu BD
            String password = "facfdb@2016"; //sua senha de acesso
            connection = DriverManager.getConnection(url, username, password);

            stmt = connection.createStatement();

            if (connection != null) {

                status = ("STATUS--->Conectado com sucesso!");
            } else {
                status = ("STATUS--->Não foi possivel realizar conexão");
            }
            return connection;
        } catch (ClassNotFoundException e) { //Driver não encontrado
            System.out.println("O driver expecificado nao foi encontrado.");
            status = ("O driver expecificado nao foi encontrado.");
            return null;
        } catch (SQLException e) {
//Não conseguindo se conectar ao banco
            System.out.println("Nao foi possivel conectar ao Banco de Dados.");
            status = ("Nao foi possivel conectar ao Banco de Dados.");

            return null;
        }
    }

    public static Statement stmConection() throws SQLException {
        stmt = connection.createStatement();
        return stmt;
    }

//Método que retorna o status da sua conexão//
    public static String statusConection() {

        return status;
    }
//Método que fecha sua conexão//

    public static boolean FecharConexao() {

        try {
            ConexaoMySQL.getConexaoMySQL().close();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }
//Método que reinicia sua conexão//

    public static java.sql.Connection ReiniciarConexao() {

        FecharConexao();
        return ConexaoMySQL.getConexaoMySQL();
    }
}
