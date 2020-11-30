/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.KienNghi;

/**
 *
 * @author 11
 */
public class KienNghiService {
    public static KienNghi getKienNghi(int maKienNghi) throws SQLException, ClassNotFoundException{
        Connection conn = MySqlConnection.getMySqlConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM kien_nghi"
                + " WHERE id = '" + maKienNghi + "'");
        if (rs == null) {
            return null;
        }
        while(rs.next()) {
            String tieuDe = rs.getString("tieuDe");
            Date ngayPhanAnh = rs.getDate("ngayPhanAnh");
            String noiDung = rs.getString("noiDung");
            String phanLoai = rs.getString("phanLoai");
            String trangThai = rs.getString("trangThai");
            int nguoigui_id = rs.getInt("nguoigui_id");
            
            KienNghi kienNghi = new KienNghi(maKienNghi, tieuDe, phanLoai, nguoigui_id, ngayPhanAnh, noiDung, trangThai);
            return kienNghi;
        }
        conn.close();
        return null;
        
    }
    
    
    public static List<KienNghi> getKienNghi() throws SQLException, ClassNotFoundException {

        Connection conn = MySqlConnection.getMySqlConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM kien_nghi");
        if (rs == null) {
            return null;
        }
        List<KienNghi> listKienNghi = new ArrayList<KienNghi>();
        while(rs.next()) {
            int maKienNghi = rs.getInt("id");
            String tieuDe = rs.getString("tieuDe");
            Date ngayPhanAnh = rs.getDate("ngayPhanAnh");
            String noiDung = rs.getString("noiDung");
            String phanLoai = rs.getString("phanLoai");
            String trangThai = rs.getString("trangThai");
            int nguoigui_id = rs.getInt("nguoigui_id");
            
            KienNghi kienNghi = new KienNghi(maKienNghi, tieuDe, phanLoai, nguoigui_id, ngayPhanAnh, noiDung, trangThai);
            listKienNghi.add(kienNghi);
        }
        conn.close();
        return listKienNghi;
    }
    
    public static void GuiKienNghi(KienNghi kienNghi) throws SQLException, ClassNotFoundException{
        Connection conn = MySqlConnection.getMySqlConnection();
        String sql = "INSERT INTO kien_nghi (tieuDe, nguoigui_id, ngayPhanAnh, noiDung, trangThai, phanLoai) VALUES (?, ?, ?, ?, ?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, kienNghi.getTieuDe());
        ps.setInt(2, kienNghi.getNguoigui_id());
        ps.setDate(3, (java.sql.Date) kienNghi.getNgayPhanAnh());
        ps.setString(4, kienNghi.getNoiDung());
        ps.setString(5, kienNghi.getTrangThai());
        ps.setString(6, kienNghi.getPhanLoai());
        int i = ps.executeUpdate();
        if(i > 0)
            {
            System.out.println("Da gui thanh cong");
           }
        else
            {
            System.out.println("Da xay ra loi.");
           }
        conn.close();
    }
    
    
    public static void main(String[] args) {
        try {
            KienNghi kienNghi = getKienNghi(1);
            System.out.println(kienNghi);
            GuiKienNghi(kienNghi);
        } catch (SQLException ex) {
            Logger.getLogger(KienNghiService.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(KienNghiService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}