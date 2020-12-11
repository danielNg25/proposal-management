/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import models.KienNghi;
import models.PhanHoi;
import models.PhanHoiForUser;

/**
 *
 * @author ACER
 */
public class PhanHoiService {
    
    public static PhanHoi getPhanHoi(int id) throws SQLException, ClassNotFoundException{
        Connection conn = MySqlConnection.getMySqlConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM phan_hoi WHERE id = '" + id + "'");
        
        if(rs == null) {
            return null;
        }
        
        String noiDung = rs.getString("noiDung");
        PhanHoi phanHoi = new PhanHoi(id, noiDung);
        conn.close();
        return phanHoi;
    }
    
    public static List<PhanHoi> getPhanHoi() throws SQLException, ClassNotFoundException{
        Connection conn = MySqlConnection.getMySqlConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM phan_hoi");
        if (rs == null) {
            return null;
        }
        List<PhanHoi> listPhanHoi = new ArrayList<PhanHoi>();
        while (rs.next()) {
            int id = rs.getInt("id");
            String noiDung = rs.getString("noiDung");
 
            PhanHoi phanHoi = new PhanHoi(id, noiDung);
            listPhanHoi.add(phanHoi);
        }
        conn.close();
        return listPhanHoi;
    }
    public static List<PhanHoiForUser> getPhanHoiForUser(int nguoigui_id) throws SQLException, ClassNotFoundException{
        Connection conn = MySqlConnection.getMySqlConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT kien_nghi.tieuDe, phan_hoi.noiDung FROM phan_hoi,kien_nghi,ph_kn"
                    + "WHERE phan_hoi.id = ph_kn.phan_hoi_id AND kien_nghi.id = ph_kn.kien_nghi_id"
                    + "AND kien_nghi.nguoigui_id = '" + nguoigui_id + "'");
               if (rs == null) {
            return null;
        }
        List<PhanHoiForUser> listPhanHoi = new ArrayList<>();
        while (rs.next()) {
            String tieuDeKienNghi = rs.getString("tieuDe");
            String noiDungPhanHoi = rs.getString("noiDung");
            PhanHoiForUser phanHoi = new PhanHoiForUser(nguoigui_id, tieuDeKienNghi, noiDungPhanHoi);
            listPhanHoi.add(phanHoi);
        }
        conn.close();
        return listPhanHoi;
    }
}
