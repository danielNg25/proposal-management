/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import models.User;

/**
 *
 * @author 11
 */
public class UserService {
    public static int validateLogin(String username, String password) throws SQLException, ClassNotFoundException {
        Connection conn = MySqlConnection.getMySqlConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM users WHERE username = '" + username +"'");
        if (rs == null) {
            return -1;
        }
        while (rs.next()) {
            if (rs.getString("password").equals(password)) {
                if (rs.getString("role").equals("admin")) return 0;
                    else return rs.getInt("id");
            }
        }
        conn.close();
        return -1;
    }
    
    public static User getUser() {
        return null;
    }
}
