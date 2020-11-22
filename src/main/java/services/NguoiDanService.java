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
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.NguoiDan;

/**
 *
 * @author 11
 */
public class NguoiDanService {
    public static NguoiDan getNguoiDan(int userID) throws SQLException, ClassNotFoundException {
        Connection conn = MySqlConnection.getMySqlConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT nguoidan.* FROM nguoidan, users"
                + " WHERE nguoidan.id = users.nguoidan_id and users.id = '" + userID +"'");
        if (rs == null) {
            return null;
        }
        while (rs.next()) {
            int id = rs.getInt("id");
            String hoTen = rs.getString("hoten");
            Date ngaySinh = rs.getDate("ngaySinh");
            String email = rs.getString("email");
            String diaChi = rs.getString("diaChi");
            String soDienThoai = rs.getString("soDienThoai");
            String gioiTinh = rs.getString("gioiTinh");
            String cmnd = rs.getString("cmnd");
            
            NguoiDan nd = new NguoiDan(id, hoTen, ngaySinh, email, diaChi, soDienThoai, gioiTinh, cmnd);
            return nd;
        }
        conn.close();
        return null;
    }
    
    public static void main(String[] args) {
        try {
            NguoiDan nd = NguoiDanService.getNguoiDan(1);
            System.out.println(nd.getHoTen());
        } catch (SQLException ex) {
            Logger.getLogger(NguoiDanService.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(NguoiDanService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
