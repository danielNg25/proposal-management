/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author MSI GV62
 */
public class KienNghiGop {
    private int maKienNghiGop;
    private String tieuDeGop;
    private String noiDungGop;
    private int soLanPA;

    public KienNghiGop(String tieuDeGop, String noiDungGop, int soLanPA) {
        this.tieuDeGop = tieuDeGop;
        this.noiDungGop = noiDungGop;
        this.soLanPA = soLanPA;
    }

    public KienNghiGop() {
    }

    public KienNghiGop(int maKienNghiGop, String tieuDeGop, String noiDungGop, int soLanPA) {
        this.maKienNghiGop = maKienNghiGop;
        this.tieuDeGop = tieuDeGop;
        this.noiDungGop = noiDungGop;
        this.soLanPA = soLanPA;
    }
    
    public int getMaKienNghiGop() {
        return maKienNghiGop;
    }

    public void setMaKienNghiGop(int maKienNghiGop) {
        this.maKienNghiGop = maKienNghiGop;
    }

    public String getTieuDeGop() {
        return tieuDeGop;
    }

    public void setTieuDeGop(String tieuDeGop) {
        this.tieuDeGop = tieuDeGop;
    }

    public String getNoiDungGop() {
        return noiDungGop;
    }

    public void setNoiDungGop(String noiDungGop) {
        this.noiDungGop = noiDungGop;
    }

    public int getSoLanPA() {
        return soLanPA;
    }

    public void setSoLanPA(int soLanPA) {
        this.soLanPA = soLanPA;
    }
    
}