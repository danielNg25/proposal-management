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

/**
 *
 * @author MSI GV62
 */
public class ThongKeService {
    public static int SoLuong;
    public static int DaTraLoi;
    public static int ChuaTraLoi;
    public static int CacLoai;
    public static int DaPhanLoai;   
    public static int ChuaPhanLoai;
    public ThongKeService() throws SQLException, ClassNotFoundException {
        SoLuong = 0;
        DaPhanLoai = 0;
        DaTraLoi = 0;
        CacLoai = 0;
        ChuaPhanLoai = 0;
        ChuaTraLoi = 0;
        Connection conn = MySqlConnection.getMySqlConnection();
        getInfo(conn);
    }
    public static void getInfo(Connection conn) throws SQLException, ClassNotFoundException {
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM kien_nghi");
        Statement st1 = conn.createStatement();
        ResultSet rs1 = st1.executeQuery("SELECT DISTINCT phanLoai FROM kien_nghi");
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
        rs.close();
    }
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        ThongKeService tk = new ThongKeService();
        System.out.println(tk.SoLuong);
    }
}
    

