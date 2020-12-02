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
import models.ThongKe;

/**
 *
 * @author MSI GV62
 */
public class ThongKeService {
    public static ThongKe getInfo() throws SQLException, ClassNotFoundException {
        Connection conn = MySqlConnection.getMySqlConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM kien_nghi");
        Statement st1 = conn.createStatement();
        ResultSet rs1 = st1.executeQuery("SELECT DISTINCT phanLoai FROM kien_nghi");
        int CacLoai = 0;
        int SoLuong = 0;
        int ChuaTraLoi = 0;
        int DaPhanLoai = 0;
        int DaTraLoi;
        int ChuaPhanLoai;
        while(rs1.next()) {
            CacLoai++;
        }
        while(rs.next()) {
            SoLuong++;
            if (rs.getString("trangThai").equals("chưa trả lời"));
                ChuaTraLoi++;
            if (rs.getString("phanLoai")!=null) 
                DaPhanLoai++;
        }
        DaTraLoi = SoLuong - ChuaTraLoi;
        ChuaPhanLoai = SoLuong - DaPhanLoai;
        ThongKe tk = new ThongKe(SoLuong, DaTraLoi, ChuaTraLoi, CacLoai, DaPhanLoai, ChuaPhanLoai);
        conn.close();
        return tk;
    }
    
     public static ThongKe getThongKeQuy(int quy) throws SQLException, ClassNotFoundException {
        Connection conn = MySqlConnection.getMySqlConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM kien_nghi WHERE QUARTER(ngayPhanAnh) = " + quy +" ");
        Statement st1 = conn.createStatement();
        ResultSet rs1 = st1.executeQuery("SELECT DISTINCT phanLoai FROM kien_nghi WHERE QUARTER(ngayPhanAnh)= " + quy +" ");
        int CacLoai = 0;
        int SoLuong = 0;
        int ChuaTraLoi = 0;
        int DaPhanLoai = 0;
        int DaTraLoi;
        int ChuaPhanLoai;
        while(rs1.next()) {
            CacLoai++;
        }
        while(rs.next()) {
            SoLuong++;
            if (rs.getString("trangThai").equals("chưa trả lời"));
                ChuaTraLoi++;
            if (rs.getString("phanLoai")!=null) 
                DaPhanLoai++;
        }
        DaTraLoi = SoLuong - ChuaTraLoi;
        ChuaPhanLoai = SoLuong - DaPhanLoai;
        ThongKe tk = new ThongKe(SoLuong, DaTraLoi, ChuaTraLoi, CacLoai, DaPhanLoai, ChuaPhanLoai);
        conn.close();
        return tk;
    }
}
    

