/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;
import Bean.KienNghiGopBean;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.KienNghi;
import models.KienNghiGop;
/**
 *
 * @author ACER
 */
public class GopKienNghiService {
    public static KienNghiGop getKienNghiGop(int maKienNghiGop) throws SQLException, ClassNotFoundException{
        Connection conn = MySqlConnection.getMySqlConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM kien_nghi_gop"
                + " WHERE id = '" + maKienNghiGop + "'");
        if (rs == null) {
            return null;
        }
        while(rs.next()) {
            String tieuDeGop = rs.getString("tieuDeGop");
            String noiDungGop = rs.getString("noiDungGop");
            int soLanPA = rs.getInt("soLanPA");
            
            KienNghiGop kienNghiGop = new KienNghiGop(maKienNghiGop, tieuDeGop, noiDungGop, soLanPA);
            return kienNghiGop;
        }
        conn.close();
        return null; 
    }
    
    public static List<KienNghi> getThanhPhan(int maKienNghiGop) throws SQLException, ClassNotFoundException {
        Connection conn = MySqlConnection.getMySqlConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM kien_nghi"
                + " WHERE id IN (SELECT kien_nghi_id FROM kn_kng "
                + "WHERE kien_nghi_gop_id = '" + maKienNghiGop + "')");
        if (rs == null) {
            return null;
        }
        List<KienNghi> listKNTP = new ArrayList<>();
        while(rs.next()) {
            int maKienNghi = rs.getInt("id");
            String tieuDe = rs.getString("tieuDe");
            Date ngayPhanAnh = rs.getDate("ngayPhanAnh");
            String noiDung = rs.getString("noiDung");
            String phanLoai = rs.getString("phanLoai");
            String trangThai = rs.getString("trangThai");
            int nguoigui_id = rs.getInt("nguoigui_id");
            KienNghi kienNghi = new KienNghi(maKienNghi, tieuDe, phanLoai, nguoigui_id, ngayPhanAnh, noiDung, trangThai);
            listKNTP.add(kienNghi);
        }
        conn.close();
        return listKNTP; 
    }
    
    public static List<KienNghiGop> getKienNghiGop()throws SQLException, ClassNotFoundException{
        Connection conn = MySqlConnection.getMySqlConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM kien_nghi_gop");
        if (rs == null) {
            return null;
        }
        List<KienNghiGop> listKienNghiGop = new ArrayList<>();
        while(rs.next()) {
            int maKienNghiGop = rs.getInt("id");
            String tieuDeGop = rs.getString("tieuDeGop");
            String noiDungGop = rs.getString("noiDungGop");
            int soLanPA = rs.getInt("soLanPA");
            
            KienNghiGop kienNghiGop = new KienNghiGop(maKienNghiGop, tieuDeGop, noiDungGop, soLanPA);
            listKienNghiGop.add(kienNghiGop);
        }
        conn.close();
        return listKienNghiGop; 
    }
    
    public static int themKienNghiGop(KienNghiGop kienNghiGop) throws SQLException, ClassNotFoundException {
        int kienNghiGopId;
        try (Connection conn = MySqlConnection.getMySqlConnection()) {
            ResultSet rs = null;
            String sql = "INSERT INTO kien_nghi_gop (tieuDeGop, noiDungGop, soLanPA) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, kienNghiGop.getTieuDeGop());
            ps.setString(2, kienNghiGop.getNoiDungGop());
            ps.setInt(3, kienNghiGop.getSoLanPA());
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            kienNghiGopId = -1;
            while(rs.next()){
                kienNghiGopId = rs.getInt(1);
            }
        }
        return kienNghiGopId;
    }
    
    public static boolean updateKienNghiGopID(int kienNghiID, int kienNghiGopID) throws SQLException, ClassNotFoundException {
        Connection conn = MySqlConnection.getMySqlConnection();
        String sql = "INSERT INTO kn_kng (kien_nghi_id, kien_nghi_gop_id) "
                + "VALUES (?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, kienNghiID);
        ps.setInt(2, kienNghiGopID);
        boolean res = ps.execute();
        conn.close();
        return res;
    }
    
    public static KienNghiGopBean getKienNghiGopBean(int maKienNghiGop) throws SQLException, ClassNotFoundException{
        Connection conn = MySqlConnection.getMySqlConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM kien_nghi"
                + " WHERE id IN (SELECT kien_nghi_id FROM kn_kng "
                + "WHERE kien_nghi_gop_id = '" + maKienNghiGop + "')");
        if (rs == null) {
            return null;
        }
        KienNghiGop kienNghiGop = getKienNghiGop(maKienNghiGop);
        List<KienNghi> listKNTP = new ArrayList<>();
        while(rs.next()) {
            int maKienNghi = rs.getInt("id");
            String tieuDe = rs.getString("tieuDe");
            Date ngayPhanAnh = rs.getDate("ngayPhanAnh");
            String noiDung = rs.getString("noiDung");
            String phanLoai = rs.getString("phanLoai");
            String trangThai = rs.getString("trangThai");
            int nguoigui_id = rs.getInt("nguoigui_id");
            KienNghi kienNghi = new KienNghi(maKienNghi, tieuDe, phanLoai, nguoigui_id, ngayPhanAnh, noiDung, trangThai);
            listKNTP.add(kienNghi);
        }
        conn.close();
        KienNghiGopBean kienNghiGopBean = new KienNghiGopBean(kienNghiGop, listKNTP);
        return kienNghiGopBean;  
    }
    
    public static List<KienNghiGopBean> getKienNghiGopBean() throws SQLException, ClassNotFoundException{
        Connection conn = MySqlConnection.getMySqlConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT id FROM kien_nghi_gop");
        if (rs == null) {
            return null;
        }
        List<KienNghiGopBean> listKNGBean = new ArrayList<>();
        while(rs.next()) {
            int maKienNghiGop = rs.getInt("id");
            KienNghiGopBean kienNghiGopBean = getKienNghiGopBean(maKienNghiGop);
            listKNGBean.add(kienNghiGopBean);
        }
        conn.close();
        return listKNGBean;
    }
    
    public static void xoaKienNghiThanhPhan(int kienNghiTPID, int kienNghiGopID)throws SQLException, ClassNotFoundException{
        Connection conn = MySqlConnection.getMySqlConnection();
        String sql = "DELETE FROM kn_kng "
                + "WHERE kien_nghi_gop_id=? AND kien_nghi_id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, kienNghiGopID);
        ps.setInt(2, kienNghiTPID);
        ps.executeUpdate();
        conn.close();
    }
    
    public static void suaKienNghiGop(int kienNghiGopID, String tieuDeGopMoi, String noiDungGopMoi)throws SQLException, ClassNotFoundException{
        Connection conn = MySqlConnection.getMySqlConnection();
        String sql = "UPDATE kien_nghi_gop "
                + "SET tieuDeGop=?, noiDungGop=? WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, tieuDeGopMoi);
        ps.setString(2, noiDungGopMoi);
        ps.setInt(3, kienNghiGopID);
        ps.executeUpdate();
        conn.close();
    }
    
    public static void updateSoLanPA(int kienNghiGopID, int soLanPA)throws SQLException, ClassNotFoundException{
        Connection conn = MySqlConnection.getMySqlConnection();
        String sql = "UPDATE kien_nghi_gop "
                + "SET soLanPA=? WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, soLanPA);
        ps.setInt(2, kienNghiGopID);
        ps.executeUpdate();
        conn.close();
    }
    
    public static void xoaKienNghiGop(int kienNghiGopID)throws SQLException, ClassNotFoundException{
        Connection conn = MySqlConnection.getMySqlConnection();
        String sql1 = "DELETE FROM kn_kng "
                + "WHERE kien_nghi_gop_id=?";
        String sql2 = "DELETE FROM kien_nghi_gop WHERE id=?";
        PreparedStatement ps;
        ps = conn.prepareStatement(sql1);
        ps.setInt(1, kienNghiGopID);
        ps.executeUpdate();
        
        ps = conn.prepareStatement(sql2);
        ps.setInt(1, kienNghiGopID);
        ps.executeUpdate();
        conn.close();
    }
        
    public static void main(String[] args) {
        try {
            List<KienNghi> listKienNghi = GopKienNghiService.getThanhPhan(35);
            listKienNghi.forEach(kn -> {
                System.out.println(kn.getTieuDe());
            });
        } catch (SQLException ex) {
            Logger.getLogger(GopKienNghiService.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GopKienNghiService.class.getName()).log(Level.SEVERE, null, ex);
        }     
    }
}