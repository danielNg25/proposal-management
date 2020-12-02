/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import models.ThongKe;
import services.MySqlConnection;


/**
 *
 * @author MSI GV62
 */
public class ThongKeController {
    
    public static ThongKe getThongKeQuy(int quy) throws SQLException, ClassNotFoundException {
        Connection conn = MySqlConnection.getMySqlConnection();
        ThongKe tk = new ThongKe();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM kien_nghi WHERE QUARTER(ngayPhanAnh) = " + quy +" ");
        Statement st1 = conn.createStatement();
        ResultSet rs1 = st1.executeQuery("SELECT DISTINCT phanLoai FROM kien_nghi WHERE QUARTER(ngayPhanAnh)= " + quy +" ");
        while(rs1.next()) {
            tk.CacLoai++;
        }
        while(rs.next()) {
            tk.SoLuong++;
            if (rs.getString("trangThai").equals("chưa trả lời"));
                tk.ChuaTraLoi++;
            if (rs.getString("phanLoai")!=null) 
                tk.DaPhanLoai++;
        }
        tk.DaTraLoi = tk.SoLuong - tk.ChuaTraLoi;
        tk.ChuaPhanLoai = tk.SoLuong - tk.DaPhanLoai;
        rs.close();
        return tk;
    }
    
    public static ThongKe getThongKe() throws SQLException, ClassNotFoundException {
        Connection conn = MySqlConnection.getMySqlConnection();
        ThongKe tk = new ThongKe();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM kien_nghi");
        Statement st1 = conn.createStatement();
        ResultSet rs1 = st1.executeQuery("SELECT DISTINCT phanLoai FROM kien_nghi");
        while(rs1.next()) {
            tk.CacLoai++;
        }
        while(rs.next()) {
            tk.SoLuong++;
            if (rs.getString("trangThai").equals("chưa trả lời"));
                tk.ChuaTraLoi++;
            if (rs.getString("phanLoai")!=null) 
                tk.DaPhanLoai++;
        }
        tk.DaTraLoi = tk.SoLuong - tk.ChuaTraLoi;
        tk.ChuaPhanLoai = tk.SoLuong - tk.DaPhanLoai;
        rs.close();
        return tk;
    }
}
