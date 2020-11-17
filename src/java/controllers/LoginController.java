
package controllers;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.annotation.WebServlet;
import models.Users;
import services.MySqlConnection;

public class LoginController {
    
    public static Users currentUser = new Users();
    
    public boolean login(String username, String password) throws SQLException, ClassNotFoundException{
        Connection connection = MySqlConnection.getMySqlConnection();
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM users WHERE username = '" + username + "'");
        if (rs == null) {
            return false;
        }
        while (rs.next()) {                
            if (rs.getString("password") == null ? password == null : rs.getString("password").equals(password)) {
                LoginController.currentUser.setID(rs.getInt("id"));
                LoginController.currentUser.setUserName(rs.getString("username"));
                return true;
            }
        }
        connection.close();
        return false;
    }
}
