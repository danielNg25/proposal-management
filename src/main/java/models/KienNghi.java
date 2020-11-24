/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.util.Date;

/**
 *
 * @author 11
 */
public class KienNghi {
    private int maKienNghi;
    private String tieuDe;
    private String phanLoai;
    private int nguoigui_id;
    private Date ngayPhanAnh;
    private String noiDung;
    private String trangThai;

    public KienNghi(int maKienNghi, String tieuDe, String phanLoai, int nguoigui_id, Date ngayPhanAnh, String noiDung, String trangThai) {
        this.maKienNghi = maKienNghi;
        this.tieuDe = tieuDe;
        this.phanLoai = phanLoai;
        this.nguoigui_id = nguoigui_id;
        this.ngayPhanAnh = ngayPhanAnh;
        this.noiDung = noiDung;
        this.trangThai = trangThai;
    }

    public KienNghi() {
    }

    public KienNghi(String tieuDe, String noiDung) {
        this.tieuDe = tieuDe;
        this.noiDung = noiDung;
    }

    public int getMaKienNghi() {
        return maKienNghi;
    }

    public void setMaKienNghi(int maKienNghi) {
        this.maKienNghi = maKienNghi;
    }

    public String getTieuDe() {
        return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
    }

    public String getPhanLoai() {
        return phanLoai;
    }

    public void setPhanLoai(String phanLoai) {
        this.phanLoai = phanLoai;
    }

    public int getNguoigui_id() {
        return nguoigui_id;
    }

    public void setNguoigui_id(int nguoigui_id) {
        this.nguoigui_id = nguoigui_id;
    }

    public Date getNgayPhanAnh() {
        return ngayPhanAnh;
    }

    public void setNgayPhanAnh(Date ngayPhanAnh) {
        this.ngayPhanAnh = ngayPhanAnh;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }
    
    public String toString() {
        return "Ma kien nghi: " + this.maKienNghi + 
                "\nNguoi gui id: " + this.nguoigui_id +
                "\nTieu de: " + this.tieuDe +
                "\nNoi dung: " + this.noiDung;
    }
}
