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
import java.util.List;
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
        return null;
    }
    
    public static List<KienNghiGop> getKienNghiGop()throws SQLException, ClassNotFoundException{
        Connection conn = MySqlConnection.getMySqlConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM kien_nghi_gop");
        if (rs == null) {
            return null;
        }
        List<KienNghiGop> listKienNghiGop = new ArrayList<KienNghiGop>();
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
    
    public static boolean updateKienNghiGopID(int kienNghiGopID, int kienNghiID) throws SQLException, ClassNotFoundException {
        Connection conn = MySqlConnection.getMySqlConnection();
        String sql = "UPDATE kien_nghi SET kien_nghi_gop_id = ? WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, kienNghiGopID);
        ps.setInt(2, kienNghiID);
        boolean res = ps.execute();
        conn.close();
        return res;
    }
}