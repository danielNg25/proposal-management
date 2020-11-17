package services;

import java.sql.*;

public class MySqlConnection {
    public static Connection getMySqlConnection() throws SQLException, ClassNotFoundException {
        String hostName = "localhost";
        String dbName = "quan_ly_kien_nghi";
        String userName = "root";
        String password = "";
        return getMySqlConnection(hostName, dbName, userName, password);
    }
    
    public static Connection getMySqlConnection(String hostName, String dbName, String userName, String password) 
        throws SQLException, ClassNotFoundException{
        //Class.forName("com.mysql.jdbc.Driver");
        String connectionUrl = "jdbc:mysql://" + hostName + ":3306/" + dbName + "?useUnicode=true&characterEncoding=utf-8";
        Connection conn = DriverManager.getConnection(connectionUrl, userName, password);
        return conn;
    }
}
