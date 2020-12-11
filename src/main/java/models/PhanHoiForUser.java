/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author ACER
 */
public class PhanHoiForUser {
    private int nguoigui_id;
    private String tieuDeKienNghi;
    private String noiDungPhanHoi;

    public PhanHoiForUser() {
    }

    public PhanHoiForUser(int nguoigui_id, String tieuDeKienNghi, String noiDungPhanHoi) {
        this.nguoigui_id = nguoigui_id;
        this.tieuDeKienNghi = tieuDeKienNghi;
        this.noiDungPhanHoi = noiDungPhanHoi;
    }

    public int getNguoigui_id() {
        return nguoigui_id;
    }

    public void setNguoigui_id(int nguoigui_id) {
        this.nguoigui_id = nguoigui_id;
    }

    public String getTieuDeKienNghi() {
        return tieuDeKienNghi;
    }

    public void setTieuDeKienNghi(String tieuDeKienNghi) {
        this.tieuDeKienNghi = tieuDeKienNghi;
    }

    public String getNoiDungPhanHoi() {
        return noiDungPhanHoi;
    }

    public void setNoiDungPhanHoi(String noiDungPhanHoi) {
        this.noiDungPhanHoi = noiDungPhanHoi;
    }
    
}